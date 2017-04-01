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

#ifndef GBA_h
#define GBA_h

#include "GBA_Arm7.h"
#include "ILI9341_t3DMA.h"
#include <SPI.h>

class GBA
{
  public:
    float FPS;
    ILI9341_t3DMA *tft;

    void Initilise(class File *rom);
    void Update();
    void EnterVBlank();
    void LeaveVBlank();
    void EnterHBlank();
    void LeaveHBlank();
    void GetButtons();

    void RenderLine();
    void DrawBackdrop();
    void RenderTextBg(uint8_t bg);
    void DrawSprites(uint8_t pri);
    void RenderRotScaleBg(uint8_t bg);
    void RenderMode0Line();
    void RenderMode1Line();
    void RenderMode2Line();
    void RenderMode3Line();
    void RenderMode4Line();
    void RenderMode5Line();
    void DrawSpriteWindows();

    void DrawSpritesNormal(int8_t priority);
    void DrawSpritesBlend(int8_t priority);
    void DrawSpritesBrightInc(int32_t priority);
    void DrawSpritesBrightDec(int32_t priority);
    void DrawSpritesWindow(int32_t priority);
    void DrawSpritesWindowBlend(int32_t priority);
    void DrawSpritesWindowBrightInc(int32_t priority);
    void DrawSpritesWindowBrightDec(int32_t priority);

    void RenderRotScaleBgNormal(int32_t bg);
    void RenderRotScaleBgBlend(int32_t bg);
    void RenderRotScaleBgBrightInc(int32_t bg);
    void RenderRotScaleBgBrightDec(int32_t bg);
    void RenderRotScaleBgWindow(int32_t bg);
    void RenderRotScaleBgWindowBlend(int32_t bg);
    void RenderRotScaleBgWindowBrightInc(int32_t bg);
    void RenderRotScaleBgWindowBrightDec(int32_t bg);

    void RenderTextBgNormal(int32_t bg);
    void RenderTextBgBlend(int32_t bg);
    void RenderTextBgBrightInc(int32_t bg);
    void RenderTextBgBrightDec(int32_t bg);
    void RenderTextBgWindow(int32_t bg);
    void RenderTextBgWindowBlend(int32_t bg);
    void RenderTextBgWindowBrightInc(int32_t bg);
    void RenderTextBgWindowBrightDec(int32_t bg);

    uint16_t GBAToColor(uint16_t color);
    void DrawPixel(uint16_t y, uint16_t x, int16_t color);
};

#endif
