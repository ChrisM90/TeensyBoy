/* TeenyBoy code is placed under the MIT license
   Copyright (c) 2017 Chris Mortimer

   Permission is hereby granted, free of charge, to any person obtaining
   a copy of this software and associated documentation files (the
   "Software"), to deal in the Software without restriction, including
   without limitation the rights to use, copy, modify, merge, publish,
   distribute, sublicense, and/or sell copies of the Software, and to
   permit persons to whom the Software is furnished to do so, subject to
   the following conditions:

   The above copyright notice and this permission notice shall be
   included in all copies or substantial portions of the Software.

   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
   NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
   BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
   ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
   CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
   SOFTWARE.
*/

#include "Arm7.h"
#include "ILI9341_t3DMA.h"
#include <SD.h>
#include <SD_t3.h>
#include <SPI.h>

Processor processor;

File FROM;

#define SCREEN_WIDTH  ILI9341_TFTWIDTH
#define SCREEN_HEIGHT ILI9341_TFTHEIGHT
#define TFT_DC      15
#define TFT_CS      10
#define TFT_RST     27
#define TFT_MOSI    11
#define TFT_SCLK    13
#define TFT_MISO    12

#define WIN0H 0x40
#define WIN1H 0x42
#define WIN0V 0x44
#define WIN1V 0x46
#define WININ 0x48
#define WINOUT 0x4A

#define BG0CNT 0x8
#define BG1CNT 0xA
#define BG2CNT 0xC
#define BG3CNT 0xE

#define BG2X_L 0x28
#define BG2X_H 0x2A
#define BG2Y_L 0x2C
#define BG2Y_H 0x2E

#define BG3X_L 0x38
#define BG3X_H 0x3A
#define BG3Y_L 0x3C
#define BG3Y_H 0x3E

#define DISPCNT 0x0
#define DISPSTAT 0x4

#define ioRegStart  0x00048000 //0x48000 - 0x484FF = 0x4FF
#define vRamStart   0x00048500 //0x48500 - 0x684FF = 0x1FFFF
#define palRamStart 0x00068500 //0x68500 - 0x688FF = 0x3FF
#define OAM_BASE 0x7000000

ILI9341_t3DMA tft = ILI9341_t3DMA(TFT_CS, TFT_DC, TFT_RST, TFT_MOSI, TFT_SCLK, TFT_MISO);
unsigned long FrameTime = 0;
float FPS = 0;

void setup()
{
  delay(2000);
  
  Serial.begin(57600);
  
  tft.begin();
  tft.dfillScreen(ILI9341_BLACK);
  tft.refreshOnce();
  
  SD.begin(BUILTIN_SDCARD);
  FROM = SD.open("/MK/MK.gba", FILE_READ);

  processor.CreateCores(&processor, &FROM);
  Serial.println("Init Complete");

  Serial.println("Checking and Resetting Memory...");
  Serial.flush();

  while(true)
  {
    uint8_t val = 0;
    bool failed = false;
    for(uint32_t i = 0; i < 0x80000; i++)
    {
      processor.SPIRAMWrite(i, val);
      uint8_t value = processor.SPIRAMRead(i);
  
      if(value != val)
      {
        Serial.println("Memory Check Failed at :" + String(i, DEC) + " W: " + String(val, DEC) + " R: " + String(value, DEC));
        Serial.flush();
        failed = true;
        break;
      }
      
      val++;
    }
    
    if(!failed)
    {
      Serial.println("Ram Test: Passed");
      break;
    }
  
    delay(1000);
  }
}

int32_t vramCycles = 0;
bool inHblank = false;
uint16_t curLine = 0;
int32_t loopcount = 0;

void loop()
{
  const int32_t numSteps = 2284;
  const int32_t cycleStep = 123;
  
  for (int32_t i = 0; i < numSteps; i++)
  {
    if (vramCycles <= 0)
    {
      if (inHblank)
      {
        vramCycles += 960;
        LeaveHBlank();
        inHblank = false;
      }
      else
      {
        vramCycles += 272;
        RenderLine();
        EnterHBlank();
        inHblank = true;
      }
    }

    processor.Execute(cycleStep);

    vramCycles -= cycleStep;

    processor.FireIrq();

    //Serial.println("Loop: " + String(loopcount, DEC));

    loopcount++;
  }
}

void EnterVBlank()
{
  uint16_t dispstat = processor.ReadU16(DISPSTAT, ioRegStart); //Read DISPSTAT 0x4 from IOReg
  dispstat |= 1;
  processor.WriteU16(DISPSTAT, ioRegStart, dispstat);//Write new DISPSTAT 0x4 to IOReg

  // Render the frame

  if(FrameTime != 0)
  {
    FPS = 1000000.0f / (float)(micros() - FrameTime);
  }

  Serial.println("FPS: " + String(FPS));
  tft.refreshOnce();
  FrameTime = micros();
  
  if ((dispstat & (1 << 3)) != 0)
  {
    // Fire the vblank irq
    processor.RequestIrq(0);
  }

  // Check for DMA triggers
  processor.VBlankDma();
}

void LeaveVBlank()
{
  uint16_t dispstat = processor.ReadU16(DISPSTAT, ioRegStart); //Read DISPSTAT 0x4 from IOReg
  dispstat &= 0xFFFE;
  processor.WriteU16(DISPSTAT, ioRegStart, dispstat);//Write new DISPSTAT 0x4 to IOReg

  processor.UpdateKeyState();

  // Update the rot/scale values
  processor.bgx[0] = (int32_t)processor.ReadU32(BG2X_L, ioRegStart); //Read BG2X_L from IOReg
  processor.bgx[1] = (int32_t)processor.ReadU32(BG3X_L, ioRegStart); //Read BG3X_L from IOReg
  processor.bgy[0] = (int32_t)processor.ReadU32(BG2Y_L, ioRegStart); //Read BG2Y_L from IOReg
  processor.bgy[1] = (int32_t)processor.ReadU32(BG3Y_L, ioRegStart); //Read BG3Y_L from IOReg
}

void EnterHBlank()
{
  uint16_t dispstat = processor.ReadU16(DISPSTAT, ioRegStart); //Read DISPSTAT 0x4 from IOReg
  dispstat |= 1 << 1;
  processor.WriteU16(DISPSTAT, ioRegStart, dispstat);//Write new DISPSTAT 0x4 to IOReg

  // Advance the bgx registers
  for (int32_t bg = 0; bg <= 1; bg++)
  {
    uint16_t dmx = (uint16_t)processor.ReadU16(BG2PB + (uint32_t)bg * 0x10, ioRegStart); //Read BG2PB from IOReg
    uint16_t dmy = (uint16_t)processor.ReadU16(BG2PD+ (uint32_t)bg * 0x10, ioRegStart); //Read BG2PD from IOReg
    processor.bgx[bg] += dmx;
    processor.bgy[bg] += dmy;
  }

  if (curLine < 160)
  {
    processor.HBlankDma();

    // Trigger hblank irq
    if ((dispstat & (1 << 4)) != 0)
    {
      processor.RequestIrq(1);
    }
  }
}

void LeaveHBlank()
{
  uint16_t dispstat = processor.ReadU16(DISPSTAT, ioRegStart); //Read DISPSTAT 0x4 from IOReg
  dispstat &= 0xFFF9;
  processor.WriteU16(DISPSTAT, ioRegStart, dispstat);//Write new DISPSTAT 0x4 to IOReg

  // Move to the next line
  curLine++;

  if (curLine >= 228)
  {
    // Start again at the beginning
    curLine = 0;
  }

  // Update registers
  processor.WriteU16(VCOUNT, ioRegStart, (uint16_t)curLine); //Write VCOUNT 0x6 in IOReg

  // Check for vblank
  if (curLine == 160)
  {
    EnterVBlank();
  }
  else if (curLine == 0)
  {
    LeaveVBlank();
  }

  // Check y-line trigger
  if (((dispstat >> 8) & 0xff) == curLine)
  {
    dispstat = (uint16_t)(processor.ReadU16(DISPSTAT, ioRegStart) | (1 << 2)); //Read DISPSTAT 0x4 from IOReg
    processor.WriteU16(0x4, ioRegStart, dispstat);//Write new DISPSTAT 0x4 to IOReg

    if ((dispstat & (1 << 5)) != 0)
    {
      processor.RequestIrq(2);
    }
  }
}

// Window helper variables
uint8_t win0x1, win0x2, win0y1, win0y2;
uint8_t win1x1, win1x2, win1y1, win1y2;
uint8_t win0Enabled, win1Enabled, winObjEnabled, winOutEnabled;
bool winEnabled;

uint8_t blendSource, blendTarget;
uint8_t blendA, blendB, blendY;
int32_t blendType;
uint16_t dispCnt;

uint8_t windowCover[240];
uint8_t Blend[240];

void RenderLine()
{
  if(curLine >= 160)
  {
    return;
  }

  dispCnt = processor.ReadU16(DISPCNT, ioRegStart); //Read DISPCNT 0x0 from IOReg

  if ((dispCnt & (1 << 7)) != 0)
  {
    uint16_t bgColor = GBAToColor(0x7FFF); //White
    for (int32_t i = 0; i < 240; i++) 
    {
      DrawPixel(curLine, i, bgColor);
    }
  }
  else
  {
    winEnabled = false;

    if ((dispCnt & (1 << 13)) != 0)
    {
      // Calculate window 0 information
      uint16_t winy = processor.ReadU16(WIN0V, ioRegStart); //Read WIN0V 0x0 from IOReg
      win0y1 = (uint8_t)(winy >> 8);
      win0y2 = (uint8_t)(winy & 0xff);
      uint16_t winx = processor.ReadU16(WIN0H, ioRegStart); //Read WIN0H 0x0 from IOReg
      win0x1 = (uint8_t)(winx >> 8);
      win0x2 = (uint8_t)(winx & 0xff);

      if (win0x2 > 240 || win0x1 > win0x2)
      {
        win0x2 = 240;
      }

      if (win0y2 > 160 || win0y1 > win0y2)
      {
        win0y2 = 160;
      }

      win0Enabled = processor.ReadU8(WININ, ioRegStart);
      winEnabled = true;
    }

    if ((dispCnt & (1 << 14)) != 0)
    {
      // Calculate window 1 information
      uint16_t winy = processor.ReadU16(WIN1V, ioRegStart); //Read WIN1V 0x0 from IOReg
      win1y1 = (uint8_t)(winy >> 8);
      win1y2 = (uint8_t)(winy & 0xff);
      uint16_t winx = processor.ReadU16(WIN1H, ioRegStart); //Read WIN1H 0x0 from IOReg
      win1x1 = (uint8_t)(winx >> 8);
      win1x2 = (uint8_t)(winx & 0xff);

      if (win1x2 > 240 || win1x1 > win1x2)
      {
        win1x2 = 240;
      }

      if (win1y2 > 160 || win1y1 > win1y2)
      {
        win1y2 = 160;
      }

      win1Enabled = processor.ReadU8(WININ + 1, ioRegStart);
      winEnabled = true;
    }

    if ((dispCnt & (1 << 15)) != 0 && (dispCnt & (1 << 12)) != 0)
    {
      // Object windows are enabled
      winObjEnabled = processor.ReadU8(WINOUT + 1, ioRegStart);
      winEnabled = true;
    }

    if (winEnabled)
    {
      winOutEnabled = processor.ReadU8(WINOUT, ioRegStart);
    }

    // Calculate blending information
    uint16_t bldcnt = processor.ReadU16(BLDCNT, ioRegStart); //Read BLD 0x0 from IOReg
    blendType = (bldcnt >> 6) & 0x3;
    blendSource = (uint8_t)(bldcnt & 0x3F);
    blendTarget = (uint8_t)((bldcnt >> 8) & 0x3F);

    uint16_t bldalpha = processor.ReadU16(BLDALPHA, ioRegStart); //Read BLDALPHA 0x0 from IOReg
    blendA = (uint8_t)(bldalpha & 0x1F);
    if (blendA > 0x10) blendA = 0x10;
    blendB = (uint8_t)((bldalpha >> 8) & 0x1F);
    if (blendB > 0x10) blendB = 0x10;

    blendY = (uint8_t)(processor.ReadU8(BLDY, ioRegStart) & 0x1F);
    if (blendY > 0x10) blendY = 0x10;

    switch (dispCnt & 0x7)
    {
      case 0: RenderMode0Line(); break;
      case 1: RenderMode1Line(); break;
      case 2: RenderMode2Line(); break;
      case 3: RenderMode3Line(); break;
      case 4: RenderMode4Line(); break;
      case 5: RenderMode5Line(); break;
    }
  }
}

void DrawBackdrop()
{
  // Initialize window coverage buffer if neccesary
  if (winEnabled)
  {
    for (int32_t i = 0; i < 240; i++)
    {
      windowCover[i] = winOutEnabled;
    }

    if ((dispCnt & (1 << 15)) != 0)
    {
      // Sprite window
      DrawSpriteWindows();
    }

    if ((dispCnt & (1 << 14)) != 0)
    {
      // Window 1
      if (curLine >= win1y1 && curLine < win1y2)
      {
        for (int32_t i = win1x1; i < win1x2; i++)
        {
          windowCover[i] = win1Enabled;
        }
      }
    }

    if ((dispCnt & (1 << 13)) != 0)
    {
      // Window 0
      if (curLine >= win0y1 && curLine < win0y2)
      {
        for (int32_t i = win0x1; i < win0x2; i++)
        {
          windowCover[i] = win0Enabled;
        }
      }
    }
  }

  // Draw backdrop first
  uint16_t bgColor = processor.ReadU16(0, palRamStart);
  uint16_t modColor = bgColor;

  if (blendType == 2 && (blendSource & (1 << 5)) != 0)
  {
    // Brightness increase
    uint8_t r = (uint8_t)((bgColor) & 0x1F);       //First 5 Bits
    uint8_t g = (uint8_t)((bgColor >> 5) & 0x1F);  //Middle 5 Bits
    uint8_t b = (uint8_t)(bgColor >> 10) & 0x1F;   //Last 5 Bits
    
    r = r + (((0xFF - r) * blendY) >> 4);
    g = g + (((0xFF - g) * blendY) >> 4);
    b = b + (((0xFF - b) * blendY) >> 4);
    modColor = (b << 0) | (g << 5) | (r << 11);
  }
  else if (blendType == 3 && (blendSource & (1 << 5)) != 0)
  {
    // Brightness decrease
    uint8_t r = (uint8_t)((bgColor) & 0x1F);       //First 5 Bits
    uint8_t g = (uint8_t)((bgColor >> 5) & 0x1F);  //Middle 5 Bits
    uint8_t b = (uint8_t)(bgColor >> 10) & 0x1F;   //Last 5 Bits
    
    r = r - ((r * blendY) >> 4);
    g = g - ((g * blendY) >> 4);
    b = b - ((b * blendY) >> 4);
    
    modColor = (b << 0) | (g << 5) | (r << 11);
  }

  if (winEnabled)
  {
    for (int32_t i = 0; i < 240; i++)
    {
      if ((windowCover[i] & (1 << 5)) != 0)
      {
        DrawPixel(curLine, i, modColor);
      }
      else
      {
        DrawPixel(curLine, i, bgColor);
      }
      Blend[i] = 1 << 5;
    }
  }
  else
  {
    for (int32_t i = 0; i < 240; i++)
    {
      DrawPixel(curLine, i, modColor);
      Blend[i] = 1 << 5;
    }
  }
}

void RenderTextBg(uint8_t bg)
{
  if (winEnabled)
  {
    switch (blendType)
    {
    case 0:
      RenderTextBgWindow(bg);
      break;
    case 1:
      if ((blendSource & (1 << bg)) != 0)
        RenderTextBgWindowBlend(bg);
      else
        RenderTextBgWindow(bg);
      break;
    case 2:
      if ((blendSource & (1 << bg)) != 0)
        RenderTextBgWindowBrightInc(bg);
      else
        RenderTextBgWindow(bg);
      break;
    case 3:
      if ((blendSource & (1 << bg)) != 0)
        RenderTextBgWindowBrightDec(bg);
      else
        RenderTextBgWindow(bg);
      break;
    }
  }
  else
  {
    switch (blendType)
    {
    case 0:
      RenderTextBgNormal(bg);
      break;
    case 1:
      if ((blendSource & (1 << bg)) != 0)
        RenderTextBgBlend(bg);
      else
        RenderTextBgNormal(bg);
      break;
    case 2:
      if ((blendSource & (1 << bg)) != 0)
        RenderTextBgBrightInc(bg);
      else
        RenderTextBgNormal(bg);
      break;
    case 3:
      if ((blendSource & (1 << bg)) != 0)
        RenderTextBgBrightDec(bg);
      else
        RenderTextBgNormal(bg);
      break;
    }
  }
}

void DrawSprites(uint8_t pri)
{
  if (winEnabled)
  {
    //Serial.println("Draw Sprites Type: " + String(blendType, DEC));
    switch (blendType)
    {
    case 0:
      DrawSpritesWindow(pri);
      break;
    case 1:
      if ((blendSource & (1 << 4)) != 0)
        DrawSpritesWindowBlend(pri);
      else
        DrawSpritesWindow(pri);
      break;
    case 2:
      if ((blendSource & (1 << 4)) != 0)
        DrawSpritesWindowBrightInc(pri);
      else
        DrawSpritesWindow(pri);
      break;
    case 3:
      if ((blendSource & (1 << 4)) != 0)
        DrawSpritesWindowBrightDec(pri);
      else
        DrawSpritesWindow(pri);
      break;
    }
  }
  else
  {
    switch (blendType)
    {
    case 0:
      DrawSpritesNormal(pri);
      break;
    case 1:
      if ((blendSource & (1 << 4)) != 0)
        DrawSpritesBlend(pri);
      else
        DrawSpritesNormal(pri);
      break;
    case 2:
      if ((blendSource & (1 << 4)) != 0)
        DrawSpritesBrightInc(pri);
      else
        DrawSpritesNormal(pri);
      break;
    case 3:
      if ((blendSource & (1 << 4)) != 0)
        DrawSpritesBrightDec(pri);
      else
        DrawSpritesNormal(pri);
      break;
    }
  }
}

void RenderRotScaleBg(uint8_t bg)
{
  if (winEnabled)
  {
    switch (blendType)
    {
    case 0:
      RenderRotScaleBgWindow(bg);
      break;
    case 1:
      if ((blendSource & (1 << bg)) != 0)
        RenderRotScaleBgWindowBlend(bg);
      else
        RenderRotScaleBgWindow(bg);
      break;
    case 2:
      if ((blendSource & (1 << bg)) != 0)
        RenderRotScaleBgWindowBrightInc(bg);
      else
        RenderRotScaleBgWindow(bg);
      break;
    case 3:
      if ((blendSource & (1 << bg)) != 0)
        RenderRotScaleBgWindowBrightDec(bg);
      else
        RenderRotScaleBgWindow(bg);
      break;
    }
  }
  else
  {
    switch (blendType)
    {
    case 0:
      RenderRotScaleBgNormal(bg);
      break;
    case 1:
      if ((blendSource & (1 << bg)) != 0)
        RenderRotScaleBgBlend(bg);
      else
        RenderRotScaleBgNormal(bg);
      break;
    case 2:
      if ((blendSource & (1 << bg)) != 0)
        RenderRotScaleBgBrightInc(bg);
      else
        RenderRotScaleBgNormal(bg);
      break;
    case 3:
      if ((blendSource & (1 << bg)) != 0)
        RenderRotScaleBgBrightDec(bg);
      else
        RenderRotScaleBgNormal(bg);
      break;
    }
  }
}

void RenderMode0Line()
{
  DrawBackdrop();

  for (int32_t pri = 3; pri >= 0; pri--)
  {
    for (int32_t i = 3; i >= 0; i--)
    {
      if ((dispCnt & (1 << (8 + i))) != 0)
      {
        uint16_t bgcnt = processor.ReadU16(BG0CNT + 0x2 * (uint16_t)i, ioRegStart); //Read BG0CNT 0x0 from IOReg
        if ((bgcnt & 0x3) == pri)
        {
          RenderTextBg(i);
        }
      }
    }

    DrawSprites(pri);
  }
}

void RenderMode1Line()
{
  DrawBackdrop();

  for (int32_t pri = 3; pri >= 0; pri--)
  {
    if ((dispCnt & (1 << (8 + 2))) != 0)
    {
      uint16_t bgcnt = processor.ReadU16(BG2CNT, ioRegStart); //Read BG0CNT 0x0 from IOReg

      if ((bgcnt & 0x3) == pri)
      {
        RenderRotScaleBg(2);
      }
    }

    for (int32_t i = 1; i >= 0; i--)
    {
      if ((dispCnt & (1 << (8 + i))) != 0)
      {
        uint16_t bgcnt = processor.ReadU16(BG0CNT + 0x2 * (uint16_t)i, ioRegStart); //Read BG0CNT 0x0 from IOReg

        if ((bgcnt & 0x3) == pri)
        {
          RenderTextBg(i);
        }
      }
    }

    DrawSprites(pri);
  }
}

void RenderMode2Line()
{
  DrawBackdrop();

  for (int32_t pri = 3; pri >= 0; pri--)
  {
    for (int32_t i = 3; i >= 2; i--)
    {
      if ((dispCnt & (1 << (8 + i))) != 0)
      {
        uint16_t bgcnt = processor.ReadU16(BG0CNT + 0x2 * (uint16_t)i, ioRegStart); //Read BG0CNT 0x0 from IOReg

        if ((bgcnt & 0x3) == pri)
        {
          RenderRotScaleBg(i);
        }
      }
    }

    DrawSprites(pri);
  }
}

void RenderMode3Line()
{
  uint16_t bg2Cnt = processor.ReadU16(BG2CNT, ioRegStart); //Read BG0CNT 0x0 from IOReg

  DrawBackdrop();

  uint8_t blendMaskType = (uint8_t)(1 << 2);

  int32_t bgPri = bg2Cnt & 0x3;
  for (int32_t pri = 3; pri > bgPri; pri--)
  {
    DrawSprites(pri);
  }

  if ((dispCnt & (1 << 10)) != 0)
  {
    // Background enabled, render it
    uint32_t x = processor.bgx[0];
    uint32_t y = processor.bgy[0];

    uint16_t dx = (uint16_t)processor.ReadU16(BG2PA, ioRegStart);
    uint16_t dy = (uint16_t)processor.ReadU16(BG2PC, ioRegStart);

    for (int32_t i = 0; i < 240; i++)
    {
      int32_t ax = ((int32_t)x) >> 8;
      int32_t ay = ((int32_t)y) >> 8;

      if (ax >= 0 && ax < 240 && ay >= 0 && ay < 160)
      {
        int32_t curIdx = ((ay * 240) + ax) * 2;
        
        DrawPixel(curLine, i, GBAToColor(processor.ReadU16(curIdx, vRamStart))); //Read From VRAM
        Blend[i] = blendMaskType;
      }
      x += dx;
      y += dy;
    }
  }

  for (int32_t pri = bgPri; pri >= 0; pri--)
  {
    DrawSprites(pri);
  }
}

void RenderMode4Line()
{
  uint16_t bg2Cnt = processor.ReadU16(BG2CNT, ioRegStart); //Read BG0CNT 0x0 from IOReg
  
  DrawBackdrop();

  uint8_t blendMaskType = (uint8_t)(1 << 2);

  int32_t bgPri = bg2Cnt & 0x3;
  
  for (int32_t pri = 3; pri > bgPri; pri--)
  {
    DrawSprites(pri);
  }

  if ((dispCnt & (1 << 10)) != 0)
  {
    // Background enabled, render it
    int32_t baseIdx = 0;
    if ((dispCnt & (1 << 4)) == 1 << 4) baseIdx = 0xA000;

    int32_t x = processor.bgx[0];
    int32_t y = processor.bgy[0];

    uint16_t dx = (uint16_t)processor.ReadU16(BG2PA, ioRegStart);
    uint16_t dy = (uint16_t)processor.ReadU16(BG2PC, ioRegStart);

    for (int32_t i = 0; i < 240; i++)
    {
      int32_t ax = ((int32_t)x) >> 8;
      int32_t ay = ((int32_t)y) >> 8;

      if (ax >= 0 && ax < 240 && ay >= 0 && ay < 160)
      {
        int32_t lookup = processor.ReadU8(baseIdx + (ay * 240) + ax, vRamStart); //VRAM Lookup
        
        if (lookup != 0)
        {                       
          DrawPixel(curLine, i, GBAToColor(processor.ReadU16(lookup * 2, palRamStart))); //Palette Lookup
          Blend[i] = blendMaskType;
        }
      }
      x += dx;
      y += dy;
    }
  }

  for (int32_t pri = bgPri; pri >= 0; pri--)
  {
    DrawSprites(pri);
  }
}

void RenderMode5Line()
{
  uint16_t bg2Cnt = processor.ReadU16(BG2CNT, ioRegStart); //Read BG0CNT 0x0 from IOReg

  DrawBackdrop();

  uint8_t blendMaskType = (uint8_t)(1 << 2);

  int32_t bgPri = bg2Cnt & 0x3;
  for (int32_t pri = 3; pri > bgPri; pri--)
  {
    DrawSprites(pri);
  }

  if ((dispCnt & (1 << 10)) != 0)
  {
    // Background enabled, render it
    int32_t baseIdx = 0;
    if ((dispCnt & (1 << 4)) == 1 << 4) baseIdx += 160 * 128 * 2;

    int32_t x = processor.bgx[0];
    int32_t y = processor.bgy[0];

    uint16_t dx = (uint16_t)processor.ReadU16(BG2PA, ioRegStart);
    uint16_t dy = (uint16_t)processor.ReadU16(BG2PC, ioRegStart);

    for (int32_t i = 0; i < 240; i++)
    {
      int32_t ax = ((int32_t)x) >> 8;
      int32_t ay = ((int32_t)y) >> 8;

      if (ax >= 0 && ax < 160 && ay >= 0 && ay < 128)
      {
        int32_t curIdx = (int32_t)(ay * 160 + ax) * 2;

        DrawPixel(curLine, i, GBAToColor(processor.ReadU16(baseIdx + curIdx, vRamStart)));
        Blend[i] = blendMaskType;
      }
      x += dx;
      y += dy;
    }
  }

  for (int32_t pri = bgPri; pri >= 0; pri--)
  {
    DrawSprites(pri);
  }
}

void DrawSpriteWindows()
{
  // OBJ must be enabled in this.dispCnt
  if ((dispCnt & (1 << 12)) == 0) return;

  for (int32_t oamNum = 127; oamNum >= 0; oamNum--)
  {
    uint16_t attr0 = processor.ReadU16Debug(OAM_BASE + (uint16_t)(oamNum * 8) + 0);

    // Not an object window, so continue
    if (((attr0 >> 10) & 3) != 2) continue;

    uint16_t attr1 = processor.ReadU16Debug(OAM_BASE + (uint32_t)(oamNum * 8) + 2);
    uint16_t attr2 = processor.ReadU16Debug(OAM_BASE + (uint32_t)(oamNum * 8) + 4);

    int32_t x = attr1 & 0x1FF;
    int32_t y = attr0 & 0xFF;

    int32_t Width = -1, Height = -1;
    switch ((attr0 >> 14) & 3)
    {
    case 0:
      // Square
      switch ((attr1 >> 14) & 3)
      {
      case 0: Width = 8; Height = 8; break;
      case 1: Width = 16; Height = 16; break;
      case 2: Width = 32; Height = 32; break;
      case 3: Width = 64; Height = 64; break;
      }
      break;
    case 1:
      // Horizontal Rectangle
      switch ((attr1 >> 14) & 3)
      {
      case 0: Width = 16; Height = 8; break;
      case 1: Width = 32; Height = 8; break;
      case 2: Width = 32; Height = 16; break;
      case 3: Width = 64; Height = 32; break;
      }
      break;
    case 2:
      // Vertical Rectangle
      switch ((attr1 >> 14) & 3)
      {
      case 0: Width = 8; Height = 16; break;
      case 1: Width = 8; Height = 32; break;
      case 2: Width = 16; Height = 32; break;
      case 3: Width = 32; Height = 64; break;
      }
      break;
    }

    // Check double size flag here

    int32_t rWidth = Width, rHeight = Height;
    if ((attr0 & (1 << 8)) != 0)
    {
      // Rot-scale on
      if ((attr0 & (1 << 9)) != 0)
      {
        rWidth *= 2;
        rHeight *= 2;
      }
    }
    else
    {
      // Invalid sprite
      if ((attr0 & (1 << 9)) != 0)
        Width = -1;
    }

    if (Width == -1)
    {
      // Invalid sprite
      continue;
    }

    // Y clipping
    if (y > ((y + rHeight) & 0xff))
    {
      if (curLine >= ((y + rHeight) & 0xff) && !(y < curLine)) continue;
    }
    else
    {
      if (curLine < y || curLine >= ((y + rHeight) & 0xff)) continue;
    }

    int32_t scale = 1;
    if ((attr0 & (1 << 13)) != 0) scale = 2;

    int32_t spritey = curLine - y;
    if (spritey < 0) spritey += 256;

    if ((attr0 & (1 << 8)) == 0)
    {
      if ((attr1 & (1 << 13)) != 0) spritey = (Height - 1) - spritey;

      int32_t baseSprite;
      if ((dispCnt & (1 << 6)) != 0)
      {
        // 1 dimensional
        baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * (Width / 8)) * scale;
      }
      else
      {
        // 2 dimensional
        baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * 0x20);
      }

      int32_t baseInc = scale;
      if ((attr1 & (1 << 12)) != 0)
      {
        baseSprite += ((Width / 8) * scale) - scale;
        baseInc = -baseInc;
      }

      if ((attr0 & (1 << 13)) != 0)
      {
        // 256 colors
        for (int32_t i = x; i < x + Width; i++)
        {
          if ((i & 0x1ff) < 240)
          {
            int32_t tx = (i - x) & 7;
            if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
            int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 8) + tx;
            int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
            if (lookup != 0)
            {
              windowCover[i & 0x1ff] = winObjEnabled;
            }
          }
          if (((i - x) & 7) == 7) baseSprite += baseInc;
        }
      }
      else
      {
        // 16 colors
        for (int32_t i = x; i < x + Width; i++)
        {
          if ((i & 0x1ff) < 240)
          {
            int32_t tx = (i - x) & 7;
            if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
            int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 4) + (tx / 2);
            int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
            if ((tx & 1) == 0)
            {
              lookup &= 0xf;
            }
            else
            {
              lookup >>= 4;
            }
            if (lookup != 0)
            {
              windowCover[i & 0x1ff] = winObjEnabled;
            }
          }
          if (((i - x) & 7) == 7) baseSprite += baseInc;
        }
      }
    }
    else
    {
      int32_t rotScaleParam = (attr1 >> 9) & 0x1F;

      uint16_t dx = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x6);
      uint16_t dmx = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0xE);
      uint16_t dy = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x16);
      uint16_t dmy = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x1E);

      int32_t cx = rWidth / 2;
      int32_t cy = rHeight / 2;

      int32_t baseSprite = attr2 & 0x3FF;
      int32_t pitch;

      if ((dispCnt & (1 << 6)) != 0)
      {
        // 1 dimensional
        pitch = (Width / 8) * scale;
      }
      else
      {
        // 2 dimensional
        pitch = 0x20;
      }

      uint16_t rx = (uint16_t)((dmx * (spritey - cy)) - (cx * dx) + (Width << 7));
      uint16_t ry = (uint16_t)((dmy * (spritey - cy)) - (cx * dy) + (Height << 7));

      // Draw a rot/scale sprite
      if ((attr0 & (1 << 13)) != 0)
      {
        // 256 colors
        for (int32_t i = x; i < x + rWidth; i++)
        {
          int32_t tx = rx >> 8;
          int32_t ty = ry >> 8;

          if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height)
          {
            int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 8) + (tx & 7);
            int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
            if (lookup != 0)
            {
              windowCover[i & 0x1ff] = winObjEnabled;
            }
          }

          rx += dx;
          ry += dy;
        }
      }
      else
      {
        // 16 colors
        for (int32_t i = x; i < x + rWidth; i++)
        {
          int32_t tx = rx >> 8;
          int32_t ty = ry >> 8;

          if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height)
          {
            int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 4) + ((tx & 7) / 2);
            int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
            if ((tx & 1) == 0)
            {
              lookup &= 0xf;
            }
            else
            {
              lookup >>= 4;
            }
            if (lookup != 0)
            {
              windowCover[i & 0x1ff] = winObjEnabled;
            }
          }
          rx += dx;
          ry += dy;
        }
      }
    }
  }
}

void RenderTextBgWindow(int32_t bg)
{
  uint8_t blendMaskType = (uint8_t)(1 << bg);

  uint16_t bgcnt = processor.ReadU16(BG0CNT + 0x2 * (uint32_t)bg, ioRegStart); //Read BG0CNT 0x0 from IOReg

  int32_t Width = 0, Height = 0;
  switch ((bgcnt >> 14) & 0x3)
  {
  case 0: Width = 256; Height = 256; break;
  case 1: Width = 512; Height = 256; break;
  case 2: Width = 256; Height = 512; break;
  case 3: Width = 512; Height = 512; break;
  }

  int32_t screenBase = ((bgcnt >> 8) & 0x1F) * 0x800;
  int32_t charBase = ((bgcnt >> 2) & 0x3) * 0x4000;

  int32_t hofs = processor.ReadU16(BG0HOFS + (uint32_t)bg * 4, ioRegStart) & 0x1FF;
  int32_t vofs = processor.ReadU16(BG0VOFS + (uint32_t)bg * 4, ioRegStart) & 0x1FF;

  if ((bgcnt & (1 << 7)) != 0)
  {
    // 256 color tiles
    int32_t bgy = ((curLine + vofs) & (Height - 1)) / 8;

    int32_t tileIdx = screenBase + (((bgy & 31) * 32) * 2);
    switch ((bgcnt >> 14) & 0x3)
    {
    case 2: if (bgy >= 32) tileIdx += 32 * 32 * 2; break;
    case 3: if (bgy >= 32) tileIdx += 32 * 32 * 4; break;
    }

    int32_t tileY = ((curLine + vofs) & 0x7) * 8;

    for (int32_t i = 0; i < 240; i++)
    {
      if ((windowCover[i] & (1 << bg)) != 0)
      {
        int32_t bgx = ((i + hofs) & (Width - 1)) / 8;
        int32_t tmpTileIdx = tileIdx + ((bgx & 31) * 2);
        if (bgx >= 32) tmpTileIdx += 32 * 32 * 2;
        int32_t tileChar = processor.ReadU16(tmpTileIdx, vRamStart);
        int32_t x = (i + hofs) & 7;
        int32_t y = tileY;
        if ((tileChar & (1 << 10)) != 0) x = 7 - x;
        if ((tileChar & (1 << 11)) != 0) y = 56 - y;
        int32_t lookup = processor.ReadU16(charBase + ((tileChar & 0x3FF) * 64) + y + x, vRamStart);
        if (lookup != 0)
        {
          uint16_t pixelColor = GBAToColor(processor.ReadU16(lookup * 2, palRamStart));
          DrawPixel(curLine, i, pixelColor);
          Blend[i] = blendMaskType;
        }
      }
    }
  }
  else
  {
    // 16 color tiles
    int32_t bgy = ((curLine + vofs) & (Height - 1)) / 8;

    int32_t tileIdx = screenBase + (((bgy & 31) * 32) * 2);
    switch ((bgcnt >> 14) & 0x3)
    {
      case 2: if (bgy >= 32) tileIdx += 32 * 32 * 2; break;
      case 3: if (bgy >= 32) tileIdx += 32 * 32 * 4; break;
    }

    int32_t tileY = ((curLine + vofs) & 0x7) * 4;

    for (int32_t i = 0; i < 240; i++)
    {
      if ((windowCover[i] & (1 << bg)) != 0)
      {
        int32_t bgx = ((i + hofs) & (Width - 1)) / 8;
        int32_t tmpTileIdx = tileIdx + ((bgx & 31) * 2);
        if (bgx >= 32) tmpTileIdx += 32 * 32 * 2;
        int32_t tileChar = processor.ReadU16(tmpTileIdx, vRamStart);
        int32_t x = (i + hofs) & 7;
        int32_t y = tileY;
        if ((tileChar & (1 << 10)) != 0) x = 7 - x;
        if ((tileChar & (1 << 11)) != 0) y = 28 - y;
        int32_t lookup = processor.ReadU16(charBase + ((tileChar & 0x3FF) * 32) + y + (x / 2), vRamStart);
        if ((x & 1) == 0)
        {
          lookup &= 0xf;
        }
        else
        {
          lookup >>= 4;
        }
        if (lookup != 0)
        {
          int32_t palNum = ((tileChar >> 12) & 0xf) * 16 * 2;
          uint16_t pixelColor = GBAToColor(processor.ReadU16(palNum + lookup * 2, palRamStart));
          DrawPixel(curLine, i, pixelColor);
          Blend[i] = blendMaskType;
        }
      }
    }
  }
}

void RenderTextBgWindowBlend(int32_t bg)
{
  uint8_t blendMaskType = (uint8_t)(1 << bg);

  uint16_t bgcnt = processor.ReadU16(BG0CNT + 0x2 * (uint32_t)bg, ioRegStart);

  int32_t Width = 0, Height = 0;
  switch ((bgcnt >> 14) & 0x3)
  {
  case 0: Width = 256; Height = 256; break;
  case 1: Width = 512; Height = 256; break;
  case 2: Width = 256; Height = 512; break;
  case 3: Width = 512; Height = 512; break;
  }

  int32_t screenBase = ((bgcnt >> 8) & 0x1F) * 0x800;
  int32_t charBase = ((bgcnt >> 2) & 0x3) * 0x4000;

  int32_t hofs = processor.ReadU16(BG0HOFS + (uint32_t)bg * 4, ioRegStart) & 0x1FF;
  int32_t vofs = processor.ReadU16(BG0VOFS + (uint32_t)bg * 4, ioRegStart) & 0x1FF;

  if ((bgcnt & (1 << 7)) != 0)
  {
    // 256 color tiles
    int32_t bgy = ((curLine + vofs) & (Height - 1)) / 8;

    int32_t tileIdx = screenBase + (((bgy & 31) * 32) * 2);
    switch ((bgcnt >> 14) & 0x3)
    {
    case 2: if (bgy >= 32) tileIdx += 32 * 32 * 2; break;
    case 3: if (bgy >= 32) tileIdx += 32 * 32 * 4; break;
    }

    int32_t tileY = ((curLine + vofs) & 0x7) * 8;

    for (int32_t i = 0; i < 240; i++)
    {
      if ((windowCover[i] & (1 << bg)) != 0)
      {
        int32_t bgx = ((i + hofs) & (Width - 1)) / 8;
        int32_t tmpTileIdx = tileIdx + ((bgx & 31) * 2);
        if (bgx >= 32) tmpTileIdx += 32 * 32 * 2;
        int32_t tileChar = processor.ReadU16(tmpTileIdx, vRamStart);
        int32_t x = (i + hofs) & 7;
        int32_t y = tileY;
        if ((tileChar & (1 << 10)) != 0) x = 7 - x;
        if ((tileChar & (1 << 11)) != 0) y = 56 - y;
        int32_t lookup = processor.ReadU16(charBase + ((tileChar & 0x3FF) * 64) + y + x, vRamStart);
        if (lookup != 0)
        {
          uint16_t pixelColor = processor.ReadU16(lookup * 2, palRamStart);
          
          if ((windowCover[i] & (1 << 5)) != 0)
          {
            if ((Blend[i] & blendTarget) != 0)
            {
              uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
              uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
              uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
              uint16_t sourceValue = tft.dgetPixel(curLine, i);
              r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
              g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
              b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
              if (r > 0xff) r = 0xff;
              if (g > 0xff) g = 0xff;
              if (b > 0xff) b = 0xff;
              pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
            }
            else
            {
              pixelColor = GBAToColor(pixelColor);
            }
          }
          else
          {
            pixelColor = GBAToColor(pixelColor);
          }
          
          DrawPixel(curLine, i, pixelColor);
          Blend[i] = blendMaskType;
        }
      }
    }
  }
  else
  {
    // 16 color tiles
    int32_t bgy = ((curLine + vofs) & (Height - 1)) / 8;

    int32_t tileIdx = screenBase + (((bgy & 31) * 32) * 2);
    switch ((bgcnt >> 14) & 0x3)
    {
      case 2: if (bgy >= 32) tileIdx += 32 * 32 * 2; break;
      case 3: if (bgy >= 32) tileIdx += 32 * 32 * 4; break;
    }

    int32_t tileY = ((curLine + vofs) & 0x7) * 4;

    for (int32_t i = 0; i < 240; i++)
    {
      if ((windowCover[i] & (1 << bg)) != 0)
      {
        int32_t bgx = ((i + hofs) & (Width - 1)) / 8;
        int32_t tmpTileIdx = tileIdx + ((bgx & 31) * 2);
        if (bgx >= 32) tmpTileIdx += 32 * 32 * 2;
        int32_t tileChar = processor.ReadU16(tmpTileIdx, vRamStart);
        int32_t x = (i + hofs) & 7;
        int32_t y = tileY;
        if ((tileChar & (1 << 10)) != 0) x = 7 - x;
        if ((tileChar & (1 << 11)) != 0) y = 28 - y;
        int32_t lookup = processor.ReadU16(charBase + ((tileChar & 0x3FF) * 32) + y + (x / 2), vRamStart);
        if ((x & 1) == 0)
        {
          lookup &= 0xf;
        }
        else
        {
          lookup >>= 4;
        }
        if (lookup != 0)
        {
          int32_t palNum = ((tileChar >> 12) & 0xf) * 16 * 2;
          uint16_t pixelColor = processor.ReadU16(palNum + lookup * 2, palRamStart);
          
          if ((windowCover[i] & (1 << 5)) != 0)
          {
            if ((Blend[i] & blendTarget) != 0)
            {
              uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
              uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
              uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
              uint16_t sourceValue = tft.dgetPixel(curLine, i);
              r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
              g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
              b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
              if (r > 0xff) r = 0xff;
              if (g > 0xff) g = 0xff;
              if (b > 0xff) b = 0xff;
              pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
            }
            else
            {
              pixelColor = GBAToColor(pixelColor);
            }
          }
          else
          {
            pixelColor = GBAToColor(pixelColor);
          }
          
          DrawPixel(curLine, i, pixelColor);
          Blend[i] = blendMaskType;
        }
      }
    }
  }
}

void RenderTextBgWindowBrightInc(int32_t bg)
{
  uint8_t blendMaskType = (uint8_t)(1 << bg);

  uint16_t bgcnt = processor.ReadU16(BG0CNT + 0x2 * (uint32_t)bg, ioRegStart);

  int32_t Width = 0, Height = 0;
  switch ((bgcnt >> 14) & 0x3)
  {
    case 0: Width = 256; Height = 256; break;
    case 1: Width = 512; Height = 256; break;
    case 2: Width = 256; Height = 512; break;
    case 3: Width = 512; Height = 512; break;
  }

  int32_t screenBase = ((bgcnt >> 8) & 0x1F) * 0x800;
  int32_t charBase = ((bgcnt >> 2) & 0x3) * 0x4000;

  int32_t hofs = processor.ReadU16(BG0HOFS + (uint32_t)bg * 4, ioRegStart) & 0x1FF;
  int32_t vofs = processor.ReadU16(BG0VOFS + (uint32_t)bg * 4, ioRegStart) & 0x1FF;

  if ((bgcnt & (1 << 7)) != 0)
  {
    // 256 color tiles
    uint32_t bgy = ((curLine + vofs) & (Height - 1)) / 8;

    uint32_t tileIdx = screenBase + (((bgy & 31) * 32) * 2);
    switch ((bgcnt >> 14) & 0x3)
    {
    case 2: if (bgy >= 32) tileIdx += 32 * 32 * 2; break;
    case 3: if (bgy >= 32) tileIdx += 32 * 32 * 4; break;
    }

    int32_t tileY = ((curLine + vofs) & 0x7) * 8;

    for (int32_t i = 0; i < 240; i++)
    {
      if ((windowCover[i] & (1 << bg)) != 0)
      {
        int32_t bgx = ((i + hofs) & (Width - 1)) / 8;
        int32_t tmpTileIdx = tileIdx + ((bgx & 31) * 2);
        if (bgx >= 32) tmpTileIdx += 32 * 32 * 2;
        int32_t tileChar = processor.ReadU16(tmpTileIdx, vRamStart);
        int32_t x = (i + hofs) & 7;
        int32_t y = tileY;
        if ((tileChar & (1 << 10)) != 0) x = 7 - x;
        if ((tileChar & (1 << 11)) != 0) y = 56 - y;
        int32_t lookup = processor.ReadU16(charBase + ((tileChar & 0x3FF) * 64) + y + x, vRamStart);
        
        if (lookup != 0)
        {
          uint16_t pixelColor = processor.ReadU16(lookup * 2, palRamStart);
          
          if ((windowCover[i] & (1 << 5)) != 0)
          {
            uint8_t r = (uint8_t)((pixelColor) & 0x1F);      //First 5 Bits
            uint8_t g = (uint8_t)((pixelColor >> 5) & 0x1F);  //Middle 5 Bits
            uint8_t b = (uint8_t)((pixelColor >> 10) & 0x1F);   //Last 5 Bits 
            r = r + (((0xFF - r) * blendY) >> 4);
            g = g + (((0xFF - g) * blendY) >> 4);
            b = b + (((0xFF - b) * blendY) >> 4);
            pixelColor = ((b) << 0) | ((g) << 5) | ((r) << 11);
          }
          else
          {
            pixelColor = GBAToColor(pixelColor);
          }
          
          DrawPixel(curLine, i, pixelColor);
          Blend[i] = blendMaskType;
        }
      }
    }
  }
  else
  {
    // 16 color tiles
    int32_t bgy = ((curLine + vofs) & (Height - 1)) / 8;

    int32_t tileIdx = screenBase + (((bgy & 31) * 32) * 2);
    switch ((bgcnt >> 14) & 0x3)
    {
      case 2: if (bgy >= 32) tileIdx += 32 * 32 * 2; break;
      case 3: if (bgy >= 32) tileIdx += 32 * 32 * 4; break;
    }

    int32_t tileY = ((curLine + vofs) & 0x7) * 4;

    for (int32_t i = 0; i < 240; i++)
    {
      if ((windowCover[i] & (1 << bg)) != 0)
      {
        int32_t bgx = ((i + hofs) & (Width - 1)) / 8;
        int32_t tmpTileIdx = tileIdx + ((bgx & 31) * 2);
        if (bgx >= 32) tmpTileIdx += 32 * 32 * 2;
        int32_t tileChar = processor.ReadU16(tmpTileIdx, vRamStart);
        int32_t x = (i + hofs) & 7;
        int32_t y = tileY;
        if ((tileChar & (1 << 10)) != 0) x = 7 - x;
        if ((tileChar & (1 << 11)) != 0) y = 28 - y;
        int32_t lookup = processor.ReadU16(charBase + ((tileChar & 0x3FF) * 32) + y + (x / 2), vRamStart);
        if ((x & 1) == 0)
        {
          lookup &= 0xf;
        }
        else
        {
          lookup >>= 4;
        }
        if (lookup != 0)
        {
          int32_t palNum = ((tileChar >> 12) & 0xf) * 16 * 2;
          uint16_t pixelColor = processor.ReadU16(palNum + lookup * 2, palRamStart);
          
          if ((windowCover[i] & (1 << 5)) != 0)
          {
            uint8_t r = (uint8_t)((pixelColor) & 0x1F);      //First 5 Bits
            uint8_t g = (uint8_t)((pixelColor >> 5) & 0x1F);  //Middle 5 Bits
            uint8_t b = (uint8_t)((pixelColor >> 10) & 0x1F);   //Last 5 Bits 
            r = r + (((0xFF - r) * blendY) >> 4);
            g = g + (((0xFF - g) * blendY) >> 4);
            b = b + (((0xFF - b) * blendY) >> 4);
            pixelColor = ((b) << 0) | ((g) << 5) | ((r) << 11);
          }
          else
          {
            pixelColor = GBAToColor(pixelColor);
          }
          
          DrawPixel(curLine, i, pixelColor);
          Blend[i] = blendMaskType;
        }
      }
    }
  }
}

void RenderTextBgWindowBrightDec(int32_t bg)
{
  uint8_t blendMaskType = (uint8_t)(1 << bg);

  uint16_t bgcnt = processor.ReadU16(BG0CNT + 0x2 * (uint32_t)bg, ioRegStart);

  int32_t Width = 0, Height = 0;
  switch ((bgcnt >> 14) & 0x3)
  {
    case 0: Width = 256; Height = 256; break;
    case 1: Width = 512; Height = 256; break;
    case 2: Width = 256; Height = 512; break;
    case 3: Width = 512; Height = 512; break;
  }

  int32_t screenBase = ((bgcnt >> 8) & 0x1F) * 0x800;
  int32_t charBase = ((bgcnt >> 2) & 0x3) * 0x4000;

  int32_t hofs = processor.ReadU16(BG0HOFS + (uint32_t)bg * 4, ioRegStart) & 0x1FF;
  int32_t vofs = processor.ReadU16(BG0VOFS + (uint32_t)bg * 4, ioRegStart) & 0x1FF;

  if ((bgcnt & (1 << 7)) != 0)
  {
    // 256 color tiles
    int32_t bgy = ((curLine + vofs) & (Height - 1)) / 8;

    int32_t tileIdx = screenBase + (((bgy & 31) * 32) * 2);
    switch ((bgcnt >> 14) & 0x3)
    {
      case 2: if (bgy >= 32) tileIdx += 32 * 32 * 2; break;
      case 3: if (bgy >= 32) tileIdx += 32 * 32 * 4; break;
    }

    int32_t tileY = ((curLine + vofs) & 0x7) * 8;

    for (int32_t i = 0; i < 240; i++)
    {
      if ((windowCover[i] & (1 << bg)) != 0)
      {
        int32_t bgx = ((i + hofs) & (Width - 1)) / 8;
        int32_t tmpTileIdx = tileIdx + ((bgx & 31) * 2);
        if (bgx >= 32) tmpTileIdx += 32 * 32 * 2;
        int32_t tileChar = processor.ReadU16(tmpTileIdx, vRamStart);
        int32_t x = (i + hofs) & 7;
        int32_t y = tileY;
        if ((tileChar & (1 << 10)) != 0) x = 7 - x;
        if ((tileChar & (1 << 11)) != 0) y = 56 - y;
        int32_t lookup = processor.ReadU16(charBase + ((tileChar & 0x3FF) * 64) + y + x, vRamStart);
        if (lookup != 0)
        {
          uint16_t pixelColor = processor.ReadU16(lookup * 2, palRamStart);
          
          if ((windowCover[i] & (1 << 5)) != 0)
          {
            uint8_t r = (uint8_t)((pixelColor) & 0x1F);      //First 5 Bits
            uint8_t g = (uint8_t)((pixelColor >> 5) & 0x1F);  //Middle 5 Bits
            uint8_t b = (uint8_t)((pixelColor >> 10) & 0x1F);   //Last 5 Bits 
            r = r - ((r * blendY) >> 4);
            g = g - ((g * blendY) >> 4);
            b = b - ((b * blendY) >> 4);
            pixelColor = ((b) << 0) | ((g) << 5) | ((r) << 11);
          }
          else
          {
            pixelColor = GBAToColor(pixelColor);
          }
          
          DrawPixel(curLine, i, pixelColor);
          Blend[i] = blendMaskType;
        }
      }
    }
  }
  else
  {
    // 16 color tiles
    uint32_t bgy = ((curLine + vofs) & (Height - 1)) / 8;

    int32_t tileIdx = screenBase + (((bgy & 31) * 32) * 2);
    switch ((bgcnt >> 14) & 0x3)
    {
      case 2: if (bgy >= 32) tileIdx += 32 * 32 * 2; break;
      case 3: if (bgy >= 32) tileIdx += 32 * 32 * 4; break;
    }

    int32_t tileY = ((curLine + vofs) & 0x7) * 4;

    for (int32_t i = 0; i < 240; i++)
    {
      if ((windowCover[i] & (1 << bg)) != 0)
      {
        int32_t bgx = ((i + hofs) & (Width - 1)) / 8;
        int32_t tmpTileIdx = tileIdx + ((bgx & 31) * 2);
        if (bgx >= 32) tmpTileIdx += 32 * 32 * 2;
        int32_t tileChar = processor.ReadU16(tmpTileIdx, vRamStart);
        int32_t x = (i + hofs) & 7;
        int32_t y = tileY;
        if ((tileChar & (1 << 10)) != 0) x = 7 - x;
        if ((tileChar & (1 << 11)) != 0) y = 28 - y;
        int32_t lookup = processor.ReadU16(charBase + ((tileChar & 0x3FF) * 32) + y + (x / 2), vRamStart);
        if ((x & 1) == 0)
        {
          lookup &= 0xf;
        }
        else
        {
          lookup >>= 4;
        }
        if (lookup != 0)
        {
          int32_t palNum = ((tileChar >> 12) & 0xf) * 16 * 2;
          uint16_t pixelColor = processor.ReadU16(palNum + lookup * 2, palRamStart);
          
          if ((windowCover[i] & (1 << 5)) != 0)
          {
            uint8_t r = (uint8_t)((pixelColor) & 0x1F);      //First 5 Bits
            uint8_t g = (uint8_t)((pixelColor >> 5) & 0x1F);  //Middle 5 Bits
            uint8_t b = (uint8_t)((pixelColor >> 10) & 0x1F);   //Last 5 Bits 
            r = r - ((r * blendY) >> 4);
            g = g - ((g * blendY) >> 4);
            b = b - ((b * blendY) >> 4);
            pixelColor = ((b) << 0) | ((g) << 5) | ((r) << 11);
          }
          else
          {
            pixelColor = GBAToColor(pixelColor);
          }
          
          DrawPixel(curLine, i, pixelColor);
          Blend[i] = blendMaskType;
        }
      }
    }
  }
}

void RenderTextBgNormal(int32_t bg)
{
  uint8_t blendMaskType = (uint8_t)(1 << bg);

  uint16_t bgcnt = processor.ReadU16(BG0CNT + 0x2 * (uint32_t)bg, ioRegStart);

  int32_t Width = 0, Height = 0;
  switch ((bgcnt >> 14) & 0x3)
  {
  case 0: Width = 256; Height = 256; break;
  case 1: Width = 512; Height = 256; break;
  case 2: Width = 256; Height = 512; break;
  case 3: Width = 512; Height = 512; break;
  }

  int32_t screenBase = ((bgcnt >> 8) & 0x1F) * 0x800;
  int32_t charBase = ((bgcnt >> 2) & 0x3) * 0x4000;

  int32_t hofs = processor.ReadU16(BG0HOFS + (uint32_t)bg * 4, ioRegStart) & 0x1FF;
  int32_t vofs = processor.ReadU16(BG0VOFS + (uint32_t)bg * 4, ioRegStart) & 0x1FF;

  if ((bgcnt & (1 << 7)) != 0)
  {
    // 256 color tiles
    int32_t bgy = ((curLine + vofs) & (Height - 1)) / 8;

    int32_t tileIdx = screenBase + (((bgy & 31) * 32) * 2);
    switch ((bgcnt >> 14) & 0x3)
    {
      case 2: if (bgy >= 32) tileIdx += 32 * 32 * 2; break;
      case 3: if (bgy >= 32) tileIdx += 32 * 32 * 4; break;
    }

    int32_t tileY = ((curLine + vofs) & 0x7) * 8;

    for (int32_t i = 0; i < 240; i++)
    {
      if (true)
      {
        int32_t bgx = ((i + hofs) & (Width - 1)) / 8;
        int32_t tmpTileIdx = tileIdx + ((bgx & 31) * 2);
        if (bgx >= 32) tmpTileIdx += 32 * 32 * 2;
        int32_t tileChar = processor.ReadU16(tmpTileIdx, vRamStart);
        int32_t x = (i + hofs) & 7;
        int32_t y = tileY;
        if ((tileChar & (1 << 10)) != 0) x = 7 - x;
        if ((tileChar & (1 << 11)) != 0) y = 56 - y;
        int32_t lookup = processor.ReadU16(charBase + ((tileChar & 0x3FF) * 64) + y + x, vRamStart);
        if (lookup != 0)
        {
          uint16_t pixelColor = GBAToColor(processor.ReadU16(lookup * 2, palRamStart));
          DrawPixel(curLine, i, pixelColor);
          Blend[i] = blendMaskType;
        }
      }
    }
  }
  else
  {
    // 16 color tiles
    int32_t bgy = ((curLine + vofs) & (Height - 1)) / 8;

    int32_t tileIdx = screenBase + (((bgy & 31) * 32) * 2);
    switch ((bgcnt >> 14) & 0x3)
    {
      case 2: if (bgy >= 32) tileIdx += 32 * 32 * 2; break;
      case 3: if (bgy >= 32) tileIdx += 32 * 32 * 4; break;
    }

    int32_t tileY = ((curLine + vofs) & 0x7) * 4;

    for (int32_t i = 0; i < 240; i++)
    {
      if (true)
      {
        int32_t bgx = ((i + hofs) & (Width - 1)) / 8;
        int32_t tmpTileIdx = tileIdx + ((bgx & 31) * 2);
        if (bgx >= 32) tmpTileIdx += 32 * 32 * 2;
        int32_t tileChar = processor.ReadU16(tmpTileIdx, vRamStart);
        int32_t x = (i + hofs) & 7;
        int32_t y = tileY;
        if ((tileChar & (1 << 10)) != 0) x = 7 - x;
        if ((tileChar & (1 << 11)) != 0) y = 28 - y;
        int32_t lookup = processor.ReadU16(charBase + ((tileChar & 0x3FF) * 32) + y + (x / 2), vRamStart);
        if ((x & 1) == 0)
        {
          lookup &= 0xf;
        }
        else
        {
          lookup >>= 4;
        }
        if (lookup != 0)
        {
          int32_t palNum = ((tileChar >> 12) & 0xf) * 16 * 2;
          uint16_t pixelColor = GBAToColor(processor.ReadU16(palNum + lookup * 2, palRamStart));
          DrawPixel(curLine, i, pixelColor);
          Blend[i] = blendMaskType;
        }
      }
    }
  }
}

void RenderTextBgBlend(int32_t bg)
{
  uint8_t blendMaskType = (uint8_t)(1 << bg);

  uint16_t bgcnt = processor.ReadU16(BG0CNT + 0x2 * (uint32_t)bg, ioRegStart);

  int32_t Width = 0, Height = 0;
  switch ((bgcnt >> 14) & 0x3)
  {
    case 0: Width = 256; Height = 256; break;
    case 1: Width = 512; Height = 256; break;
    case 2: Width = 256; Height = 512; break;
    case 3: Width = 512; Height = 512; break;
  }

  int32_t screenBase = ((bgcnt >> 8) & 0x1F) * 0x800;
  int32_t charBase = ((bgcnt >> 2) & 0x3) * 0x4000;
  
  int32_t hofs = processor.ReadU16(BG0HOFS + (uint32_t)bg * 4, ioRegStart) & 0x1FF;
  int32_t vofs = processor.ReadU16(BG0VOFS + (uint32_t)bg * 4, ioRegStart) & 0x1FF;

  if ((bgcnt & (1 << 7)) != 0)
  {
    // 256 color tiles
    int32_t bgy = ((curLine + vofs) & (Height - 1)) / 8;

    int32_t tileIdx = screenBase + (((bgy & 31) * 32) * 2);
    switch ((bgcnt >> 14) & 0x3)
    {
      case 2: if (bgy >= 32) tileIdx += 32 * 32 * 2; break;
      case 3: if (bgy >= 32) tileIdx += 32 * 32 * 4; break;
    }

    int32_t tileY = ((curLine + vofs) & 0x7) * 8;

    for (int32_t i = 0; i < 240; i++)
    {
      if (true)
      {
        int32_t bgx = ((i + hofs) & (Width - 1)) / 8;
        int32_t tmpTileIdx = tileIdx + ((bgx & 31) * 2);
        if (bgx >= 32) tmpTileIdx += 32 * 32 * 2;
        int32_t tileChar = processor.ReadU16(tmpTileIdx, vRamStart);
        int32_t x = (i + hofs) & 7;
        int32_t y = tileY;
        if ((tileChar & (1 << 10)) != 0) x = 7 - x;
        if ((tileChar & (1 << 11)) != 0) y = 56 - y;
        int32_t lookup = processor.ReadU16(charBase + ((tileChar & 0x3FF) * 64) + y + x, vRamStart);
        if (lookup != 0)
        {
          uint16_t pixelColor = processor.ReadU16(lookup * 2, palRamStart);
          
          if ((Blend[i] & blendTarget) != 0)
          {
              uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
              uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
              uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
              uint16_t sourceValue = tft.dgetPixel(curLine, i);
              r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
              g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
              b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
              if (r > 0xff) r = 0xff;
              if (g > 0xff) g = 0xff;
              if (b > 0xff) b = 0xff;
              pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
          }
          else
          {
            pixelColor = GBAToColor(pixelColor);
          }
          
          DrawPixel(curLine, i, pixelColor); 
          Blend[i] = blendMaskType;
        }
      }
    }
  }
  else
  {
    // 16 color tiles
    int32_t bgy = ((curLine + vofs) & (Height - 1)) / 8;

    int32_t tileIdx = screenBase + (((bgy & 31) * 32) * 2);
    switch ((bgcnt >> 14) & 0x3)
    {
      case 2: if (bgy >= 32) tileIdx += 32 * 32 * 2; break;
      case 3: if (bgy >= 32) tileIdx += 32 * 32 * 4; break;
    }

    int32_t tileY = ((curLine + vofs) & 0x7) * 4;

    for (int32_t i = 0; i < 240; i++)
    {
      if (true)
      {
        int32_t bgx = ((i + hofs) & (Width - 1)) / 8;
        int32_t tmpTileIdx = tileIdx + ((bgx & 31) * 2);
        if (bgx >= 32) tmpTileIdx += 32 * 32 * 2;
        int32_t tileChar = processor.ReadU16(tmpTileIdx, vRamStart);
        int32_t x = (i + hofs) & 7;
        int32_t y = tileY;
        if ((tileChar & (1 << 10)) != 0) x = 7 - x;
        if ((tileChar & (1 << 11)) != 0) y = 28 - y;
        int32_t lookup = processor.ReadU16(charBase + ((tileChar & 0x3FF) * 32) + y + (x / 2), vRamStart);
        if ((x & 1) == 0)
        {
          lookup &= 0xf;
        }
        else
        {
          lookup >>= 4;
        }
        if (lookup != 0)
        {
          int32_t palNum = ((tileChar >> 12) & 0xf) * 16 * 2;
          uint16_t pixelColor = processor.ReadU16(palNum + lookup * 2, palRamStart);
          
          if ((Blend[i] & blendTarget) != 0)
          {
              uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
              uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
              uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
              uint16_t sourceValue = tft.dgetPixel(curLine, i);
              r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
              g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
              b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
              if (r > 0xff) r = 0xff;
              if (g > 0xff) g = 0xff;
              if (b > 0xff) b = 0xff;
              pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
          }
          else
          {
            pixelColor = GBAToColor(pixelColor);
          }
          
          DrawPixel(curLine, i, pixelColor); 
          Blend[i] = blendMaskType;
        }
      }
    }
  }
}

void RenderTextBgBrightInc(int32_t bg)
{
  uint8_t blendMaskType = (uint8_t)(1 << bg);

  uint16_t bgcnt = processor.ReadU16(BG0CNT + 0x2 * (uint32_t)bg, ioRegStart);

  int32_t Width = 0, Height = 0;
  switch ((bgcnt >> 14) & 0x3)
  {
  case 0: Width = 256; Height = 256; break;
  case 1: Width = 512; Height = 256; break;
  case 2: Width = 256; Height = 512; break;
  case 3: Width = 512; Height = 512; break;
  }

  int32_t screenBase = ((bgcnt >> 8) & 0x1F) * 0x800;
  int32_t charBase = ((bgcnt >> 2) & 0x3) * 0x4000;

  int32_t hofs = processor.ReadU16(BG0HOFS + (uint32_t)bg * 4, ioRegStart) & 0x1FF;
  int32_t vofs = processor.ReadU16(BG0VOFS + (uint32_t)bg * 4, ioRegStart) & 0x1FF;

  if ((bgcnt & (1 << 7)) != 0)
  {
    // 256 color tiles
    int32_t bgy = ((curLine + vofs) & (Height - 1)) / 8;

    int32_t tileIdx = screenBase + (((bgy & 31) * 32) * 2);
    switch ((bgcnt >> 14) & 0x3)
    {
      case 2: if (bgy >= 32) tileIdx += 32 * 32 * 2; break;
      case 3: if (bgy >= 32) tileIdx += 32 * 32 * 4; break;
    }

    int32_t tileY = ((curLine + vofs) & 0x7) * 8;

    for (int32_t i = 0; i < 240; i++)
    {
      if (true)
      {
        int32_t bgx = ((i + hofs) & (Width - 1)) / 8;
        int32_t tmpTileIdx = tileIdx + ((bgx & 31) * 2);
        if (bgx >= 32) tmpTileIdx += 32 * 32 * 2;
        int32_t tileChar = processor.ReadU16(tmpTileIdx, vRamStart);
        int32_t x = (i + hofs) & 7;
        int32_t y = tileY;
        if ((tileChar & (1 << 10)) != 0) x = 7 - x;
        if ((tileChar & (1 << 11)) != 0) y = 56 - y;
        int32_t lookup = processor.ReadU16(charBase + ((tileChar & 0x3FF) * 64) + y + x, vRamStart);
        if (lookup != 0)
        {
          uint16_t pixelColor = processor.ReadU16(lookup * 2, palRamStart);
          uint16_t r = (uint8_t)((pixelColor) & 0x1F);       //First 5 Bits
          uint16_t g = (uint8_t)((pixelColor >> 5) & 0x1F);  //Middle 5 Bits
          uint16_t b = (uint8_t)((pixelColor >> 10) & 0x1F);   //Last 5 Bits
          r = r + (((0xFF - r) * blendY) >> 4);
          g = g + (((0xFF - g) * blendY) >> 4);
          b = b + (((0xFF - b) * blendY) >> 4);
          pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
          DrawPixel(curLine, i, pixelColor); 
          Blend[i] = blendMaskType;
        }
      }
    }
  }
  else
  {
    // 16 color tiles
    int32_t bgy = ((curLine + vofs) & (Height - 1)) / 8;

    int32_t tileIdx = screenBase + (((bgy & 31) * 32) * 2);
    switch ((bgcnt >> 14) & 0x3)
    {
    case 2: if (bgy >= 32) tileIdx += 32 * 32 * 2; break;
    case 3: if (bgy >= 32) tileIdx += 32 * 32 * 4; break;
    }

    int32_t tileY = ((curLine + vofs) & 0x7) * 4;

    for (int32_t i = 0; i < 240; i++)
    {
      if (true)
      {
        int32_t bgx = ((i + hofs) & (Width - 1)) / 8;
        int32_t tmpTileIdx = tileIdx + ((bgx & 31) * 2);
        if (bgx >= 32) tmpTileIdx += 32 * 32 * 2;
        int32_t tileChar = processor.ReadU16(tmpTileIdx, vRamStart);
        int32_t x = (i + hofs) & 7;
        int32_t y = tileY;
        if ((tileChar & (1 << 10)) != 0) x = 7 - x;
        if ((tileChar & (1 << 11)) != 0) y = 28 - y;
        int32_t lookup = processor.ReadU16(charBase + ((tileChar & 0x3FF) * 32) + y + (x / 2), vRamStart);
        if ((x & 1) == 0)
        {
          lookup &= 0xf;
        }
        else
        {
          lookup >>= 4;
        }
        if (lookup != 0)
        {
          int32_t palNum = ((tileChar >> 12) & 0xf) * 16 * 2;
          uint16_t pixelColor = processor.ReadU16(palNum + lookup * 2, palRamStart);
          uint16_t r = (uint8_t)((pixelColor) & 0x1F);       //First 5 Bits
          uint16_t g = (uint8_t)((pixelColor >> 5) & 0x1F);  //Middle 5 Bits
          uint16_t b = (uint8_t)((pixelColor >> 10) & 0x1F);   //Last 5 Bits
          r = r + (((0xFF - r) * blendY) >> 4);
          g = g + (((0xFF - g) * blendY) >> 4);
          b = b + (((0xFF - b) * blendY) >> 4);
          pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
          DrawPixel(curLine, i, pixelColor); 
          Blend[i] = blendMaskType;
        }
      }
    }
  }
}

void RenderTextBgBrightDec(int32_t bg)
{
  uint8_t blendMaskType = (uint8_t)(1 << bg);

  uint16_t bgcnt = processor.ReadU16(BG0CNT + 0x2 * (uint32_t)bg, ioRegStart);

  int32_t Width = 0, Height = 0;
  switch ((bgcnt >> 14) & 0x3)
  {
    case 0: Width = 256; Height = 256; break;
    case 1: Width = 512; Height = 256; break;
    case 2: Width = 256; Height = 512; break;
    case 3: Width = 512; Height = 512; break;
  }

  int32_t screenBase = ((bgcnt >> 8) & 0x1F) * 0x800;
  int32_t charBase = ((bgcnt >> 2) & 0x3) * 0x4000;

  int32_t hofs = processor.ReadU16(BG0HOFS + (uint32_t)bg * 4, ioRegStart) & 0x1FF;
  int32_t vofs = processor.ReadU16(BG0VOFS + (uint32_t)bg * 4, ioRegStart) & 0x1FF;

  if ((bgcnt & (1 << 7)) != 0)
  {
    // 256 color tiles
    int32_t bgy = ((curLine + vofs) & (Height - 1)) / 8;

    int32_t tileIdx = screenBase + (((bgy & 31) * 32) * 2);
    switch ((bgcnt >> 14) & 0x3)
    {
      case 2: if (bgy >= 32) tileIdx += 32 * 32 * 2; break;
      case 3: if (bgy >= 32) tileIdx += 32 * 32 * 4; break;
    }

    int32_t tileY = ((curLine + vofs) & 0x7) * 8;

    for (int32_t i = 0; i < 240; i++)
    {
      if (true)
      {
        int32_t bgx = ((i + hofs) & (Width - 1)) / 8;
        int32_t tmpTileIdx = tileIdx + ((bgx & 31) * 2);
        if (bgx >= 32) tmpTileIdx += 32 * 32 * 2;
        int32_t tileChar = processor.ReadU16(tmpTileIdx, vRamStart);
        int32_t x = (i + hofs) & 7;
        int32_t y = tileY;
        if ((tileChar & (1 << 10)) != 0) x = 7 - x;
        if ((tileChar & (1 << 11)) != 0) y = 56 - y;
        int32_t lookup = processor.ReadU16(charBase + ((tileChar & 0x3FF) * 64) + y + x, vRamStart);
        if (lookup != 0)
        {
          uint16_t pixelColor = processor.ReadU16(lookup * 2, palRamStart);
          uint16_t r = (uint8_t)((pixelColor) & 0x1F);       //First 5 Bits
          uint16_t g = (uint8_t)((pixelColor >> 5) & 0x1F);  //Middle 5 Bits
          uint16_t b = (uint8_t)((pixelColor >> 10) & 0x1F);   //Last 5 Bits
          r = r - ((r * blendY) >> 4);
          g = g - ((g * blendY) >> 4);
          b = b - ((b * blendY) >> 4);
          pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
          DrawPixel(curLine, i, pixelColor); 
          Blend[i] = blendMaskType;
        }
      }
    }
  }
  else
  {
    // 16 color tiles
    int32_t bgy = ((curLine + vofs) & (Height - 1)) / 8;

    int32_t tileIdx = screenBase + (((bgy & 31) * 32) * 2);
    switch ((bgcnt >> 14) & 0x3)
    {
      case 2: if (bgy >= 32) tileIdx += 32 * 32 * 2; break;
      case 3: if (bgy >= 32) tileIdx += 32 * 32 * 4; break;
    }

    int32_t tileY = ((curLine + vofs) & 0x7) * 4;

    for (int32_t i = 0; i < 240; i++)
    {
      if (true)
      {
        int32_t bgx = ((i + hofs) & (Width - 1)) / 8;
        int32_t tmpTileIdx = tileIdx + ((bgx & 31) * 2);
        if (bgx >= 32) tmpTileIdx += 32 * 32 * 2;
        int32_t tileChar = processor.ReadU16(tmpTileIdx, vRamStart);
        int32_t x = (i + hofs) & 7;
        int32_t y = tileY;
        if ((tileChar & (1 << 10)) != 0) x = 7 - x;
        if ((tileChar & (1 << 11)) != 0) y = 28 - y;
        int32_t lookup = processor.ReadU16(charBase + ((tileChar & 0x3FF) * 32) + y + (x / 2), vRamStart);
        if ((x & 1) == 0)
        {
          lookup &= 0xf;
        }
        else
        {
          lookup >>= 4;
        }
        if (lookup != 0)
        {
          int32_t palNum = ((tileChar >> 12) & 0xf) * 16 * 2;
          uint16_t pixelColor = processor.ReadU16(palNum + lookup * 2, palRamStart);
          uint16_t r = (uint8_t)((pixelColor) & 0x1F);       //First 5 Bits
          uint16_t g = (uint8_t)((pixelColor >> 5) & 0x1F);  //Middle 5 Bits
          uint16_t b = (uint8_t)((pixelColor >> 10) & 0x1F);   //Last 5 Bits
          r = r - ((r * blendY) >> 4);
          g = g - ((g * blendY) >> 4);
          b = b - ((b * blendY) >> 4);
          pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
          DrawPixel(curLine, i, pixelColor); 
          Blend[i] = blendMaskType;
        }
      }
    }
  }
}

void DrawSpritesNormal(uint8_t priority)
{
  // OBJ must be enabled in this.dispCnt
  if ((dispCnt & (1 << 12)) == 0) return;

  uint8_t blendMaskType = (uint8_t)(1 << 4);

  for (int32_t oamNum = 127; oamNum >= 0; oamNum--)
  {
    uint16_t attr2 = processor.ReadU16Debug(OAM_BASE + (uint32_t)(oamNum * 8) + 4);

    if (((attr2 >> 10) & 3) != priority) continue;

    uint16_t attr0 = processor.ReadU16Debug(OAM_BASE + (uint32_t)(oamNum * 8) + 0);
    uint16_t attr1 = processor.ReadU16Debug(OAM_BASE + (uint32_t)(oamNum * 8) + 2);

    int32_t x = attr1 & 0x1FF;
    int32_t y = attr0 & 0xFF;

    bool semiTransparent = false;

    switch ((attr0 >> 10) & 3)
    {
    case 1:
      // Semi-transparent
      semiTransparent = true;
      break;
    case 2:
      // Obj window
      continue;
    case 3:
      continue;
    }

    if ((dispCnt & 0x7) >= 3 && (attr2 & 0x3FF) < 0x200) continue;

    int32_t Width = -1, Height = -1;
    switch ((attr0 >> 14) & 3)
    {
    case 0:
      // Square
      switch ((attr1 >> 14) & 3)
      {
      case 0: Width = 8; Height = 8; break;
      case 1: Width = 16; Height = 16; break;
      case 2: Width = 32; Height = 32; break;
      case 3: Width = 64; Height = 64; break;
      }
      break;
    case 1:
      // Horizontal Rectangle
      switch ((attr1 >> 14) & 3)
      {
      case 0: Width = 16; Height = 8; break;
      case 1: Width = 32; Height = 8; break;
      case 2: Width = 32; Height = 16; break;
      case 3: Width = 64; Height = 32; break;
      }
      break;
    case 2:
      // Vertical Rectangle
      switch ((attr1 >> 14) & 3)
      {
      case 0: Width = 8; Height = 16; break;
      case 1: Width = 8; Height = 32; break;
      case 2: Width = 16; Height = 32; break;
      case 3: Width = 32; Height = 64; break;
      }
      break;
    }

    // Check double size flag here

    int32_t rWidth = Width, rHeight = Height;
    if ((attr0 & (1 << 8)) != 0)
    {
      // Rot-scale on
      if ((attr0 & (1 << 9)) != 0)
      {
        rWidth *= 2;
        rHeight *= 2;
      }
    }
    else
    {
      // Invalid sprite
      if ((attr0 & (1 << 9)) != 0)
        Width = -1;
    }

    if (Width == -1)
    {
      // Invalid sprite
      continue;
    }

    // Y clipping
    if (y > ((y + rHeight) & 0xff))
    {
      if (curLine >= ((y + rHeight) & 0xff) && !(y < curLine)) continue;
    }
    else
    {
      if (curLine < y || curLine >= ((y + rHeight) & 0xff)) continue;
    }

    int32_t scale = 1;
    if ((attr0 & (1 << 13)) != 0) scale = 2;

    int32_t spritey = curLine - y;
    if (spritey < 0) spritey += 256;

    if (semiTransparent)
    {
      if ((attr0 & (1 << 8)) == 0)
      {
        if ((attr1 & (1 << 13)) != 0) spritey = (Height - 1) - spritey;

        int32_t baseSprite;
        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * (Width / 8)) * scale;
        }
        else
        {
          // 2 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * 0x20);
        }

        int32_t baseInc = scale;
        if ((attr1 & (1 << 12)) != 0)
        {
          baseSprite += ((Width / 8) * scale) - scale;
          baseInc = -baseInc;
        }

        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && true)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 8) + tx;
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(0x200 + lookup * 2, palRamStart);
                
                if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                {
                  uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                  uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                  uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                  uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                  r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                  g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                  b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                  if (r > 0xff) r = 0xff;
                  if (g > 0xff) g = 0xff;
                  if (b > 0xff) b = 0xff;
                  pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && true)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 4) + (tx / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(palIdx + lookup * 2, palRamStart);
                
                if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                {
                  uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                  uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                  uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                  uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                  r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                  g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                  b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                  if (r > 0xff) r = 0xff;
                  if (g > 0xff) g = 0xff;
                  if (b > 0xff) b = 0xff;
                  pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
      }
      else
      {
        int32_t rotScaleParam = (attr1 >> 9) & 0x1F;

        uint8_t dx = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x6);
        uint8_t dmx = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0xE);
        uint8_t dy = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x16);
        uint8_t dmy = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x1E);

        int32_t cx = rWidth / 2;
        int32_t cy = rHeight / 2;

        int32_t baseSprite = attr2 & 0x3FF;
        int32_t pitch;

        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          pitch = (Width / 8) * scale;
        }
        else
        {
          // 2 dimensional
          pitch = 0x20;
        }

        int32_t rx = (int32_t)((dmx * (spritey - cy)) - (cx * dx) + (Width << 7));
        int32_t ry = (int32_t)((dmy * (spritey - cy)) - (cx * dy) + (Height << 7));

        // Draw a rot/scale sprite
        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && true)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 8) + (tx & 7);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(0x200 + lookup * 2, palRamStart);
                
                if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                {
                  uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                  uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                  uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                  uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                  r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                  g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                  b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                  if (r > 0xff) r = 0xff;
                  if (g > 0xff) g = 0xff;
                  if (b > 0xff) b = 0xff;
                  pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int32_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && true)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 4) + ((tx & 7) / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(palIdx + lookup * 2, palRamStart);
                
                if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                {
                  uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                  uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                  uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                  uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                  r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                  g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                  b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                  if (r > 0xff) r = 0xff;
                  if (g > 0xff) g = 0xff;
                  if (b > 0xff) b = 0xff;
                  pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
      }
    }
    else
    {
      if ((attr0 & (1 << 8)) == 0)
      {
        if ((attr1 & (1 << 13)) != 0) spritey = (Height - 1) - spritey;

        int32_t baseSprite;
        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * (Width / 8)) * scale;
        }
        else
        {
          // 2 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * 0x20);
        }

        int32_t baseInc = scale;
        if ((attr1 & (1 << 12)) != 0)
        {
          baseSprite += ((Width / 8) * scale) - scale;
          baseInc = -baseInc;
        }

        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && true)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 8) + tx;
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = GBAToColor(processor.ReadU16(0x200 + lookup * 2, palRamStart));
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && true)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 4) + (tx / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = GBAToColor(processor.ReadU16(palIdx + lookup * 2, palRamStart));
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
      }
      else
      {
        int32_t rotScaleParam = (attr1 >> 9) & 0x1F;

        uint16_t dx = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x6);
        uint16_t dmx = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0xE);
        uint16_t dy = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x16);
        uint16_t dmy = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x1E);

        int32_t cx = rWidth / 2;
        int32_t cy = rHeight / 2;

        int32_t baseSprite = attr2 & 0x3FF;
        int32_t pitch;

        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          pitch = (Width / 8) * scale;
        }
        else
        {
          // 2 dimensional
          pitch = 0x20;
        }

        int32_t rx = (uint32_t)((dmx * (spritey - cy)) - (cx * dx) + (Width << 7));
        int32_t ry = (uint32_t)((dmy * (spritey - cy)) - (cx * dy) + (Height << 7));

        // Draw a rot/scale sprite
        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && true)
            {
              uint16_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 8) + (tx & 7);
              uint8_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = GBAToColor(processor.ReadU16(0x200 + lookup * 2, palRamStart));
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (uint8_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && true)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 4) + ((tx & 7) / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = GBAToColor(processor.ReadU16(palIdx + lookup * 2, palRamStart));
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
      }
    }
  }
}

void DrawSpritesBlend(uint8_t priority)
{
  //Serial.println("DrawSpritesBlend");
  // OBJ must be enabled in this.dispCnt
  if ((dispCnt & (1 << 12)) == 0) return;

  uint8_t blendMaskType = (uint8_t)(1 << 4);

  for (int32_t oamNum = 127; oamNum >= 0; oamNum--)
  {
    uint16_t attr2 = processor.ReadU16Debug(OAM_BASE + (uint32_t)(oamNum * 8) + 4); //Incorrect all the time e.g. 119 should be 49271

    if (((attr2 >> 10) & 3) != priority) continue;

    uint16_t attr0 = processor.ReadU16Debug(OAM_BASE + (uint32_t)(oamNum * 8) + 0);
    uint16_t attr1 = processor.ReadU16Debug(OAM_BASE + (uint32_t)(oamNum * 8) + 2);

    int32_t x = attr1 & 0x1FF;
    int32_t y = attr0 & 0xFF;

    bool semiTransparent = false;

    switch ((attr0 >> 10) & 3)
    {
    case 1:
      // Semi-transparent
      semiTransparent = true;
      break;
    case 2:
      // Obj window
      continue;
    case 3:
      continue;
    }

    if ((dispCnt & 0x7) >= 3 && (attr2 & 0x3FF) < 0x200) continue;
    
    int32_t Width = -1, Height = -1;
    switch ((attr0 >> 14) & 3)
    {
    case 0:
      // Square
      switch ((attr1 >> 14) & 3)
      {
      case 0: Width = 8; Height = 8; break;
      case 1: Width = 16; Height = 16; break;
      case 2: Width = 32; Height = 32; break;
      case 3: Width = 64; Height = 64; break;
      }
      break;
    case 1:
      // Horizontal Rectangle
      switch ((attr1 >> 14) & 3)
      {
      case 0: Width = 16; Height = 8; break;
      case 1: Width = 32; Height = 8; break;
      case 2: Width = 32; Height = 16; break;
      case 3: Width = 64; Height = 32; break;
      }
      break;
    case 2:
      // Vertical Rectangle
      switch ((attr1 >> 14) & 3)
      {
      case 0: Width = 8; Height = 16; break;
      case 1: Width = 8; Height = 32; break;
      case 2: Width = 16; Height = 32; break;
      case 3: Width = 32; Height = 64; break;
      }
      break;
    }

    // Check double size flag here

    int32_t rWidth = Width, rHeight = Height;
    if ((attr0 & (1 << 8)) != 0)
    {
      // Rot-scale on
      if ((attr0 & (1 << 9)) != 0)
      {
        rWidth *= 2;
        rHeight *= 2;
      }
    }
    else
    {
      // Invalid sprite
      if ((attr0 & (1 << 9)) != 0)
        Width = -1;
    }

    if (Width == -1)
    {
      // Invalid sprite
      continue;
    }

    // Y clipping
    if (y > ((y + rHeight) & 0xff))
    {
      if (curLine >= ((y + rHeight) & 0xff) && !(y < curLine)) continue;
    }
    else
    {
      if (curLine < y || curLine >= ((y + rHeight) & 0xff)) continue;
    }

    int32_t scale = 1;
    if ((attr0 & (1 << 13)) != 0) scale = 2;

    int32_t spritey = curLine - y;
    if (spritey < 0) spritey += 256;

    if (semiTransparent)
    {
      if ((attr0 & (1 << 8)) == 0)
      {
        if ((attr1 & (1 << 13)) != 0) spritey = (Height - 1) - spritey;

        int32_t baseSprite;
        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * (Width / 8)) * scale;
        }
        else
        {
          // 2 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * 0x20);
        }

        int32_t baseInc = scale;
        if ((attr1 & (1 << 12)) != 0)
        {
          baseSprite += ((Width / 8) * scale) - scale;
          baseInc = -baseInc;
        }

        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && true)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 8) + tx;
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(0x200 + lookup * 2, palRamStart);
                
                if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                {
                  uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                  uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                  uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                  uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                  r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                  g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                  b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                  if (r > 0xff) r = 0xff;
                  if (g > 0xff) g = 0xff;
                  if (b > 0xff) b = 0xff;
                  pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && true)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 4) + (tx / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(palIdx + lookup * 2, palRamStart);
                
                if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                {
                  uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                  uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                  uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                  uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                  r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                  g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                  b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                  if (r > 0xff) r = 0xff;
                  if (g > 0xff) g = 0xff;
                  if (b > 0xff) b = 0xff;
                  pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
      }
      else
      {
        int32_t rotScaleParam = (attr1 >> 9) & 0x1F;

        uint8_t dx = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x6);
        uint8_t dmx = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0xE);
        uint8_t dy = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x16);
        uint8_t dmy = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x1E);

        int32_t cx = rWidth / 2;
        int32_t cy = rHeight / 2;

        int32_t baseSprite = attr2 & 0x3FF;
        int32_t pitch;

        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          pitch = (Width / 8) * scale;
        }
        else
        {
          // 2 dimensional
          pitch = 0x20;
        }

        int32_t rx = (int32_t)((dmx * (spritey - cy)) - (cx * dx) + (Width << 7));
        int32_t ry = (int32_t)((dmy * (spritey - cy)) - (cx * dy) + (Height << 7));

        // Draw a rot/scale sprite
        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && true)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 8) + (tx & 7);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(0x200 + lookup * 2, palRamStart);
                
                if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                {
                  uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                  uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                  uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                  uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                  r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                  g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                  b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                  if (r > 0xff) r = 0xff;
                  if (g > 0xff) g = 0xff;
                  if (b > 0xff) b = 0xff;
                  pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int32_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && true)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 4) + ((tx & 7) / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(palIdx + lookup * 2, palRamStart);
                
                if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                {
                  uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                  uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                  uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                  uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                  r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                  g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                  b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                  if (r > 0xff) r = 0xff;
                  if (g > 0xff) g = 0xff;
                  if (b > 0xff) b = 0xff;
                  pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
      }
    }
    else
    {
      if ((attr0 & (1 << 8)) == 0)
      {
        if ((attr1 & (1 << 13)) != 0) spritey = (Height - 1) - spritey;

        int32_t baseSprite;
        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * (Width / 8)) * scale;
        }
        else
        {
          // 2 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * 0x20);
        }

        int32_t baseInc = scale;
        if ((attr1 & (1 << 12)) != 0)
        {
          baseSprite += ((Width / 8) * scale) - scale;
          baseInc = -baseInc;
        }

        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && true)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 8) + tx;
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(0x200 + lookup * 2, palRamStart);
                
                if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                {
                  uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                  uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                  uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                  uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                  r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                  g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                  b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                  if (r > 0xff) r = 0xff;
                  if (g > 0xff) g = 0xff;
                  if (b > 0xff) b = 0xff;
                  pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && true)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 4) + (tx / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(palIdx + lookup * 2, palRamStart);
                
                if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                {
                  uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                  uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                  uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                  uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                  r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                  g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                  b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                  if (r > 0xff) r = 0xff;
                  if (g > 0xff) g = 0xff;
                  if (b > 0xff) b = 0xff;
                  pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
      }
      else
      {
        int32_t rotScaleParam = (attr1 >> 9) & 0x1F;

        uint16_t dx = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x6);
        uint16_t dmx = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0xE);
        uint16_t dy = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x16);
        uint16_t dmy = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x1E);

        int32_t cx = rWidth / 2;
        int32_t cy = rHeight / 2;

        int32_t baseSprite = attr2 & 0x3FF;
        int32_t pitch;

        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          pitch = (Width / 8) * scale;
        }
        else
        {
          // 2 dimensional
          pitch = 0x20;
        }

        int32_t rx = (int32_t)((dmx * (spritey - cy)) - (cx * dx) + (Width << 7));
        int32_t ry = (int32_t)((dmy * (spritey - cy)) - (cx * dy) + (Height << 7));

        // Draw a rot/scale sprite
        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && true)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 8) + (tx & 7);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(0x200 + lookup * 2, palRamStart);
                
                if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                {
                  uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                  uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                  uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                  uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                  r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                  g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                  b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                  if (r > 0xff) r = 0xff;
                  if (g > 0xff) g = 0xff;
                  if (b > 0xff) b = 0xff;
                  pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
              
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int32_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && true)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 4) + ((tx & 7) / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(palIdx + lookup * 2, palRamStart);
                
                if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                {
                  uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                  uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                  uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                  uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                  r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                  g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                  b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                  if (r > 0xff) r = 0xff;
                  if (g > 0xff) g = 0xff;
                  if (b > 0xff) b = 0xff;
                  pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
      }
    }
  }
}

void DrawSpritesBrightInc(int32_t priority)
{
  // OBJ must be enabled in this.dispCnt
  if ((dispCnt & (1 << 12)) == 0) return;

  uint8_t blendMaskType = (uint8_t)(1 << 4);

  for (int32_t oamNum = 127; oamNum >= 0; oamNum--)
  {
    uint16_t attr2 = processor.ReadU16Debug(OAM_BASE + (uint32_t)(oamNum * 8) + 4);

    if (((attr2 >> 10) & 3) != priority) continue;

    uint16_t attr0 = processor.ReadU16Debug(OAM_BASE + (uint32_t)(oamNum * 8) + 0);
    uint16_t attr1 = processor.ReadU16Debug(OAM_BASE + (uint32_t)(oamNum * 8) + 2);

    int32_t x = attr1 & 0x1FF;
    int32_t y = attr0 & 0xFF;

    bool semiTransparent = false;

    switch ((attr0 >> 10) & 3)
    {
    case 1:
      // Semi-transparent
      semiTransparent = true;
      break;
    case 2:
      // Obj window
      continue;
    case 3:
      continue;
    }

    if ((dispCnt & 0x7) >= 3 && (attr2 & 0x3FF) < 0x200) continue;

    int32_t Width = -1, Height = -1;
    switch ((attr0 >> 14) & 3)
    {
    case 0:
      // Square
      switch ((attr1 >> 14) & 3)
      {
      case 0: Width = 8; Height = 8; break;
      case 1: Width = 16; Height = 16; break;
      case 2: Width = 32; Height = 32; break;
      case 3: Width = 64; Height = 64; break;
      }
      break;
    case 1:
      // Horizontal Rectangle
      switch ((attr1 >> 14) & 3)
      {
      case 0: Width = 16; Height = 8; break;
      case 1: Width = 32; Height = 8; break;
      case 2: Width = 32; Height = 16; break;
      case 3: Width = 64; Height = 32; break;
      }
      break;
    case 2:
      // Vertical Rectangle
      switch ((attr1 >> 14) & 3)
      {
      case 0: Width = 8; Height = 16; break;
      case 1: Width = 8; Height = 32; break;
      case 2: Width = 16; Height = 32; break;
      case 3: Width = 32; Height = 64; break;
      }
      break;
    }

    // Check double size flag here

    int32_t rWidth = Width, rHeight = Height;
    if ((attr0 & (1 << 8)) != 0)
    {
      // Rot-scale on
      if ((attr0 & (1 << 9)) != 0)
      {
        rWidth *= 2;
        rHeight *= 2;
      }
    }
    else
    {
      // Invalid sprite
      if ((attr0 & (1 << 9)) != 0)
        Width = -1;
    }

    if (Width == -1)
    {
      // Invalid sprite
      continue;
    }

    // Y clipping
    if (y > ((y + rHeight) & 0xff))
    {
      if (curLine >= ((y + rHeight) & 0xff) && !(y < curLine)) continue;
    }
    else
    {
      if (curLine < y || curLine >= ((y + rHeight) & 0xff)) continue;
    }

    int32_t scale = 1;
    if ((attr0 & (1 << 13)) != 0) scale = 2;

    int32_t spritey = curLine - y;
    if (spritey < 0) spritey += 256;

    if (semiTransparent)
    {
      if ((attr0 & (1 << 8)) == 0)
      {
        if ((attr1 & (1 << 13)) != 0) spritey = (Height - 1) - spritey;

        int32_t baseSprite;
        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * (Width / 8)) * scale;
        }
        else
        {
          // 2 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * 0x20);
        }

        int32_t baseInc = scale;
        if ((attr1 & (1 << 12)) != 0)
        {
          baseSprite += ((Width / 8) * scale) - scale;
          baseInc = -baseInc;
        }

        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && true)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 8) + tx;
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(0x200 + lookup * 2, palRamStart);
                
                if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                {
                  uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                  uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                  uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                  uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                  r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                  g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                  b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                  if (r > 0xff) r = 0xff;
                  if (g > 0xff) g = 0xff;
                  if (b > 0xff) b = 0xff;
                  pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && true)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 4) + (tx / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(palIdx + lookup * 2, palRamStart);
                
                if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                {
                  uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                  uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                  uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                  uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                  r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                  g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                  b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                  if (r > 0xff) r = 0xff;
                  if (g > 0xff) g = 0xff;
                  if (b > 0xff) b = 0xff;
                  pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
      }
      else
      {
        int32_t rotScaleParam = (attr1 >> 9) & 0x1F;

        uint8_t dx = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x6);
        uint8_t dmx = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0xE);
        uint8_t dy = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x16);
        uint8_t dmy = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x1E);

        int32_t cx = rWidth / 2;
        int32_t cy = rHeight / 2;

        int32_t baseSprite = attr2 & 0x3FF;
        int32_t pitch;

        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          pitch = (Width / 8) * scale;
        }
        else
        {
          // 2 dimensional
          pitch = 0x20;
        }

        int32_t rx = (int32_t)((dmx * (spritey - cy)) - (cx * dx) + (Width << 7));
        int32_t ry = (int32_t)((dmy * (spritey - cy)) - (cx * dy) + (Height << 7));

        // Draw a rot/scale sprite
        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && true)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 8) + (tx & 7);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(0x200 + lookup * 2, palRamStart);
                
                if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                {
                  uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                  uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                  uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                  uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                  r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                  g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                  b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                  if (r > 0xff) r = 0xff;
                  if (g > 0xff) g = 0xff;
                  if (b > 0xff) b = 0xff;
                  pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int32_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && true)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 4) + ((tx & 7) / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(palIdx + lookup * 2, palRamStart);
                
                if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                {
                  uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                  uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                  uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                  uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                  r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                  g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                  b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                  if (r > 0xff) r = 0xff;
                  if (g > 0xff) g = 0xff;
                  if (b > 0xff) b = 0xff;
                  pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
      }
    }
    else
    {
      if ((attr0 & (1 << 8)) == 0)
      {
        if ((attr1 & (1 << 13)) != 0) spritey = (Height - 1) - spritey;

        int32_t baseSprite;
        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * (Width / 8)) * scale;
        }
        else
        {
          // 2 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * 0x20);
        }

        int32_t baseInc = scale;
        if ((attr1 & (1 << 12)) != 0)
        {
          baseSprite += ((Width / 8) * scale) - scale;
          baseInc = -baseInc;
        }

        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && true)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 8) + tx;
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(0x200 + lookup * 2, palRamStart); 
                uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                if (r > 0xff) r = 0xff;
                if (g > 0xff) g = 0xff;
                if (b > 0xff) b = 0xff;
                pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && true)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 4) + (tx / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(palIdx + lookup * 2, palRamStart);
                uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                if (r > 0xff) r = 0xff;
                if (g > 0xff) g = 0xff;
                if (b > 0xff) b = 0xff;
                pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
      }
      else
      {
        int32_t rotScaleParam = (attr1 >> 9) & 0x1F;

        uint16_t dx = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x6);
        uint16_t dmx = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0xE);
        uint16_t dy = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x16);
        uint16_t dmy = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x1E);

        int32_t cx = rWidth / 2;
        int32_t cy = rHeight / 2;

        int32_t baseSprite = attr2 & 0x3FF;
        int32_t pitch;

        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          pitch = (Width / 8) * scale;
        }
        else
        {
          // 2 dimensional
          pitch = 0x20;
        }

        int32_t rx = (uint32_t)((dmx * (spritey - cy)) - (cx * dx) + (Width << 7));
        int32_t ry = (uint32_t)((dmy * (spritey - cy)) - (cx * dy) + (Height << 7));

        // Draw a rot/scale sprite
        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && true)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 8) + (tx & 7);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(0x200 + lookup * 2, palRamStart);
                uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                if (r > 0xff) r = 0xff;
                if (g > 0xff) g = 0xff;
                if (b > 0xff) b = 0xff;
                pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int32_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && true)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 4) + ((tx & 7) / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(palIdx + lookup * 2, palRamStart);
                uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                if (r > 0xff) r = 0xff;
                if (g > 0xff) g = 0xff;
                if (b > 0xff) b = 0xff;
                pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
      }
    }
  }
}

void DrawSpritesBrightDec(int32_t priority)
{
  // OBJ must be enabled in this.dispCnt
  if ((dispCnt & (1 << 12)) == 0) return;

  uint8_t blendMaskType = (uint8_t)(1 << 4);

  for (int32_t oamNum = 127; oamNum >= 0; oamNum--)
  {
    uint16_t attr2 = processor.ReadU16Debug(OAM_BASE + (uint32_t)(oamNum * 8) + 4);

    if (((attr2 >> 10) & 3) != priority) continue;

    uint16_t attr0 = processor.ReadU16Debug(OAM_BASE + (uint32_t)(oamNum * 8) + 0);
    uint16_t attr1 = processor.ReadU16Debug(OAM_BASE + (uint32_t)(oamNum * 8) + 2);

    int32_t x = attr1 & 0x1FF;
    int32_t y = attr0 & 0xFF;

    bool semiTransparent = false;

    switch ((attr0 >> 10) & 3)
    {
    case 1:
      // Semi-transparent
      semiTransparent = true;
      break;
    case 2:
      // Obj window
      continue;
    case 3:
      continue;
    }

    if ((dispCnt & 0x7) >= 3 && (attr2 & 0x3FF) < 0x200) continue;

    int32_t Width = -1, Height = -1;
    switch ((attr0 >> 14) & 3)
    {
    case 0:
      // Square
      switch ((attr1 >> 14) & 3)
      {
      case 0: Width = 8; Height = 8; break;
      case 1: Width = 16; Height = 16; break;
      case 2: Width = 32; Height = 32; break;
      case 3: Width = 64; Height = 64; break;
      }
      break;
    case 1:
      // Horizontal Rectangle
      switch ((attr1 >> 14) & 3)
      {
      case 0: Width = 16; Height = 8; break;
      case 1: Width = 32; Height = 8; break;
      case 2: Width = 32; Height = 16; break;
      case 3: Width = 64; Height = 32; break;
      }
      break;
    case 2:
      // Vertical Rectangle
      switch ((attr1 >> 14) & 3)
      {
      case 0: Width = 8; Height = 16; break;
      case 1: Width = 8; Height = 32; break;
      case 2: Width = 16; Height = 32; break;
      case 3: Width = 32; Height = 64; break;
      }
      break;
    }

    // Check double size flag here

    int32_t rWidth = Width, rHeight = Height;
    if ((attr0 & (1 << 8)) != 0)
    {
      // Rot-scale on
      if ((attr0 & (1 << 9)) != 0)
      {
        rWidth *= 2;
        rHeight *= 2;
      }
    }
    else
    {
      // Invalid sprite
      if ((attr0 & (1 << 9)) != 0)
        Width = -1;
    }

    if (Width == -1)
    {
      // Invalid sprite
      continue;
    }

    // Y clipping
    if (y > ((y + rHeight) & 0xff))
    {
      if (curLine >= ((y + rHeight) & 0xff) && !(y < curLine)) continue;
    }
    else
    {
      if (curLine < y || curLine >= ((y + rHeight) & 0xff)) continue;
    }

    int32_t scale = 1;
    if ((attr0 & (1 << 13)) != 0) scale = 2;

    int32_t spritey = curLine - y;
    if (spritey < 0) spritey += 256;

    if (semiTransparent)
    {
      if ((attr0 & (1 << 8)) == 0)
      {
        if ((attr1 & (1 << 13)) != 0) spritey = (Height - 1) - spritey;

        int32_t baseSprite;
        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * (Width / 8)) * scale;
        }
        else
        {
          // 2 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * 0x20);
        }

        int32_t baseInc = scale;
        if ((attr1 & (1 << 12)) != 0)
        {
          baseSprite += ((Width / 8) * scale) - scale;
          baseInc = -baseInc;
        }

        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && true)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 8) + tx;
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(0x200 + lookup * 2, palRamStart);
                
                if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                {
                  uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                  uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                  uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                  uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                  r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                  g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                  b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                  if (r > 0xff) r = 0xff;
                  if (g > 0xff) g = 0xff;
                  if (b > 0xff) b = 0xff;
                  pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && true)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 4) + (tx / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(palIdx + lookup * 2, palRamStart);
                
                if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                {
                  uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                  uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                  uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                  uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                  r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                  g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                  b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                  if (r > 0xff) r = 0xff;
                  if (g > 0xff) g = 0xff;
                  if (b > 0xff) b = 0xff;
                  pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
      }
      else
      {
        int32_t rotScaleParam = (attr1 >> 9) & 0x1F;

        uint8_t dx = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x6);
        uint8_t dmx = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0xE);
        uint8_t dy = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x16);
        uint8_t dmy = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x1E);

        int32_t cx = rWidth / 2;
        int32_t cy = rHeight / 2;

        int32_t baseSprite = attr2 & 0x3FF;
        int32_t pitch;

        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          pitch = (Width / 8) * scale;
        }
        else
        {
          // 2 dimensional
          pitch = 0x20;
        }

        int32_t rx = (int32_t)((dmx * (spritey - cy)) - (cx * dx) + (Width << 7));
        int32_t ry = (int32_t)((dmy * (spritey - cy)) - (cx * dy) + (Height << 7));

        // Draw a rot/scale sprite
        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && true)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 8) + (tx & 7);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(0x200 + lookup * 2, palRamStart);
                
                if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                {
                  uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                  uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                  uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                  uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                  r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                  g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                  b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                  if (r > 0xff) r = 0xff;
                  if (g > 0xff) g = 0xff;
                  if (b > 0xff) b = 0xff;
                  pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int32_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && true)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 4) + ((tx & 7) / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(palIdx + lookup * 2, palRamStart);
                
                if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                {
                  uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                  uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                  uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                  uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                  r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                  g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                  b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                  if (r > 0xff) r = 0xff;
                  if (g > 0xff) g = 0xff;
                  if (b > 0xff) b = 0xff;
                  pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
      }
    }
    else
    {
      if ((attr0 & (1 << 8)) == 0)
      {
        if ((attr1 & (1 << 13)) != 0) spritey = (Height - 1) - spritey;

        int32_t baseSprite;
        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * (Width / 8)) * scale;
        }
        else
        {
          // 2 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * 0x20);
        }

        int32_t baseInc = scale;
        if ((attr1 & (1 << 12)) != 0)
        {
          baseSprite += ((Width / 8) * scale) - scale;
          baseInc = -baseInc;
        }

        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && true)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 8) + tx;
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU8(0x200 + lookup * 2, palRamStart);
                uint16_t r = (uint8_t)((pixelColor) & 0x1F);      //First 5 Bits
                uint16_t g = (uint8_t)((pixelColor >> 5) & 0x1F);  //Middle 5 Bits
                uint16_t b = (uint8_t)((pixelColor >> 10) & 0x1F);   //Last 5 Bits 
                r = r - ((r * blendY) >> 4);
                g = g - ((g * blendY) >> 4);
                b = b - ((b * blendY) >> 4);
                pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && true)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 4) + (tx / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU8(palIdx + lookup * 2, palRamStart);
                uint16_t r = (uint8_t)((pixelColor) & 0x1F);      //First 5 Bits
                uint16_t g = (uint8_t)((pixelColor >> 5) & 0x1F);  //Middle 5 Bits
                uint16_t b = (uint8_t)((pixelColor >> 10) & 0x1F);   //Last 5 Bits 
                r = r - ((r * blendY) >> 4);
                g = g - ((g * blendY) >> 4);
                b = b - ((b * blendY) >> 4);
                pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
      }
      else
      {
        int32_t rotScaleParam = (attr1 >> 9) & 0x1F;

        uint16_t dx = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x6);
        uint16_t dmx = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0xE);
        uint16_t dy = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x16);
        uint16_t dmy = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x1E);

        int32_t cx = rWidth / 2;
        int32_t cy = rHeight / 2;

        int32_t baseSprite = attr2 & 0x3FF;
        int32_t pitch;

        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          pitch = (Width / 8) * scale;
        }
        else
        {
          // 2 dimensional
          pitch = 0x20;
        }

        int32_t rx = (int32_t)((dmx * (spritey - cy)) - (cx * dx) + (Width << 7));
        int32_t ry = (int32_t)((dmy * (spritey - cy)) - (cx * dy) + (Height << 7));

        // Draw a rot/scale sprite
        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && true)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 8) + (tx & 7);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU8(0x200 + lookup * 2, palRamStart);
                uint16_t r = (uint8_t)((pixelColor) & 0x1F);      //First 5 Bits
                uint16_t g = (uint8_t)((pixelColor >> 5) & 0x1F);  //Middle 5 Bits
                uint16_t b = (uint8_t)((pixelColor >> 10) & 0x1F);   //Last 5 Bits 
                r = r - ((r * blendY) >> 4);
                g = g - ((g * blendY) >> 4);
                b = b - ((b * blendY) >> 4);
                pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && true)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 4) + ((tx & 7) / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU8(palIdx + lookup * 2, palRamStart);
                uint16_t r = (uint8_t)((pixelColor) & 0x1F);      //First 5 Bits
                uint16_t g = (uint8_t)((pixelColor >> 5) & 0x1F);  //Middle 5 Bits
                uint16_t b = (uint8_t)((pixelColor >> 10) & 0x1F);   //Last 5 Bits 
                r = r - ((r * blendY) >> 4);
                g = g - ((g * blendY) >> 4);
                b = b - ((b * blendY) >> 4);
                pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
      }
    }
  }
}

void DrawSpritesWindow(int32_t priority)
{
  // OBJ must be enabled in this.dispCnt
  if ((dispCnt & (1 << 12)) == 0) return;

  uint8_t blendMaskType = (uint8_t)(1 << 4);

  for (int32_t oamNum = 127; oamNum >= 0; oamNum--)
  {
    uint16_t attr2 = processor.ReadU16Debug(OAM_BASE + (uint32_t)(oamNum * 8) + 4);

    if (((attr2 >> 10) & 3) != priority) continue;

    uint16_t attr0 = processor.ReadU16Debug(OAM_BASE + (uint32_t)(oamNum * 8) + 0);
    uint16_t attr1 = processor.ReadU16Debug(OAM_BASE + (uint32_t)(oamNum * 8) + 2);

    int32_t x = attr1 & 0x1FF;
    int32_t y = attr0 & 0xFF;

    bool semiTransparent = false;

    switch ((attr0 >> 10) & 3)
    {
    case 1:
      // Semi-transparent
      semiTransparent = true;
      break;
    case 2:
      // Obj window
      continue;
    case 3:
      continue;
    }

    if ((dispCnt & 0x7) >= 3 && (attr2 & 0x3FF) < 0x200) continue;

    int32_t Width = -1, Height = -1;
    switch ((attr0 >> 14) & 3)
    {
    case 0:
      // Square
      switch ((attr1 >> 14) & 3)
      {
      case 0: Width = 8; Height = 8; break;
      case 1: Width = 16; Height = 16; break;
      case 2: Width = 32; Height = 32; break;
      case 3: Width = 64; Height = 64; break;
      }
      break;
    case 1:
      // Horizontal Rectangle
      switch ((attr1 >> 14) & 3)
      {
      case 0: Width = 16; Height = 8; break;
      case 1: Width = 32; Height = 8; break;
      case 2: Width = 32; Height = 16; break;
      case 3: Width = 64; Height = 32; break;
      }
      break;
    case 2:
      // Vertical Rectangle
      switch ((attr1 >> 14) & 3)
      {
      case 0: Width = 8; Height = 16; break;
      case 1: Width = 8; Height = 32; break;
      case 2: Width = 16; Height = 32; break;
      case 3: Width = 32; Height = 64; break;
      }
      break;
    }

    // Check double size flag here

    int32_t rWidth = Width, rHeight = Height;
    if ((attr0 & (1 << 8)) != 0)
    {
      // Rot-scale on
      if ((attr0 & (1 << 9)) != 0)
      {
        rWidth *= 2;
        rHeight *= 2;
      }
    }
    else
    {
      // Invalid sprite
      if ((attr0 & (1 << 9)) != 0)
        Width = -1;
    }

    if (Width == -1)
    {
      // Invalid sprite
      continue;
    }

    // Y clipping
    if (y > ((y + rHeight) & 0xff))
    {
      if (curLine >= ((y + rHeight) & 0xff) && !(y < curLine)) continue;
    }
    else
    {
      if (curLine < y || curLine >= ((y + rHeight) & 0xff)) continue;
    }

    int32_t scale = 1;
    if ((attr0 & (1 << 13)) != 0) scale = 2;

    int32_t spritey = curLine - y;
    if (spritey < 0) spritey += 256;

    if (semiTransparent)
    {
      if ((attr0 & (1 << 8)) == 0)
      {
        if ((attr1 & (1 << 13)) != 0) spritey = (Height - 1) - spritey;

        int32_t baseSprite;
        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * (Width / 8)) * scale;
        }
        else
        {
          // 2 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * 0x20);
        }

        int32_t baseInc = scale;
        if ((attr1 & (1 << 12)) != 0)
        {
          baseSprite += ((Width / 8) * scale) - scale;
          baseInc = -baseInc;
        }

        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 8) + tx;
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(0x200 + lookup * 2, palRamStart);
                
                if ((windowCover[i & 0x1ff] & (1 << 5)) != 0)
                {
                  if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                  {
                    uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                    uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                    uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                    uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                    r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                    g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                    b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                    if (r > 0xff) r = 0xff;
                    if (g > 0xff) g = 0xff;
                    if (b > 0xff) b = 0xff;
                    pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                  }
                  else
                  {
                    pixelColor = GBAToColor(pixelColor);
                  }
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 4) + (tx / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(palIdx + lookup * 2, palRamStart);
                
                if ((windowCover[i & 0x1ff] & (1 << 5)) != 0)
                {
                  if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                  {
                    uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                    uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                    uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                    uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                    r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                    g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                    b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                    if (r > 0xff) r = 0xff;
                    if (g > 0xff) g = 0xff;
                    if (b > 0xff) b = 0xff;
                    pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                  }
                  else
                  {
                    pixelColor = GBAToColor(pixelColor);
                  }
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
      }
      else
      {
        int32_t rotScaleParam = (attr1 >> 9) & 0x1F;

        uint8_t dx = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x6);
        uint8_t dmx = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0xE);
        uint8_t dy = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x16);
        uint8_t dmy = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x1E);

        int32_t cx = rWidth / 2;
        int32_t cy = rHeight / 2;

        int32_t baseSprite = attr2 & 0x3FF;
        int32_t pitch;

        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          pitch = (Width / 8) * scale;
        }
        else
        {
          // 2 dimensional
          pitch = 0x20;
        }

        int32_t rx = (int32_t)((dmx * (spritey - cy)) - (cx * dx) + (Width << 7));
        int32_t ry = (int32_t)((dmy * (spritey - cy)) - (cx * dy) + (Height << 7));

        // Draw a rot/scale sprite
        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (uint8_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 8) + (tx & 7);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(0x200 + lookup * 2, palRamStart);
                
                if ((windowCover[i & 0x1ff] & (1 << 5)) != 0)
                {
                  if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                  {
                    uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                    uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                    uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                    uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                    r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                    g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                    b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                    if (r > 0xff) r = 0xff;
                    if (g > 0xff) g = 0xff;
                    if (b > 0xff) b = 0xff;
                    pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                  }
                  else
                  {
                    pixelColor = GBAToColor(pixelColor);
                  }
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int32_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 4) + ((tx & 7) / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(palIdx + lookup * 2, palRamStart);
                
                if ((windowCover[i & 0x1ff] & (1 << 5)) != 0)
                {
                  if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                  {
                    uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                    uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                    uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                    uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                    r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                    g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                    b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                    if (r > 0xff) r = 0xff;
                    if (g > 0xff) g = 0xff;
                    if (b > 0xff) b = 0xff;
                    pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                  }
                  else
                  {
                    pixelColor = GBAToColor(pixelColor);
                  }
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
      }
    }
    else
    {
      if ((attr0 & (1 << 8)) == 0)
      {
        if ((attr1 & (1 << 13)) != 0) spritey = (Height - 1) - spritey;

        int32_t baseSprite;
        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * (Width / 8)) * scale;
        }
        else
        {
          // 2 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * 0x20);
        }

        int32_t baseInc = scale;
        if ((attr1 & (1 << 12)) != 0)
        {
          baseSprite += ((Width / 8) * scale) - scale;
          baseInc = -baseInc;
        }

        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 8) + tx;
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = GBAToColor(processor.ReadU16(0x200 + lookup * 2, palRamStart));
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 4) + (tx / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = GBAToColor(processor.ReadU16(palIdx + lookup * 2, palRamStart));
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
      }
      else
      {
        int32_t rotScaleParam = (attr1 >> 9) & 0x1F;

        uint16_t dx = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x6);
        uint16_t dmx = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0xE);
        uint16_t dy = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x16);
        uint16_t dmy = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x1E);

        int32_t cx = rWidth / 2;
        int32_t cy = rHeight / 2;

        int32_t baseSprite = attr2 & 0x3FF;
        int32_t pitch;

        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          pitch = (Width / 8) * scale;
        }
        else
        {
          // 2 dimensional
          pitch = 0x20;
        }

        int32_t rx = (int32_t)((dmx * (spritey - cy)) - (cx * dx) + (Width << 7));
        int32_t ry = (int32_t)((dmy * (spritey - cy)) - (cx * dy) + (Height << 7));

        // Draw a rot/scale sprite
        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 8) + (tx & 7);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = GBAToColor(processor.ReadU16(0x200 + lookup * 2, palRamStart));
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int32_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 4) + ((tx & 7) / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = GBAToColor(processor.ReadU16(palIdx + lookup * 2, palRamStart));
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
      }
    }
  }
}

void DrawSpritesWindowBlend(int32_t priority)
{
  // OBJ must be enabled in this.dispCnt
  if ((dispCnt & (1 << 12)) == 0) return;

  uint8_t blendMaskType = (uint8_t)(1 << 4);

  for (int32_t oamNum = 127; oamNum >= 0; oamNum--)
  {
    uint16_t attr2 = processor.ReadU16Debug(OAM_BASE + (uint32_t)(oamNum * 8) + 4);

    if (((attr2 >> 10) & 3) != priority) continue;

    uint16_t attr0 = processor.ReadU16Debug(OAM_BASE + (uint32_t)(oamNum * 8) + 0);
    uint16_t attr1 = processor.ReadU16Debug(OAM_BASE + (uint32_t)(oamNum * 8) + 2);

    int32_t x = attr1 & 0x1FF;
    int32_t y = attr0 & 0xFF;

    bool semiTransparent = false;

    switch ((attr0 >> 10) & 3)
    {
    case 1:
      // Semi-transparent
      semiTransparent = true;
      break;
    case 2:
      // Obj window
      continue;
    case 3:
      continue;
    }

    if ((dispCnt & 0x7) >= 3 && (attr2 & 0x3FF) < 0x200) continue;

    int32_t Width = -1, Height = -1;
    switch ((attr0 >> 14) & 3)
    {
    case 0:
      // Square
      switch ((attr1 >> 14) & 3)
      {
      case 0: Width = 8; Height = 8; break;
      case 1: Width = 16; Height = 16; break;
      case 2: Width = 32; Height = 32; break;
      case 3: Width = 64; Height = 64; break;
      }
      break;
    case 1:
      // Horizontal Rectangle
      switch ((attr1 >> 14) & 3)
      {
      case 0: Width = 16; Height = 8; break;
      case 1: Width = 32; Height = 8; break;
      case 2: Width = 32; Height = 16; break;
      case 3: Width = 64; Height = 32; break;
      }
      break;
    case 2:
      // Vertical Rectangle
      switch ((attr1 >> 14) & 3)
      {
      case 0: Width = 8; Height = 16; break;
      case 1: Width = 8; Height = 32; break;
      case 2: Width = 16; Height = 32; break;
      case 3: Width = 32; Height = 64; break;
      }
      break;
    }

    // Check double size flag here

    int32_t rWidth = Width, rHeight = Height;
    if ((attr0 & (1 << 8)) != 0)
    {
      // Rot-scale on
      if ((attr0 & (1 << 9)) != 0)
      {
        rWidth *= 2;
        rHeight *= 2;
      }
    }
    else
    {
      // Invalid sprite
      if ((attr0 & (1 << 9)) != 0)
        Width = -1;
    }

    if (Width == -1)
    {
      // Invalid sprite
      continue;
    }

    // Y clipping
    if (y > ((y + rHeight) & 0xff))
    {
      if (curLine >= ((y + rHeight) & 0xff) && !(y < curLine)) continue;
    }
    else
    {
      if (curLine < y || curLine >= ((y + rHeight) & 0xff)) continue;
    }

    int32_t scale = 1;
    if ((attr0 & (1 << 13)) != 0) scale = 2;

    int32_t spritey = curLine - y;
    if (spritey < 0) spritey += 256;

    if (semiTransparent)
    {
      if ((attr0 & (1 << 8)) == 0)
      {
        if ((attr1 & (1 << 13)) != 0) spritey = (Height - 1) - spritey;

        int32_t baseSprite;
        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * (Width / 8)) * scale;
        }
        else
        {
          // 2 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * 0x20);
        }

        int32_t baseInc = scale;
        if ((attr1 & (1 << 12)) != 0)
        {
          baseSprite += ((Width / 8) * scale) - scale;
          baseInc = -baseInc;
        }

        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 8) + tx;
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(0x200 + lookup * 2, palRamStart);
                
                if ((windowCover[i & 0x1ff] & (1 << 5)) != 0)
                {
                  if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                  {
                    uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                    uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                    uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                    uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                    r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                    g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                    b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                    if (r > 0xff) r = 0xff;
                    if (g > 0xff) g = 0xff;
                    if (b > 0xff) b = 0xff;
                    pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                  }
                  else
                  {
                    pixelColor = GBAToColor(pixelColor);
                  }
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 4) + (tx / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(palIdx + lookup * 2, palRamStart);
                
                if ((windowCover[i & 0x1ff] & (1 << 5)) != 0)
                {
                  if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                  {
                    uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                    uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                    uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                    uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                    r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                    g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                    b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                    if (r > 0xff) r = 0xff;
                    if (g > 0xff) g = 0xff;
                    if (b > 0xff) b = 0xff;
                    pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                  }
                  else
                  {
                    pixelColor = GBAToColor(pixelColor);
                  }
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
      }
      else
      {
        int32_t rotScaleParam = (attr1 >> 9) & 0x1F;

        uint8_t dx = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x6);
        uint8_t dmx = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0xE);
        uint8_t dy = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x16);
        uint8_t dmy = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x1E);

        int32_t cx = rWidth / 2;
        int32_t cy = rHeight / 2;

        int32_t baseSprite = attr2 & 0x3FF;
        int32_t pitch;

        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          pitch = (Width / 8) * scale;
        }
        else
        {
          // 2 dimensional
          pitch = 0x20;
        }

        int32_t rx = (int32_t)((dmx * (spritey - cy)) - (cx * dx) + (Width << 7));
        int32_t ry = (int32_t)((dmy * (spritey - cy)) - (cx * dy) + (Height << 7));

        // Draw a rot/scale sprite
        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 8) + (tx & 7);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(0x200 + lookup * 2, palRamStart);
                
                if ((windowCover[i & 0x1ff] & (1 << 5)) != 0)
                {
                  if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                  {
                    uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                    uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                    uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                    uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                    r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                    g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                    b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                    if (r > 0xff) r = 0xff;
                    if (g > 0xff) g = 0xff;
                    if (b > 0xff) b = 0xff;
                    pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                  }
                  else
                  {
                    pixelColor = GBAToColor(pixelColor);
                  }
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int32_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 4) + ((tx & 7) / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(palIdx + lookup * 2, palRamStart);
                
                if ((windowCover[i & 0x1ff] & (1 << 5)) != 0)
                {
                  if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                  {
                    uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                    uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                    uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                    uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                    r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                    g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                    b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                    if (r > 0xff) r = 0xff;
                    if (g > 0xff) g = 0xff;
                    if (b > 0xff) b = 0xff;
                    pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                  }
                  else
                  {
                    pixelColor = GBAToColor(pixelColor);
                  }
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
      }
    }
    else
    {
      if ((attr0 & (1 << 8)) == 0)
      {
        if ((attr1 & (1 << 13)) != 0) spritey = (Height - 1) - spritey;

        int32_t baseSprite;
        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * (Width / 8)) * scale;
        }
        else
        {
          // 2 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * 0x20);
        }

        int32_t baseInc = scale;
        if ((attr1 & (1 << 12)) != 0)
        {
          baseSprite += ((Width / 8) * scale) - scale;
          baseInc = -baseInc;
        }

        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 8) + tx;
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(0x200 + lookup * 2, palRamStart);
                
                if ((windowCover[i & 0x1ff] & (1 << 5)) != 0)
                {
                  if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                  {
                    uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                    uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                    uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                    uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                    r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                    g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                    b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                    if (r > 0xff) r = 0xff;
                    if (g > 0xff) g = 0xff;
                    if (b > 0xff) b = 0xff;
                    pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                  }
                  else
                  {
                    pixelColor = GBAToColor(pixelColor);
                  }
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 4) + (tx / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(palIdx + lookup * 2, palRamStart);
                
                if ((windowCover[i & 0x1ff] & (1 << 5)) != 0)
                {
                  if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                  {
                    uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                    uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                    uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                    uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                    r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                    g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                    b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                    if (r > 0xff) r = 0xff;
                    if (g > 0xff) g = 0xff;
                    if (b > 0xff) b = 0xff;
                    pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                  }
                  else
                  {
                    pixelColor = GBAToColor(pixelColor);
                  }
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
      }
      else
      {
        int32_t rotScaleParam = (attr1 >> 9) & 0x1F;

        uint16_t dx = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x6);
        uint16_t dmx = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0xE);
        uint16_t dy = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x16);
        uint16_t dmy = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x1E);

        int32_t cx = rWidth / 2;
        int32_t cy = rHeight / 2;

        int32_t baseSprite = attr2 & 0x3FF;
        int32_t pitch;

        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          pitch = (Width / 8) * scale;
        }
        else
        {
          // 2 dimensional
          pitch = 0x20;
        }

        int32_t rx = (int32_t)((dmx * (spritey - cy)) - (cx * dx) + (Width << 7));
        int32_t ry = (int32_t)((dmy * (spritey - cy)) - (cx * dy) + (Height << 7));

        // Draw a rot/scale sprite
        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 8) + (tx & 7);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(0x200 + lookup * 2, palRamStart);
                
                if ((windowCover[i & 0x1ff] & (1 << 5)) != 0)
                {
                  if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                  {
                    uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                    uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                    uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                    uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                    r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                    g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                    b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                  
                    if (r > 0xff) r = 0xff;
                    if (g > 0xff) g = 0xff;
                    if (b > 0xff) b = 0xff;
                  
                    pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                  }
                  else
                  {
                    pixelColor = GBAToColor(pixelColor);
                  }
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int32_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 4) + ((tx & 7) / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(palIdx + lookup * 2, palRamStart);
                
                if ((windowCover[i & 0x1ff] & (1 << 5)) != 0)
                {
                  if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                  {
                    uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                    uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                    uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                    uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                    r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                    g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                    b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                    if (r > 0xff) r = 0xff;
                    if (g > 0xff) g = 0xff;
                    if (b > 0xff) b = 0xff;
                    pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                  }
                  else
                  {
                    pixelColor = GBAToColor(pixelColor);
                  }
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
      }
    }
  }
}

void DrawSpritesWindowBrightInc(int32_t priority)
{
  // OBJ must be enabled in this.dispCnt
  if ((dispCnt & (1 << 12)) == 0) return;

  uint8_t blendMaskType = (uint8_t)(1 << 4);

  for (int32_t oamNum = 127; oamNum >= 0; oamNum--)
  {
    uint16_t attr2 = processor.ReadU16Debug(OAM_BASE + (uint32_t)(oamNum * 8) + 4);

    if (((attr2 >> 10) & 3) != priority) continue;

    uint16_t attr0 = processor.ReadU16Debug(OAM_BASE + (uint32_t)(oamNum * 8) + 0);
    uint16_t attr1 = processor.ReadU16Debug(OAM_BASE + (uint32_t)(oamNum * 8) + 2);

    int32_t x = attr1 & 0x1FF;
    int32_t y = attr0 & 0xFF;

    bool semiTransparent = false;

    switch ((attr0 >> 10) & 3)
    {
    case 1:
      // Semi-transparent
      semiTransparent = true;
      break;
    case 2:
      // Obj window
      continue;
    case 3:
      continue;
    }

    if ((dispCnt & 0x7) >= 3 && (attr2 & 0x3FF) < 0x200) continue;

    int32_t Width = -1, Height = -1;
    switch ((attr0 >> 14) & 3)
    {
    case 0:
      // Square
      switch ((attr1 >> 14) & 3)
      {
      case 0: Width = 8; Height = 8; break;
      case 1: Width = 16; Height = 16; break;
      case 2: Width = 32; Height = 32; break;
      case 3: Width = 64; Height = 64; break;
      }
      break;
    case 1:
      // Horizontal Rectangle
      switch ((attr1 >> 14) & 3)
      {
      case 0: Width = 16; Height = 8; break;
      case 1: Width = 32; Height = 8; break;
      case 2: Width = 32; Height = 16; break;
      case 3: Width = 64; Height = 32; break;
      }
      break;
    case 2:
      // Vertical Rectangle
      switch ((attr1 >> 14) & 3)
      {
      case 0: Width = 8; Height = 16; break;
      case 1: Width = 8; Height = 32; break;
      case 2: Width = 16; Height = 32; break;
      case 3: Width = 32; Height = 64; break;
      }
      break;
    }

    // Check double size flag here

    int32_t rWidth = Width, rHeight = Height;
    if ((attr0 & (1 << 8)) != 0)
    {
      // Rot-scale on
      if ((attr0 & (1 << 9)) != 0)
      {
        rWidth *= 2;
        rHeight *= 2;
      }
    }
    else
    {
      // Invalid sprite
      if ((attr0 & (1 << 9)) != 0)
        Width = -1;
    }

    if (Width == -1)
    {
      // Invalid sprite
      continue;
    }

    // Y clipping
    if (y > ((y + rHeight) & 0xff))
    {
      if (curLine >= ((y + rHeight) & 0xff) && !(y < curLine)) continue;
    }
    else
    {
      if (curLine < y || curLine >= ((y + rHeight) & 0xff)) continue;
    }

    int32_t scale = 1;
    if ((attr0 & (1 << 13)) != 0) scale = 2;

    int32_t spritey = curLine - y;
    if (spritey < 0) spritey += 256;

    if (semiTransparent)
    {
      if ((attr0 & (1 << 8)) == 0)
      {
        if ((attr1 & (1 << 13)) != 0) spritey = (Height - 1) - spritey;

        int32_t baseSprite;
        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * (Width / 8)) * scale;
        }
        else
        {
          // 2 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * 0x20);
        }

        int32_t baseInc = scale;
        if ((attr1 & (1 << 12)) != 0)
        {
          baseSprite += ((Width / 8) * scale) - scale;
          baseInc = -baseInc;
        }

        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 8) + tx;
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(0x200 + lookup * 2, palRamStart);
                
                if ((windowCover[i & 0x1ff] & (1 << 5)) != 0)
                {
                  if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                  {
                    uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                    uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                    uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                    uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                    r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                    g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                    b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                    if (r > 0xff) r = 0xff;
                    if (g > 0xff) g = 0xff;
                    if (b > 0xff) b = 0xff;
                    pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                  }
                  else
                  {
                    pixelColor = GBAToColor(pixelColor);
                  }
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 4) + (tx / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(palIdx + lookup * 2, palRamStart);
                
                if ((windowCover[i & 0x1ff] & (1 << 5)) != 0)
                {
                  if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                  {
                    uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                    uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                    uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                    uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                    r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                    g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                    b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                    if (r > 0xff) r = 0xff;
                    if (g > 0xff) g = 0xff;
                    if (b > 0xff) b = 0xff;
                    pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                  }
                  else
                  {
                    pixelColor = GBAToColor(pixelColor);
                  }
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
      }
      else
      {
        int32_t rotScaleParam = (attr1 >> 9) & 0x1F;

        uint8_t dx = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x6);
        uint8_t dmx = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0xE);
        uint8_t dy = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x16);
        uint8_t dmy = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x1E);

        int32_t cx = rWidth / 2;
        int32_t cy = rHeight / 2;

        int32_t baseSprite = attr2 & 0x3FF;
        int32_t pitch;

        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          pitch = (Width / 8) * scale;
        }
        else
        {
          // 2 dimensional
          pitch = 0x20;
        }

        int32_t rx = (int32_t)((dmx * (spritey - cy)) - (cx * dx) + (Width << 7));
        int32_t ry = (int32_t)((dmy * (spritey - cy)) - (cx * dy) + (Height << 7));

        // Draw a rot/scale sprite
        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 8) + (tx & 7);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(0x200 + lookup * 2, palRamStart);
                
                if ((windowCover[i & 0x1ff] & (1 << 5)) != 0)
                {
                  if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                  {
                    uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                    uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                    uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                    uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                    r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                    g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                    b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                    if (r > 0xff) r = 0xff;
                    if (g > 0xff) g = 0xff;
                    if (b > 0xff) b = 0xff;
                    pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                  }
                  else
                  {
                    pixelColor = GBAToColor(pixelColor);
                  }
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int32_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 4) + ((tx & 7) / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(palIdx + lookup * 2, palRamStart);
                
                if ((windowCover[i & 0x1ff] & (1 << 5)) != 0)
                {
                  if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                  {
                    uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                    uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                    uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                    uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                    r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                    g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                    b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B                  
                    if (r > 0xff) r = 0xff;
                    if (g > 0xff) g = 0xff;
                    if (b > 0xff) b = 0xff;
                    pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                  }
                  else
                  {
                    pixelColor = GBAToColor(pixelColor);
                  }
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
      }
    }
    else
    {
      if ((attr0 & (1 << 8)) == 0)
      {
        if ((attr1 & (1 << 13)) != 0) spritey = (Height - 1) - spritey;

        int32_t baseSprite;
        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * (Width / 8)) * scale;
        }
        else
        {
          // 2 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * 0x20);
        }

        int32_t baseInc = scale;
        if ((attr1 & (1 << 12)) != 0)
        {
          baseSprite += ((Width / 8) * scale) - scale;
          baseInc = -baseInc;
        }

        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 8) + tx;
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(0x200 + lookup * 2, palRamStart);
                if ((windowCover[i & 0x1ff] & (1 << 5)) != 0)
                {
                  uint8_t r = (uint8_t)((pixelColor) & 0x1F);      //First 5 Bits
                  uint8_t g = (uint8_t)((pixelColor >> 5) & 0x1F);  //Middle 5 Bits
                  uint8_t b = (uint8_t)((pixelColor >> 10) & 0x1F);   //Last 5 Bits 
                  r = r - ((r * blendY) >> 4);
                  g = g - ((g * blendY) >> 4);
                  b = b - ((b * blendY) >> 4);
                  pixelColor = ((b) << 0) | ((g) << 5) | ((r) << 11);
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (uint8_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 4) + (tx / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(palIdx + lookup * 2, palRamStart);
                
                if ((windowCover[i & 0x1ff] & (1 << 5)) != 0)
                {
                  uint8_t r = (uint8_t)((pixelColor) & 0x1F);      //First 5 Bits
                  uint8_t g = (uint8_t)((pixelColor >> 5) & 0x1F);  //Middle 5 Bits
                  uint8_t b = (uint8_t)((pixelColor >> 10) & 0x1F);   //Last 5 Bits 
                  r = r - ((r * blendY) >> 4);
                  g = g - ((g * blendY) >> 4);
                  b = b - ((b * blendY) >> 4);
                  pixelColor = ((b) << 0) | ((g) << 5) | ((r) << 11);
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
      }
      else
      {
        int32_t rotScaleParam = (attr1 >> 9) & 0x1F;

        uint16_t dx = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x6);
        uint16_t dmx = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0xE);
        uint16_t dy = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x16);
        uint16_t dmy = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x1E);

        int32_t cx = rWidth / 2;
        int32_t cy = rHeight / 2;

        int32_t baseSprite = attr2 & 0x3FF;
        int32_t pitch;

        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          pitch = (Width / 8) * scale;
        }
        else
        {
          // 2 dimensional
          pitch = 0x20;
        }

        int32_t rx = (int32_t)((dmx * (spritey - cy)) - (cx * dx) + (Width << 7));
        int32_t ry = (int32_t)((dmy * (spritey - cy)) - (cx * dy) + (Height << 7));

        // Draw a rot/scale sprite
        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 8) + (tx & 7);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(0x200 + lookup * 2, palRamStart);
                
                if ((windowCover[i & 0x1ff] & (1 << 5)) != 0)
                {
                  uint8_t r = (uint8_t)((pixelColor) & 0x1F);      //First 5 Bits
                  uint8_t g = (uint8_t)((pixelColor >> 5) & 0x1F);  //Middle 5 Bits
                  uint8_t b = (uint8_t)((pixelColor >> 10) & 0x1F);   //Last 5 Bits 
                  r = r - ((r * blendY) >> 4);
                  g = g - ((g * blendY) >> 4);
                  b = b - ((b * blendY) >> 4);
                  pixelColor = ((b) << 0) | ((g) << 5) | ((r) << 11);
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int32_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 4) + ((tx & 7) / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(palIdx + lookup * 2, palRamStart);
                
                if ((windowCover[i & 0x1ff] & (1 << 5)) != 0)
                {
                  uint8_t r = (uint8_t)((pixelColor) & 0x1F);      //First 5 Bits
                  uint8_t g = (uint8_t)((pixelColor >> 5) & 0x1F);  //Middle 5 Bits
                  uint8_t b = (uint8_t)((pixelColor >> 10) & 0x1F);   //Last 5 Bits 
                  r = r - ((r * blendY) >> 4);
                  g = g - ((g * blendY) >> 4);
                  b = b - ((b * blendY) >> 4);
                  pixelColor = ((b) << 0) | ((g) << 5) | ((r) << 11);
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
      }
    }
  }
}

void DrawSpritesWindowBrightDec(int32_t priority)
{
  // OBJ must be enabled in this.dispCnt
  if ((dispCnt & (1 << 12)) == 0) return;

  uint8_t blendMaskType = (uint8_t)(1 << 4);

  for (int32_t oamNum = 127; oamNum >= 0; oamNum--)
  {
    uint16_t attr2 = processor.ReadU16Debug(OAM_BASE + (uint32_t)(oamNum * 8) + 4);

    if (((attr2 >> 10) & 3) != priority) continue;

    uint16_t attr0 = processor.ReadU16Debug(OAM_BASE + (uint32_t)(oamNum * 8) + 0);
    uint16_t attr1 = processor.ReadU16Debug(OAM_BASE + (uint32_t)(oamNum * 8) + 2);

    int32_t x = attr1 & 0x1FF;
    int32_t y = attr0 & 0xFF;

    bool semiTransparent = false;

    switch ((attr0 >> 10) & 3)
    {
    case 1:
      // Semi-transparent
      semiTransparent = true;
      break;
    case 2:
      // Obj window
      continue;
    case 3:
      continue;
    }

    if ((dispCnt & 0x7) >= 3 && (attr2 & 0x3FF) < 0x200) continue;

    int32_t Width = -1, Height = -1;
    switch ((attr0 >> 14) & 3)
    {
    case 0:
      // Square
      switch ((attr1 >> 14) & 3)
      {
      case 0: Width = 8; Height = 8; break;
      case 1: Width = 16; Height = 16; break;
      case 2: Width = 32; Height = 32; break;
      case 3: Width = 64; Height = 64; break;
      }
      break;
    case 1:
      // Horizontal Rectangle
      switch ((attr1 >> 14) & 3)
      {
      case 0: Width = 16; Height = 8; break;
      case 1: Width = 32; Height = 8; break;
      case 2: Width = 32; Height = 16; break;
      case 3: Width = 64; Height = 32; break;
      }
      break;
    case 2:
      // Vertical Rectangle
      switch ((attr1 >> 14) & 3)
      {
      case 0: Width = 8; Height = 16; break;
      case 1: Width = 8; Height = 32; break;
      case 2: Width = 16; Height = 32; break;
      case 3: Width = 32; Height = 64; break;
      }
      break;
    }

    // Check double size flag here

    int32_t rWidth = Width, rHeight = Height;
    if ((attr0 & (1 << 8)) != 0)
    {
      // Rot-scale on
      if ((attr0 & (1 << 9)) != 0)
      {
        rWidth *= 2;
        rHeight *= 2;
      }
    }
    else
    {
      // Invalid sprite
      if ((attr0 & (1 << 9)) != 0)
        Width = -1;
    }

    if (Width == -1)
    {
      // Invalid sprite
      continue;
    }

    // Y clipping
    if (y > ((y + rHeight) & 0xff))
    {
      if (curLine >= ((y + rHeight) & 0xff) && !(y < curLine)) continue;
    }
    else
    {
      if (curLine < y || curLine >= ((y + rHeight) & 0xff)) continue;
    }

    int32_t scale = 1;
    if ((attr0 & (1 << 13)) != 0) scale = 2;

    int32_t spritey = curLine - y;
    if (spritey < 0) spritey += 256;

    if (semiTransparent)
    {
      if ((attr0 & (1 << 8)) == 0)
      {
        if ((attr1 & (1 << 13)) != 0) spritey = (Height - 1) - spritey;

        int32_t baseSprite;
        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * (Width / 8)) * scale;
        }
        else
        {
          // 2 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * 0x20);
        }

        int32_t baseInc = scale;
        if ((attr1 & (1 << 12)) != 0)
        {
          baseSprite += ((Width / 8) * scale) - scale;
          baseInc = -baseInc;
        }

        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 8) + tx;
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(0x200 + lookup * 2, palRamStart);
                
                if ((windowCover[i & 0x1ff] & (1 << 5)) != 0)
                {
                  if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                  {
                    uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                    uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                    uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                    uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                    r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                    g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                    b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                    if (r > 0xff) r = 0xff;
                    if (g > 0xff) g = 0xff;
                    if (b > 0xff) b = 0xff;
                    pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                  }
                  else
                  {
                    pixelColor = GBAToColor(pixelColor);
                  }
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 4) + (tx / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(palIdx + lookup * 2, palRamStart);
                
                if ((windowCover[i & 0x1ff] & (1 << 5)) != 0)
                {
                  if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                  {
                    uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                    uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                    uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                    uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                    r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                    g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                    b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                    if (r > 0xff) r = 0xff;
                    if (g > 0xff) g = 0xff;
                    if (b > 0xff) b = 0xff;
                    pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                  }
                  else
                  {
                    pixelColor = GBAToColor(pixelColor);
                  }
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
      }
      else
      {
        int32_t rotScaleParam = (attr1 >> 9) & 0x1F;

        uint8_t dx = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x6);
        uint8_t dmx = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0xE);
        uint8_t dy = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x16);
        uint8_t dmy = (uint8_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x1E);

        int32_t cx = rWidth / 2;
        int32_t cy = rHeight / 2;

        int32_t baseSprite = attr2 & 0x3FF;
        int32_t pitch;

        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          pitch = (Width / 8) * scale;
        }
        else
        {
          // 2 dimensional
          pitch = 0x20;
        }

        int32_t rx = (int32_t)((dmx * (spritey - cy)) - (cx * dx) + (Width << 7));
        int32_t ry = (int32_t)((dmy * (spritey - cy)) - (cx * dy) + (Height << 7));

        // Draw a rot/scale sprite
        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 8) + (tx & 7);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(0x200 + lookup * 2, palRamStart);
                
                if ((windowCover[i & 0x1ff] & (1 << 5)) != 0)
                {
                  if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                  {
                    uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                    uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                    uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                    uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                    r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                    g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                    b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                    if (r > 0xff) r = 0xff;
                    if (g > 0xff) g = 0xff;
                    if (b > 0xff) b = 0xff;
                    pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                  }
                  else
                  {
                    pixelColor = GBAToColor(pixelColor);
                  }
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int32_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 4) + ((tx & 7) / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(palIdx + lookup * 2, palRamStart);
                
                if ((windowCover[i & 0x1ff] & (1 << 5)) != 0)
                {
                  if ((Blend[i & 0x1ff] & blendTarget) != 0 && Blend[i & 0x1ff] != blendMaskType)
                  {
                    uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
                    uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
                    uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
                    uint16_t sourceValue = tft.dgetPixel(curLine, (i & 0x1ff));
                    r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
                    g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
                    b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                    if (r > 0xff) r = 0xff;
                    if (g > 0xff) g = 0xff;
                    if (b > 0xff) b = 0xff;
                    pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
                  }
                  else
                  {
                    pixelColor = GBAToColor(pixelColor);
                  }
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
      }
    }
    else
    {
      if ((attr0 & (1 << 8)) == 0)
      {
        if ((attr1 & (1 << 13)) != 0) spritey = (Height - 1) - spritey;

        int32_t baseSprite;
        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * (Width / 8)) * scale;
        }
        else
        {
          // 2 dimensional
          baseSprite = (attr2 & 0x3FF) + ((spritey / 8) * 0x20);
        }

        int32_t baseInc = scale;
        if ((attr1 & (1 << 12)) != 0)
        {
          baseSprite += ((Width / 8) * scale) - scale;
          baseInc = -baseInc;
        }

        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 8) + tx;
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(0x200 + lookup * 2, palRamStart);
                
                if ((windowCover[i & 0x1ff] & (1 << 5)) != 0)
                {
                  uint8_t r = (uint8_t)((pixelColor) & 0x1F);      //First 5 Bits
                  uint8_t g = (uint8_t)((pixelColor >> 5) & 0x1F);  //Middle 5 Bits
                  uint8_t b = (uint8_t)((pixelColor >> 10) & 0x1F);   //Last 5 Bits 
                  r = r - ((r * blendY) >> 4);
                  g = g - ((g * blendY) >> 4);
                  b = b - ((b * blendY) >> 4);
                  pixelColor = ((b) << 0) | ((g) << 5) | ((r) << 11);
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int32_t i = x; i < x + Width; i++)
          {
            if ((i & 0x1ff) < 240 && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t tx = (i - x) & 7;
              if ((attr1 & (1 << 12)) != 0) tx = 7 - tx;
              int32_t curIdx = baseSprite * 32 + ((spritey & 7) * 4) + (tx / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(palIdx + lookup * 2, palRamStart);
                
                if ((windowCover[i & 0x1ff] & (1 << 5)) != 0)
                {
                  uint8_t r = (uint8_t)((pixelColor) & 0x1F);      //First 5 Bits
                  uint8_t g = (uint8_t)((pixelColor >> 5) & 0x1F);  //Middle 5 Bits
                  uint8_t b = (uint8_t)((pixelColor >> 10) & 0x1F);   //Last 5 Bits 
                  r = r - ((r * blendY) >> 4);
                  g = g - ((g * blendY) >> 4);
                  b = b - ((b * blendY) >> 4);
                  pixelColor = ((b) << 0) | ((g) << 5) | ((r) << 11);
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            if (((i - x) & 7) == 7) baseSprite += baseInc;
          }
        }
      }
      else
      {
        int32_t rotScaleParam = (attr1 >> 9) & 0x1F;

        uint16_t dx = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x6);
        uint16_t dmx = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0xE);
        uint16_t dy = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x16);
        uint16_t dmy = (uint16_t)processor.ReadU16Debug(OAM_BASE + (uint32_t)(rotScaleParam * 8 * 4) + 0x1E);

        int32_t cx = rWidth / 2;
        int32_t cy = rHeight / 2;

        int32_t baseSprite = attr2 & 0x3FF;
        int32_t pitch;

        if ((dispCnt & (1 << 6)) != 0)
        {
          // 1 dimensional
          pitch = (Width / 8) * scale;
        }
        else
        {
          // 2 dimensional
          pitch = 0x20;
        }

        int32_t rx = (int32_t)((dmx * (spritey - cy)) - (cx * dx) + (Width << 7));
        int32_t ry = (int32_t)((dmy * (spritey - cy)) - (cx * dy) + (Height << 7));

        // Draw a rot/scale sprite
        if ((attr0 & (1 << 13)) != 0)
        {
          // 256 colors
          for (int32_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 8) + (tx & 7);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(0x200 + lookup * 2, palRamStart);
                
                if ((windowCover[i & 0x1ff] & (1 << 5)) != 0)
                {
                  uint8_t r = (uint8_t)((pixelColor) & 0x1F);      //First 5 Bits
                  uint8_t g = (uint8_t)((pixelColor >> 5) & 0x1F);  //Middle 5 Bits
                  uint8_t b = (uint8_t)((pixelColor >> 10) & 0x1F);   //Last 5 Bits 
                  r = r - ((r * blendY) >> 4);
                  g = g - ((g * blendY) >> 4);
                  b = b - ((b * blendY) >> 4);
                  pixelColor = ((b) << 0) | ((g) << 5) | ((r) << 11);
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
        else
        {
          // 16 colors
          int32_t palIdx = 0x200 + (((attr2 >> 12) & 0xF) * 16 * 2);
          for (int32_t i = x; i < x + rWidth; i++)
          {
            int32_t tx = rx >> 8;
            int32_t ty = ry >> 8;

            if ((i & 0x1ff) < 240 && tx >= 0 && tx < Width && ty >= 0 && ty < Height && (windowCover[i & 0x1ff] & (1 << 4)) != 0)
            {
              int32_t curIdx = (baseSprite + ((ty / 8) * pitch) + ((tx / 8) * scale)) * 32 + ((ty & 7) * 4) + ((tx & 7) / 2);
              int32_t lookup = processor.ReadU8(0x10000 + curIdx, vRamStart);
              if ((tx & 1) == 0)
              {
                lookup &= 0xf;
              }
              else
              {
                lookup >>= 4;
              }
              if (lookup != 0)
              {
                uint16_t pixelColor = processor.ReadU16(palIdx + lookup * 2, palRamStart);
                
                if ((windowCover[i & 0x1ff] & (1 << 5)) != 0)
                {
                  uint8_t r = (uint8_t)((pixelColor) & 0x1F);      //First 5 Bits
                  uint8_t g = (uint8_t)((pixelColor >> 5) & 0x1F);  //Middle 5 Bits
                  uint8_t b = (uint8_t)((pixelColor >> 10) & 0x1F);   //Last 5 Bits 
                  r = r - ((r * blendY) >> 4);
                  g = g - ((g * blendY) >> 4);
                  b = b - ((b * blendY) >> 4);
                  pixelColor = ((b) << 0) | ((g) << 5) | ((r) << 11);
                }
                else
                {
                  pixelColor = GBAToColor(pixelColor);
                }
                
                DrawPixel(curLine, (i & 0x1ff), pixelColor); 
                Blend[(i & 0x1ff)] = blendMaskType;
              }
            }
            rx += dx;
            ry += dy;
          }
        }
      }
    }
  }
}

void RenderRotScaleBgNormal(int32_t bg)
{
  //Serial.println("Render Rot Scale Bg Normal");
  uint8_t blendMaskType = (uint8_t)(1 << bg);

  uint16_t bgcnt = processor.ReadU16(BG0CNT + 0x2 * (uint32_t)bg, ioRegStart);

  int32_t Width = 0, Height = 0;
  switch ((bgcnt >> 14) & 0x3)
  {
  case 0: Width = 128; Height = 128; break;
  case 1: Width = 256; Height = 256; break;
  case 2: Width = 512; Height = 512; break;
  case 3: Width = 1024; Height = 1024; break;
  }

  int32_t screenBase = ((bgcnt >> 8) & 0x1F) * 0x800;
  int32_t charBase = ((bgcnt >> 2) & 0x3) * 0x4000;

  int32_t x = processor.bgx[bg - 2];
  int32_t y = processor.bgy[bg - 2];

  uint16_t dx = (uint16_t)processor.ReadU16(BG2PA + (uint32_t)(bg - 2) * 0x10, ioRegStart);
  uint16_t dy = (uint16_t)processor.ReadU16(BG2PC + (uint32_t)(bg - 2) * 0x10, ioRegStart);

  bool transparent = (bgcnt & (1 << 13)) == 0;

  for (int32_t i = 0; i < 240; i++)
  {
    if (true)
    {
      int32_t ax = x >> 8;
      int32_t ay = y >> 8;

      if ((ax >= 0 && ax < Width && ay >= 0 && ay < Height) || !transparent)
      {
        int32_t tmpTileIdx = (uint32_t)(screenBase + ((ay & (Height - 1)) / 8) * (Width / 8) + ((ax & (Width - 1)) / 8));
        int32_t tileChar = processor.ReadU8(tmpTileIdx, vRamStart);

        int32_t lookup = processor.ReadU8(charBase + (tileChar * 64) + ((ay & 7) * 8) + (ax & 7), vRamStart);
        if (lookup != 0)
        {
          uint16_t pixelColor = GBAToColor(processor.ReadU16(lookup * 2, palRamStart));
          DrawPixel(curLine, i, pixelColor); 
          Blend[i] = blendMaskType;
        }
      }
    }
    x += dx;
    y += dy;
  }
}

void RenderRotScaleBgBlend(int32_t bg)
{
  uint8_t blendMaskType = (uint8_t)(1 << bg);

  uint16_t bgcnt = processor.ReadU16(BG0CNT + 0x2 * (uint32_t)bg, ioRegStart);

  int32_t Width = 0, Height = 0;
  switch ((bgcnt >> 14) & 0x3)
  {
  case 0: Width = 128; Height = 128; break;
  case 1: Width = 256; Height = 256; break;
  case 2: Width = 512; Height = 512; break;
  case 3: Width = 1024; Height = 1024; break;
  }

  int32_t screenBase = ((bgcnt >> 8) & 0x1F) * 0x800;
  int32_t charBase = ((bgcnt >> 2) & 0x3) * 0x4000;

  int32_t x = processor.bgx[bg - 2];
  int32_t y = processor.bgy[bg - 2];

  uint16_t dx = (uint16_t)processor.ReadU16(BG2PA + (uint32_t)(bg - 2) * 0x10, ioRegStart);
  uint16_t dy = (uint16_t)processor.ReadU16(BG2PC + (uint32_t)(bg - 2) * 0x10, ioRegStart);

  bool transparent = (bgcnt & (1 << 13)) == 0;

  for (int32_t i = 0; i < 240; i++)
  {
    if (true)
    {
      int32_t ax = x >> 8;
      int32_t ay = y >> 8;

      if ((ax >= 0 && ax < Width && ay >= 0 && ay < Height) || !transparent)
      {
        int32_t tmpTileIdx = (uint32_t)(screenBase + ((ay & (Height - 1)) / 8) * (Width / 8) + ((ax & (Width - 1)) / 8));
        int32_t tileChar = processor.ReadU8(tmpTileIdx, vRamStart);

        int32_t lookup = processor.ReadU8(charBase + (tileChar * 64) + ((ay & 7) * 8) + (ax & 7), vRamStart);
        if (lookup != 0)
        {
          uint16_t pixelColor = processor.ReadU16(lookup * 2, palRamStart);
          
          if ((Blend[i] & blendTarget) != 0)
          {
            uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
            uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
            uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
            uint16_t sourceValue = tft.dgetPixel(curLine, i);
            r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
            g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
            b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                  
            if (r > 0xff) r = 0xff;
            if (g > 0xff) g = 0xff;
            if (b > 0xff) b = 0xff;
                  
            pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
          }
          else
          {
            pixelColor = GBAToColor(pixelColor);
          }
          
          DrawPixel(curLine, i, pixelColor); 
          Blend[i] = blendMaskType;
        }
      }
    }
    x += dx;
    y += dy;
  }
}

void RenderRotScaleBgBrightInc(int32_t bg)
{
  uint8_t blendMaskType = (uint8_t)(1 << bg);

  uint16_t bgcnt = processor.ReadU16(BG0CNT + 0x2 * (uint32_t)bg, ioRegStart);

  int32_t Width = 0, Height = 0;
  switch ((bgcnt >> 14) & 0x3)
  {
  case 0: Width = 128; Height = 128; break;
  case 1: Width = 256; Height = 256; break;
  case 2: Width = 512; Height = 512; break;
  case 3: Width = 1024; Height = 1024; break;
  }

  int32_t screenBase = ((bgcnt >> 8) & 0x1F) * 0x800;
  int32_t charBase = ((bgcnt >> 2) & 0x3) * 0x4000;

  int32_t x = processor.bgx[bg - 2];
  int32_t y = processor.bgy[bg - 2];

  uint16_t dx = (uint16_t)processor.ReadU16(BG2PA + (uint32_t)(bg - 2) * 0x10, ioRegStart);
  uint16_t dy = (uint16_t)processor.ReadU16(BG2PC + (uint32_t)(bg - 2) * 0x10, ioRegStart);

  bool transparent = (bgcnt & (1 << 13)) == 0;

  for (int32_t i = 0; i < 240; i++)
  {
    if (true)
    {
      int32_t ax = x >> 8;
      int32_t ay = y >> 8;

      if ((ax >= 0 && ax < Width && ay >= 0 && ay < Height) || !transparent)
      {
        int32_t tmpTileIdx = (uint32_t)(screenBase + ((ay & (Height - 1)) / 8) * (Width / 8) + ((ax & (Width - 1)) / 8));
        int32_t tileChar = processor.ReadU8(tmpTileIdx, vRamStart);

        int32_t lookup = processor.ReadU8(charBase + (tileChar * 64) + ((ay & 7) * 8) + (ax & 7), vRamStart);
        if (lookup != 0)
        {
          uint16_t pixelColor = processor.ReadU16(lookup * 2, palRamStart);
          uint16_t r = (uint8_t)((pixelColor) & 0x1F);      //First 5 Bits
          uint16_t g = (uint8_t)((pixelColor >> 5) & 0x1F);  //Middle 5 Bits
          uint16_t b = (uint8_t)((pixelColor >> 10) & 0x1F);   //Last 5 Bits 
          r = r - ((r * blendY) >> 4);
          g = g - ((g * blendY) >> 4);
          b = b - ((b * blendY) >> 4);
          pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
          DrawPixel(curLine, i, pixelColor); 
          Blend[i] = blendMaskType;
        }
      }
    }
    x += dx;
    y += dy;
  }
}

void RenderRotScaleBgBrightDec(int32_t bg)
{
  uint8_t blendMaskType = (uint8_t)(1 << bg);

  uint16_t bgcnt = processor.ReadU16(BG0CNT + 0x2 * (uint32_t)bg, ioRegStart);

  int32_t Width = 0, Height = 0;
  switch ((bgcnt >> 14) & 0x3)
  {
  case 0: Width = 128; Height = 128; break;
  case 1: Width = 256; Height = 256; break;
  case 2: Width = 512; Height = 512; break;
  case 3: Width = 1024; Height = 1024; break;
  }

  int32_t screenBase = ((bgcnt >> 8) & 0x1F) * 0x800;
  int32_t charBase = ((bgcnt >> 2) & 0x3) * 0x4000;

  int32_t x = processor.bgx[bg - 2];
  int32_t y = processor.bgy[bg - 2];

  uint16_t dx = (uint16_t)processor.ReadU16(BG2PA + (uint32_t)(bg - 2) * 0x10, ioRegStart);
  uint16_t dy = (uint16_t)processor.ReadU16(BG2PC + (uint32_t)(bg - 2) * 0x10, ioRegStart);

  bool transparent = (bgcnt & (1 << 13)) == 0;

  for (int32_t i = 0; i < 240; i++)
  {
    if (true)
    {
      int32_t ax = x >> 8;
      int32_t ay = y >> 8;

      if ((ax >= 0 && ax < Width && ay >= 0 && ay < Height) || !transparent)
      {
        int32_t tmpTileIdx = (uint32_t)(screenBase + ((ay & (Height - 1)) / 8) * (Width / 8) + ((ax & (Width - 1)) / 8));
        int32_t tileChar = processor.ReadU8(tmpTileIdx, vRamStart);

        int32_t lookup = processor.ReadU8(charBase + (tileChar * 64) + ((ay & 7) * 8) + (ax & 7), vRamStart);
        if (lookup != 0)
        {
          uint16_t pixelColor = processor.ReadU16(lookup * 2, palRamStart);
          uint8_t r = (uint8_t)((pixelColor) & 0x1F);      //First 5 Bits
          uint8_t g = (uint8_t)((pixelColor >> 5) & 0x1F);  //Middle 5 Bits
          uint8_t b = (uint8_t)((pixelColor >> 10) & 0x1F);   //Last 5 Bits 
          r = r - ((r * blendY) >> 4);
          g = g - ((g * blendY) >> 4);
          b = b - ((b * blendY) >> 4);
          pixelColor = ((b) << 0) | ((g) << 5) | ((r) << 11);
          DrawPixel(curLine, i, pixelColor); 
          Blend[i] = blendMaskType;
        }
      }
    }
    x += dx;
    y += dy;
  }
}

void RenderRotScaleBgWindow(int32_t bg)
{
  uint8_t blendMaskType = (uint8_t)(1 << bg);

  uint16_t bgcnt = processor.ReadU16(BG0CNT + 0x2 * (uint32_t)bg, ioRegStart);

  int32_t Width = 0, Height = 0;
  switch ((bgcnt >> 14) & 0x3)
  {
  case 0: Width = 128; Height = 128; break;
  case 1: Width = 256; Height = 256; break;
  case 2: Width = 512; Height = 512; break;
  case 3: Width = 1024; Height = 1024; break;
  }

  int32_t screenBase = ((bgcnt >> 8) & 0x1F) * 0x800;
  int32_t charBase = ((bgcnt >> 2) & 0x3) * 0x4000;

  int32_t x = processor.bgx[bg - 2];
  int32_t y = processor.bgy[bg - 2];

  uint16_t dx = (uint16_t)processor.ReadU16(BG2PA + (uint32_t)(bg - 2) * 0x10, ioRegStart);
  uint16_t dy = (uint16_t)processor.ReadU16(BG2PC + (uint32_t)(bg - 2) * 0x10, ioRegStart);

  bool transparent = (bgcnt & (1 << 13)) == 0;

  for (int32_t i = 0; i < 240; i++)
  {
    if ((windowCover[i] & (1 << bg)) != 0)
    {
      int32_t ax = x >> 8;
      int32_t ay = y >> 8;

      if ((ax >= 0 && ax < Width && ay >= 0 && ay < Height) || !transparent)
      {
        int32_t tmpTileIdx = (uint32_t)(screenBase + ((ay & (Height - 1)) / 8) * (Width / 8) + ((ax & (Width - 1)) / 8));
        int32_t tileChar = processor.ReadU8(tmpTileIdx, vRamStart);

        int32_t lookup = processor.ReadU8(charBase + (tileChar * 64) + ((ay & 7) * 8) + (ax & 7), vRamStart);
        if (lookup != 0)
        {
          uint16_t pixelColor = GBAToColor(processor.ReadU16(lookup * 2, palRamStart));
          DrawPixel(curLine, i, pixelColor); 
          Blend[i] = blendMaskType;
        }
      }
    }
    x += dx;
    y += dy;
  }
}

void RenderRotScaleBgWindowBlend(int32_t bg)
{
  uint8_t blendMaskType = (uint8_t)(1 << bg);

  uint16_t bgcnt = processor.ReadU16(BG0CNT + 0x2 * (uint32_t)bg, ioRegStart);

  int32_t Width = 0, Height = 0;
  switch ((bgcnt >> 14) & 0x3)
  {
  case 0: Width = 128; Height = 128; break;
  case 1: Width = 256; Height = 256; break;
  case 2: Width = 512; Height = 512; break;
  case 3: Width = 1024; Height = 1024; break;
  }

  int32_t screenBase = ((bgcnt >> 8) & 0x1F) * 0x800;
  int32_t charBase = ((bgcnt >> 2) & 0x3) * 0x4000;

  int32_t x = processor.bgx[bg - 2];
  int32_t y = processor.bgy[bg - 2];

  uint16_t dx = (uint16_t)processor.ReadU16(BG2PA + (uint32_t)(bg - 2) * 0x10, ioRegStart);
  uint16_t dy = (uint16_t)processor.ReadU16(BG2PC + (uint32_t)(bg - 2) * 0x10, ioRegStart);

  bool transparent = (bgcnt & (1 << 13)) == 0;

  for (int32_t i = 0; i < 240; i++)
  {
    if ((windowCover[i] & (1 << bg)) != 0)
    {
      int32_t ax = x >> 8;
      int32_t ay = y >> 8;

      if ((ax >= 0 && ax < Width && ay >= 0 && ay < Height) || !transparent)
      {
        int32_t tmpTileIdx = (uint32_t)(screenBase + ((ay & (Height - 1)) / 8) * (Width / 8) + ((ax & (Width - 1)) / 8));
        int32_t tileChar = processor.ReadU8(tmpTileIdx, vRamStart);

        int32_t lookup = processor.ReadU8(charBase + (tileChar * 64) + ((ay & 7) * 8) + (ax & 7), vRamStart);
        if (lookup != 0)
        {
          uint16_t pixelColor = processor.ReadU16(lookup * 2, palRamStart);
          if ((windowCover[i] & (1 << 5)) != 0)
          {
            if ((Blend[i] & blendTarget) != 0)
            {
              uint16_t r = (uint8_t)((((pixelColor) & 0x1F) * blendA) >> 4);       //First 5 Bits
              uint16_t g = (uint8_t)((((pixelColor >> 5) & 0x1F) * blendA) >> 4);  //Middle 5 Bits
              uint16_t b = (uint8_t)((((pixelColor >> 10) & 0x1F) * blendA) >> 4);   //Last 5 Bits
              
              uint16_t sourceValue = tft.dgetPixel(curLine, i);
              
              r += (uint8_t)((((sourceValue >> 11) & 0x1F) * blendB) >> 4); //R
              g += (uint8_t)((((sourceValue >> 5) & 0x3F) * blendB) >> 4); //G
              b += (uint8_t)((((sourceValue) & 0x1F) * blendB) >> 4); //B
                  
              if (r > 0xff) r = 0xff;
              if (g > 0xff) g = 0xff;
              if (b > 0xff) b = 0xff;
                  
              pixelColor = ((uint8_t)(b) << 0) | ((uint8_t)(g) << 5) | ((uint8_t)(r) << 11);
            }
            else
            {
              pixelColor = GBAToColor(pixelColor);
            }
            
            DrawPixel(curLine, i, pixelColor); 
            Blend[i] = blendMaskType;
          }
        }
      }
    }
    x += dx;
    y += dy;
  }
}

void RenderRotScaleBgWindowBrightInc(int32_t bg)
{
  uint8_t blendMaskType = (uint8_t)(1 << bg);

  uint16_t bgcnt = processor.ReadU16(BG0CNT + 0x2 * (uint32_t)bg, ioRegStart);

  int32_t Width = 0, Height = 0;
  switch ((bgcnt >> 14) & 0x3)
  {
  case 0: Width = 128; Height = 128; break;
  case 1: Width = 256; Height = 256; break;
  case 2: Width = 512; Height = 512; break;
  case 3: Width = 1024; Height = 1024; break;
  }

  int32_t screenBase = ((bgcnt >> 8) & 0x1F) * 0x800;
  int32_t charBase = ((bgcnt >> 2) & 0x3) * 0x4000;

  int32_t x = processor.bgx[bg - 2];
  int32_t y = processor.bgy[bg - 2];

  uint16_t dx = (uint16_t)processor.ReadU16(BG2PA + (uint32_t)(bg - 2) * 0x10, ioRegStart);
  uint16_t dy = (uint16_t)processor.ReadU16(BG2PC + (uint32_t)(bg - 2) * 0x10, ioRegStart);

  bool transparent = (bgcnt & (1 << 13)) == 0;

  for (int32_t i = 0; i < 240; i++)
  {
    if ((windowCover[i] & (1 << bg)) != 0)
    {
      int32_t ax = x >> 8;
      int32_t ay = y >> 8;

      if ((ax >= 0 && ax < Width && ay >= 0 && ay < Height) || !transparent)
      {
        uint32_t tmpTileIdx = (uint32_t)(screenBase + ((ay & (Height - 1)) / 8) * (Width / 8) + ((ax & (Width - 1)) / 8));
        uint32_t tileChar = processor.ReadU8(tmpTileIdx, vRamStart);

        int32_t lookup = processor.ReadU8(charBase + (tileChar * 64) + ((ay & 7) * 8) + (ax & 7), vRamStart);
        if (lookup != 0)
        {
          uint16_t pixelColor = processor.ReadU16(lookup * 2, palRamStart);
          
          if ((windowCover[i] & (1 << 5)) != 0)
          {
            uint8_t r = (uint8_t)((pixelColor) & 0x1F);      //First 5 Bits
            uint8_t g = (uint8_t)((pixelColor >> 5) & 0x1F);  //Middle 5 Bits
            uint8_t b = (uint8_t)((pixelColor >> 10) & 0x1F);   //Last 5 Bits 
            r = r - ((r * blendY) >> 4);
            g = g - ((g * blendY) >> 4);
            b = b - ((b * blendY) >> 4);
            pixelColor = ((b) << 0) | ((g) << 5) | ((r) << 11);
          }
          else
          {
            pixelColor = GBAToColor(pixelColor);
          }
          
          DrawPixel(curLine, i, pixelColor); 
          Blend[i] = blendMaskType;
        }
      }
    }
    x += dx;
    y += dy;
  }
}

void RenderRotScaleBgWindowBrightDec(int32_t bg)
{
  uint8_t blendMaskType = (uint8_t)(1 << bg);

  uint16_t bgcnt = processor.ReadU16(BG0CNT + 0x2 * (uint32_t)bg, ioRegStart);

  int32_t Width = 0, Height = 0;
  switch ((bgcnt >> 14) & 0x3)
  {
  case 0: Width = 128; Height = 128; break;
  case 1: Width = 256; Height = 256; break;
  case 2: Width = 512; Height = 512; break;
  case 3: Width = 1024; Height = 1024; break;
  }

  int32_t screenBase = ((bgcnt >> 8) & 0x1F) * 0x800;
  int32_t charBase = ((bgcnt >> 2) & 0x3) * 0x4000;

  int32_t x = processor.bgx[bg - 2];
  int32_t y = processor.bgy[bg - 2];

  uint16_t dx = (uint16_t)processor.ReadU16(BG2PA + (uint32_t)(bg - 2) * 0x10, ioRegStart);
  uint16_t dy = (uint16_t)processor.ReadU16(BG2PC + (uint32_t)(bg - 2) * 0x10, ioRegStart);

  bool transparent = (bgcnt & (1 << 13)) == 0;

  for (int32_t i = 0; i < 240; i++)
  {
    if ((windowCover[i] & (1 << bg)) != 0)
    {
      int32_t ax = x >> 8;
      int32_t ay = y >> 8;

      if ((ax >= 0 && ax < Width && ay >= 0 && ay < Height) || !transparent)
      {
        int32_t tmpTileIdx = (uint32_t)(screenBase + ((ay & (Height - 1)) / 8) * (Width / 8) + ((ax & (Width - 1)) / 8));
        int32_t tileChar = processor.ReadU8(tmpTileIdx, vRamStart);

        int32_t lookup = processor.ReadU8(charBase + (tileChar * 64) + ((ay & 7) * 8) + (ax & 7), vRamStart);
        if (lookup != 0)
        {
          uint16_t pixelColor = processor.ReadU16(lookup * 2, palRamStart);
          
          if ((windowCover[i] & (1 << 5)) != 0)
          {
            uint8_t r = (uint8_t)((pixelColor) & 0x1F);      //First 5 Bits
            uint8_t g = (uint8_t)((pixelColor >> 5) & 0x1F);  //Middle 5 Bits
            uint8_t b = (uint8_t)((pixelColor >> 10) & 0x1F);   //Last 5 Bits 
            r = r - ((r * blendY) >> 4);
            g = g - ((g * blendY) >> 4);
            b = b - ((b * blendY) >> 4);
            pixelColor = ((b) << 0) | ((g) << 5) | ((r) << 11);
          }
          else
          {
            pixelColor = GBAToColor(pixelColor);
          }
          
          DrawPixel(curLine, i, pixelColor); 
          Blend[i] = blendMaskType;
        }
      }
    }
    x += dx;
    y += dy;
  }
}

uint16_t GBAToColor(uint16_t color)
{
  //In GBA Color Formar 555 BGR
  //Out ILI Color Format 565 RGB
  
  uint8_t r = (uint8_t)((color) & 0x1F);       //First 5 Bits
  uint8_t g = (uint8_t)((color >> 5) & 0x1F);  //Middle 5 Bits
  uint8_t b = (uint8_t)(color >> 10) & 0x1F;   //Last 5 Bits
  return (b << 0) | (g << 5) | (r << 11);
}

void DrawPixel(uint16_t y, uint16_t x, int16_t color) //Stretch Image every second pixel vertically and every third pixel horizontally
{ 
    int32_t DisplayLine = y + round(((double)y * 0.500));
    int32_t DisplayCol =  x + round(((double)x * 0.333));
     
    if(DisplayLine % 3 == 0)
    {
      if(DisplayCol % 4 == 1)
      {
        tft.ddrawPixel(DisplayLine, (319 - DisplayCol), color); 
        tft.ddrawPixel(DisplayLine + 1, (319 - DisplayCol), color); 
        
        tft.ddrawPixel(DisplayLine, (319 - (DisplayCol + 1)), color); 
        tft.ddrawPixel(DisplayLine + 1, (319 - (DisplayCol + 1)), color); 
      }
      else
      {
        tft.ddrawPixel(DisplayLine, (319 - DisplayCol), color); 
        tft.ddrawPixel(DisplayLine + 1, (319 - DisplayCol), color); 
      }
    }
    else
    {
      if(DisplayCol % 4 == 1)
      {
        tft.ddrawPixel(DisplayLine, (319 - DisplayCol), color); 
        tft.ddrawPixel(DisplayLine, (319 - (DisplayCol + 1)), color); 
      }
      else
      {
        tft.ddrawPixel(DisplayLine, (319 - DisplayCol), color);
      }
    }  
}








