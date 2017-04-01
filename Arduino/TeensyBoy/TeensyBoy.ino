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
#include <SD.h>
#include <SD_t3.h>
#include <SPI.h>
#include "GBA.h"
#include "GBC.h"

File FROM;
GBA GBAEmulator;

void setup()
{
  delay(2000);
  
  Serial.begin(250000);
  
  SD.begin(BUILTIN_SDCARD);
  FROM = SD.open("/MK/MK.gba", FILE_READ);

  GBAEmulator.Initilise(&FROM);

  ARM_DEMCR |= ARM_DEMCR_TRCENA;
  ARM_DWT_CTRL |= ARM_DWT_CTRL_CYCCNTENA;

  Serial.println("Checking and Resetting Memory...");
  Serial.flush();

  unsigned long WriteTime = 0.0;
  unsigned long ReadTime = 0.0;
  unsigned long WriteTimeSeq = 0.0;
  unsigned long ReadTimeSeq = 0.0;
  unsigned long AddressTime = 0.0;
  unsigned long AddressTimeSeq = 0.0;
  unsigned long Timer = 0;

  for(int i = 0; i < 30; i++)
  {
    Timer = ARM_DWT_CYCCNT;
    SPIRAMWrite((i * 10), 128);
    Timer = ARM_DWT_CYCCNT - Timer;
    WriteTime += Timer;
  
    Timer = ARM_DWT_CYCCNT;
    SPIRAMWrite((i * 10) + 1, 128);
    Timer = ARM_DWT_CYCCNT - Timer;
    WriteTimeSeq += Timer;
    
    Timer = ARM_DWT_CYCCNT;
    SPIRAMRead((i * 10));
    Timer = ARM_DWT_CYCCNT - Timer;
    ReadTime += Timer;
  
    Timer = ARM_DWT_CYCCNT;
    SPIRAMRead((i * 10) + 1);
    Timer = ARM_DWT_CYCCNT - Timer;
    ReadTimeSeq += Timer;

    Timer = ARM_DWT_CYCCNT;
    SetAddress((i * 10));
    Timer = ARM_DWT_CYCCNT - Timer;
    AddressTime += Timer;

    Timer = ARM_DWT_CYCCNT;
    SetAddress((i * 10) + 1);
    Timer = ARM_DWT_CYCCNT - Timer;
    AddressTimeSeq += Timer;

    SPIRAMRead(0);
  }

  float timemulti = 1.0f / 240; //1 us divided by 240Mhz

  Serial.println("Memory Read Time: " + String(((float)ReadTime / 30.0f) * timemulti) + "us");
  Serial.println("Memory Write Time: " + String(((float)WriteTime / 30.0f) * timemulti) + "us");
  
  Serial.println("Memory Read Time Seq: " + String(((float)ReadTimeSeq / 30.0f) * timemulti) + "us");
  Serial.println("Memory Write Time Seq: " + String(((float)WriteTimeSeq / 30.0f) * timemulti) + "us");

  Serial.println("Memory Address Time: " + String(((float)AddressTime / 30.0f) * timemulti) + "us");
  Serial.println("Memory Address Time Seq: " + String(((float)AddressTimeSeq / 30.0f) * timemulti) + "us");
  
  while(true)
  {
    uint8_t val = 0;
    bool failed = false;
    for(uint32_t i = 0; i < 0x80000; i++)
    {
      SPIRAMWrite(i, val);
      uint8_t value = SPIRAMRead(i);
  
      if(value != val)
      {
        Serial.println("Memory Check Failed at :" + String(i, DEC) + " W: " + String(val, DEC) + " R: " + String(value, DEC));
        Serial.flush();
        failed = true;
        break;
      }
      SPIRAMWrite(i, 0);
      val++;
    }
    
    if(!failed)
    {
      Serial.println("Ram Test: Passed");
      break;
    }
  
    delay(1000);
  }
  
  Serial.println("Init Complete");
  Serial.println("Emulation Starting..");
}

void loop()
{
  GBAEmulator.Update();
}



