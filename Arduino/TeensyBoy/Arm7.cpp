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

#include <Arduino.h>
#include "Arm7.h"
#include "ArmCore.h"
#include "ThumbCore.h"
#include "Bios.h"
#include "SoundManager.h"
#include <SD.h>
#include <SD_t3.h>

//---------------------Memory----------------------------//
uint16_t keyState = 0x3FF;
bool inUnreadable = false;
uint32_t dmaRegs[4][4];
uint32_t timerCnt[4];

uint32_t romBank1Mask = 0;
uint32_t romBank2Mask = 0;
uint32_t bankSTimes[0x10];
uint32_t bankNTimes[0x10];
uint8_t RomBankCount = 0;

//-------------------------VGA--------------------------//

const uint8_t VramBlockSize = 64;
const uint8_t PalBlockSize = 32;
bool EnableVRUpdating = true;

//----------------------------CPU-----------------------//
//CPU Mode Definitions
const uint32_t USR = 0x10;
const uint32_t FIQ = 0x11;
const uint32_t IRQ = 0x12;
const uint32_t SVC = 0x13;
const uint32_t ABT = 0x17;
const uint32_t UND = 0x1B;
const uint32_t SYS = 0x1F;
    
//Bank Registers
uint32_t bankedFIQ[7];
uint32_t bankedIRQ[2];
uint32_t bankedSVC[2];
uint32_t bankedABT[2];
uint32_t bankedUND[2];

//Saved CPSR's
uint32_t spsrFIQ = 0;
uint32_t spsrIRQ = 0;
uint32_t spsrSVC = 0;
uint32_t spsrABT = 0;
uint32_t spsrUND = 0;

#define CE 28
#define WE 29
#define OE 30

#define DIO0 2 //D0
#define DIO1 3 //A12
#define DIO2 4 //A13
#define DIO3 5 //D7
#define DIO4 6 //D4
#define DIO5 7 //D2
#define DIO6 8 //D3
#define DIO7 9 //C3

#define ADD0 0   //B16
#define ADD1 1   //B17
#define ADD2 24  //E26
#define ADD3 25  //A5 
#define ADD4 31  //B10
#define ADD5 32  //B11
#define ADD6 40  //A28 
#define ADD7 41  //A29 
#define ADD8 42  //A26 
#define ADD9 43  //B20
#define ADD10 44 //B22
#define ADD11 45 //B23 
#define ADD12 46 //B21 
#define ADD13 47 //D8 
#define ADD14 48 //D9 
#define ADD15 49 //B4 
#define ADD16 50 //B5 
#define ADD17 51 //D14
#define ADD18 52 //D13

ArmCore armCore;
ThumbCore thumbCore;
SoundManager sound;
Processor *SelfReference;
File *ROM;

Processor::Processor()
{
  //Memory Data IO
  pinMode(DIO0, INPUT); //IO 0
  pinMode(DIO1, INPUT); //IO 1
  pinMode(DIO2, INPUT); //IO 2
  pinMode(DIO3, INPUT); //IO 3
  pinMode(DIO4, INPUT); //IO 4
  pinMode(DIO5, INPUT); //IO 5
  pinMode(DIO6, INPUT); //IO 6
  pinMode(DIO7, INPUT); //IO 7

  //Memory Control Default Read
  pinMode(CE, OUTPUT); //CE
  digitalWrite(CE, HIGH);
  pinMode(WE, OUTPUT); //WE
  digitalWrite(WE, HIGH);
  pinMode(OE, OUTPUT); //OE
  digitalWrite(OE, LOW);

  //Memory Address
  pinMode(ADD0, OUTPUT); //ADD 0
  pinMode(ADD1, OUTPUT); //ADD 1
  pinMode(ADD2, OUTPUT); //ADD 2
  pinMode(ADD3, OUTPUT); //ADD 3
  pinMode(ADD4, OUTPUT); //ADD 4
  pinMode(ADD5, OUTPUT); //ADD 5
  pinMode(ADD6, OUTPUT); //ADD 6
  pinMode(ADD7, OUTPUT); //ADD 7
  pinMode(ADD8, OUTPUT); //ADD 8
  pinMode(ADD9, OUTPUT); //ADD 9
  pinMode(ADD10, OUTPUT); //ADD 10
  pinMode(ADD11, OUTPUT); //ADD 11
  pinMode(ADD12, OUTPUT); //ADD 12
  pinMode(ADD13, OUTPUT); //ADD 13
  pinMode(ADD14, OUTPUT); //ADD 14
  pinMode(ADD15, OUTPUT); //ADD 15
  pinMode(ADD16, OUTPUT); //ADD 16
  pinMode(ADD17, OUTPUT); //ADD 17
  pinMode(ADD18, OUTPUT); //ADD 18

  digitalWrite(ADD0, LOW);
  digitalWrite(ADD1, LOW);
  digitalWrite(ADD2, LOW);
  digitalWrite(ADD3, LOW);
  digitalWrite(ADD4, LOW);
  digitalWrite(ADD5, LOW);
  digitalWrite(ADD6, LOW);
  digitalWrite(ADD7, LOW);
  digitalWrite(ADD8, LOW);
  digitalWrite(ADD9, LOW);
  digitalWrite(ADD10, LOW);
  digitalWrite(ADD11, LOW);
  digitalWrite(ADD12, LOW);
  digitalWrite(ADD13, LOW);
  digitalWrite(ADD14, LOW);
  digitalWrite(ADD15, LOW);
  digitalWrite(ADD16, LOW);
  digitalWrite(ADD17, LOW);
  digitalWrite(ADD18, LOW);
}

void Processor::CreateCores(class Processor *par, class File *rom)
{
  digitalWrite(CE, LOW);
  ROM = rom;
  SelfReference = par;
  armCore = ArmCore(SelfReference);
  thumbCore = ThumbCore(SelfReference);
  sound.StartSM(44100, SelfReference);
  LoadCartridge();

  Reset(false);
}

void Processor::Print(const char* value, uint32_t v)
{
  Serial.println(String(value) + " " + String(v, DEC));
}

bool Processor::ArmState()
{
  return (cpsr & T_MASK) != T_MASK;
}

bool Processor::SPSRExists()
{
  switch (cpsr & 0x1F)
  {
    case USR:
    case SYS:
      return false;
    case FIQ:
    case SVC:
    case ABT:
    case IRQ:
    case UND:
      return true;
    default:
      return false;
  }
}

uint32_t Processor::GetWaitCycles()
{
  uint32_t tmp = waitCycles;
  waitCycles = 0;
  return tmp;
}

uint32_t Processor::GetSPSR()
{
  switch (cpsr & 0x1f)
  {
    case USR:
    case SYS:
      return 0xFFFFFFFF;
    case FIQ:
      return spsrFIQ;
    case SVC:
      return spsrSVC;
    case ABT:
      return spsrABT;
    case IRQ:
      return spsrIRQ;
    case UND:
      return spsrUND;
    default:
      return 0; //Explode
  }
}

void Processor::SetSPSR(uint32_t value)
{
  switch (cpsr & 0x1f)
  {
    case USR:
    case SYS:
      break;
    case FIQ:
      spsrFIQ = value;
      break;
    case SVC:
      spsrSVC = value;
      break;
    case ABT:
      spsrABT = value;
      break;
    case IRQ:
      spsrIRQ = value;
      break;
    case UND:
      spsrUND = value;
      break;
  }
}

void Processor::SwapRegsHelper(uint32_t swapRegs[])
{
  uint8_t swapRegsLength = (sizeof(swapRegs)/sizeof(uint32_t));
  
  for(int32_t i = 14; i > (14 - swapRegsLength); i--)
  {
    uint32_t temp = registers[i];
    registers[i] = swapRegs[swapRegsLength - (14 -i) - 1];
    swapRegs[swapRegsLength - (14 - i) - 1] = temp;
  }
}

void Processor::SwapRegisters(uint32_t bank)
{
  switch (bank & 0x1F)
  {
    case FIQ:
      SwapRegsHelper(bankedFIQ);
      break;
    case SVC:
      SwapRegsHelper(bankedSVC);
      break;
    case ABT:
      SwapRegsHelper(bankedABT);
      break;
    case IRQ:
      SwapRegsHelper(bankedIRQ);
      break;
    case UND:
      SwapRegsHelper(bankedUND);
      break;
  }
}

void Processor::WriteCpsr(uint32_t newCpsr)
{
  if((newCpsr & 0x1F) != (cpsr & 0x1F))
  {
    //Swap out the old registers
    SwapRegisters(cpsr);
    //Swap in the new registers
    SwapRegisters(newCpsr);
  }

  cpsr = newCpsr;
}

void Processor::EnterException(uint32_t mode, uint32_t vector, bool interruptDisabled, bool fiqDisabled)
{
  uint32_t oldCpsr = cpsr;

  if((oldCpsr & T_MASK) != 0)
  {
    registers[15] += 2U;
  }

  //Clear T bit, and set mode
  uint32_t newCpsr = (oldCpsr & ~0x3FU) | mode;
  if(interruptDisabled) newCpsr |= 1 << 7;
  if(fiqDisabled) newCpsr |= 1 << 6;
  WriteCpsr(newCpsr);

  SetSPSR(oldCpsr);
  registers[14] = registers[15];
  registers[15] = vector;

  ReloadQueue();
}

void Processor::RequestIrq(uint16_t irq)
{
  uint16_t iflag = ReadU16(IF, ioRegStart);
  iflag |= (uint16_t)(1 << irq);
  WriteU16(IF, ioRegStart, iflag);
}

void Processor::FireIrq()
{
    uint16_t ime = ReadU16(IME, ioRegStart);
    uint16_t ie = ReadU16(IE0, ioRegStart);
    uint16_t iflag = ReadU16(IF, ioRegStart);

    if ((ie & (iflag)) != 0 && (ime & 1) != 0 && (cpsr & (1 << 7)) == 0)
    {
        // Off to the irq exception vector
        EnterException(IRQ, 0x18, true, false);
    }
}

void Processor::Reset(bool skipBios)
{
  //Default to ARM state
  cpuHalted = false;
  Cycles = 0;
  timerCycles = 0;
  soundCycles = 0;

  bankedSVC[0] = 0x03007FE0;
  bankedIRQ[0] = 0x03007FA0;

  cpsr = SYS;
  spsrSVC = cpsr;
  
  for(uint8_t i =0; i < 15; i++)
  {
    registers[i] = 0;
  }

  if(skipBios)
  {
    registers[15] = 0x8000000;
  }
  else
  {
    registers[15] = 0;
  }

  armCore.BeginExecution();
}

void Processor::Halt()
{
  cpuHalted = true;
  Cycles = 0;
}

void Processor::ReloadQueue()
{
  if((cpsr & T_MASK) == T_MASK)
  {
    thumbCore.BeginExecution();
  }
  else
  {
    armCore.BeginExecution();
  }
}

void Processor::UpdateTimer(uint16_t timer, uint32_t cycles, bool countUp)
{
  uint16_t control = ReadU16(TM0CNT + (uint32_t)(timer * 4), ioRegStart);

  // Make sure timer is enabled, or count up is disabled
  if ((control & (1 << 7)) == 0) return;
  if (!countUp && (control & (1 << 2)) != 0) return;

  if (!countUp)
  {
    switch (control & 3)
    {
      case 0: cycles *= 1 << 10; break;
      case 1: cycles *= 1 << 4; break;
      case 2: cycles *= 1 << 2; break;
      // Don't need to do anything for case 3
     }
  }

  timerCnt[timer] += (uint32_t)cycles;
  uint32_t timercnt = timerCnt[timer] >> 10;

  if (timercnt > 0xffff)
  {
    uint16_t soundCntX = ReadU16(SOUNDCNT_X, ioRegStart);
    if ((soundCntX & (1 << 7)) != 0)
    {
      uint16_t soundCntH = ReadU16(SOUNDCNT_H, ioRegStart);
      if (timer == ((soundCntH >> 10) & 1))
      {
         //FIFO A overflow
         sound.DequeueA();
         if (sound.soundQueueACount < 16)
         {
           FifoDma(1);
           // TODO
           if (sound.soundQueueACount < 16)
           {
          
           }
         }
       }
       if (timer == ((soundCntH >> 14) & 1))
       {
         //FIFO B overflow
         sound.DequeueB();
         if (sound.soundQueueBCount < 16)
         {
           FifoDma(2);
         }
       }
     }

     // Overflow, attempt to fire IRQ
     if ((control & (1 << 6)) != 0)
     {
       RequestIrq(3 + timer);
     }

     if (timer < 3)
     {
        uint16_t control2 = ReadU16(TM0CNT + (uint32_t)((timer + 1) * 4), ioRegStart);
        if ((control2 & (1 << 2)) != 0)
        {
            // Count-up
            UpdateTimer(timer + 1, (int32_t)((timercnt >> 16) << 10), true);
        }
      }

      // Reset the original value
      uint32_t count = ReadU16(TM0D + (uint32_t)(timer * 4), ioRegStart);
      timerCnt[timer] = count << 10;
   }
}

void Processor::UpdateTimers()
{
  int32_t cycles = timerCycles - Cycles;

  for(uint8_t i = 0; i < 4; i++)
  {
    UpdateTimer(i, cycles, false);
  }

  timerCycles = Cycles;
}

void Processor::UpdateKeyState()
{
  uint16_t KEYCNT0 = ReadU16Debug(REG_BASE + KEYCNT);

  if ((KEYCNT0 & (1 << 14)) != 0)
  {
    if ((KEYCNT0 & (1 << 15)) != 0)
    {
      KEYCNT0 &= 0x3FF;
      if (((~keyState) & KEYCNT0) == KEYCNT0)
      RequestIrq(12);
    }
    else
    {
      KEYCNT0 &= 0x3FF;
      if (((~keyState) & KEYCNT) != 0)
      RequestIrq(12);
    }
  }
}

void Processor::UpdateSound()
{
  sound.Mix(soundCycles);
  soundCycles = 0;
}

void Processor::Execute(int cycles)
{
  Cycles += cycles;
  timerCycles += cycles;
  soundCycles += cycles;

  if(cpuHalted)
  {
    uint16_t ie = ReadU16(IE0, ioRegStart);
    uint16_t iflag = ReadU16(IF, ioRegStart);

    if ((ie & iflag) != 0)
    {
      cpuHalted = false;
    }
    else
    {
      Cycles = 0;
      UpdateTimers();
      UpdateSound();
      return;
    }
  }
  
  while (Cycles > 0)
  {
    if ((cpsr & T_MASK) == T_MASK)
    {
      //Serial.println("Thumb Core Execute: " + String(Cycles, DEC));
      thumbCore.Execute();
    }
    else
    {
      //Serial.println("ARM Core Execute: " + String(Cycles, DEC));
      armCore.Execute();
    }

    UpdateTimers();
    UpdateSound();
  }
}

//--------------------------------------------------------Memory-----------------------------------------------------------------------//

void Processor::Reset()
{
  WriteU16(BG2PA, ioRegStart, 0x0100);
  WriteU16(BG2PD, ioRegStart, 0x0100);
  WriteU16(BG3PA, ioRegStart, 0x0100);
  WriteU16(BG3PD, ioRegStart, 0x0100);
}

void Processor::HBlankDma()
{
  for(uint8_t i = 0; i < 4; i++)
  {
    if(((dmaRegs[i][3] >> 12) & 0x3) == 2)
    {
      DmaTransfer(i);
    }
  }
}

void Processor::VBlankDma()
{
  for(uint8_t i = 0; i < 4; i++)
  {
    if(((dmaRegs[i][3] >> 12) & 0x3) == 1)
    {
      DmaTransfer(i);
    }
  }
}

void Processor::FifoDma(uint8_t channel)
{
  if(((dmaRegs[channel][3] >> 12) & 0x3) == 0x3)
  {
    DmaTransfer(channel);
  }
}

void Processor::DmaTransfer(uint8_t channel)
{
  if((dmaRegs[channel][3] & (1 << 15)) != 0)
  {
    bool wideTransfer = (dmaRegs[channel][3] & (1 << 10)) != 0;

    uint32_t srcDirection = 0;
    uint32_t destDirection = 0;
    bool reload = false;

    switch((dmaRegs[channel][3] >> 5) & 0x3)
    {
      case 0: destDirection = 1; break;
      case 1: destDirection = 0xFFFFFFFF; break;
      case 2: destDirection = 0; break;
      case 3: destDirection = 1; reload = true;  break;
    }

    switch ((dmaRegs[channel][3] >> 7) & 0x3)
    {
      case 0: srcDirection = 1; break;
      case 1: srcDirection = 0xFFFFFFFF; break;
      case 2: srcDirection = 0; break;
      case 3: if (channel == 3){ return; } //TODO
    }

    int32_t numElements = (int32_t)dmaRegs[channel][2];
    if(numElements == 0) 
    {
      numElements = 0x4000;
    }

    if(((dmaRegs[channel][3] >> 12) & 0x3) == 0x3)
    {
      //Sound FIFO mode
      wideTransfer = true;
      destDirection = 0;
      numElements = 4;
      reload = false;
    }

    if(wideTransfer)
    {
      srcDirection *= 4;
      destDirection *= 4;
      while(numElements-- >0)
      {
        WriteU32(dmaRegs[channel][1], ReadU32(dmaRegs[channel][0])); 
        dmaRegs[channel][1] += destDirection;
        dmaRegs[channel][0] += srcDirection;
      }
    }
    else
    {
      srcDirection *= 2;
      destDirection *= 2;
      while(numElements-- > 0)
      {
        WriteU16(dmaRegs[channel][1], ReadU16(dmaRegs[channel][0])); 
        dmaRegs[channel][1] += destDirection;
        dmaRegs[channel][0] += srcDirection;
      }
    }

    //If not a repeating DMA, them disable the DMA
    if((dmaRegs[channel][3] & (1 << 9)) == 0)
    {
      dmaRegs[channel][3] &= 0x7FFF;
    }
    else
    {
      // Reload dest and count
      switch (channel)
      {
        case 0:
          if (reload) 
          {
            dmaRegs[0][1] = ReadU32(DMA0DAD, ioRegStart) & 0x07FFFFFF;
          }
          dmaRegs[0][2] = ReadU16(DMA0CNT_L, ioRegStart);
          break;
        case 1:
          if (reload)
          {
            dmaRegs[1][1] = ReadU32(DMA1DAD, ioRegStart) & 0x07FFFFFF;
          }
          dmaRegs[1][2] = ReadU16(DMA1CNT_L, ioRegStart);
          break;
        case 2:
          if (reload)
          {
            dmaRegs[2][1] = ReadU32(DMA2DAD, ioRegStart) & 0x07FFFFFF;
          }
          dmaRegs[2][2] = ReadU16(DMA2CNT_L, ioRegStart);
          break;
        case 3:
          if (reload)
          {
            dmaRegs[3][1] = ReadU32(DMA3DAD, ioRegStart) & 0x0FFFFFFF;
          }
          dmaRegs[3][2] = ReadU16(DMA3CNT_L, ioRegStart);
          break;
      }
    }

    if((dmaRegs[channel][3] & (1 << 14)) != 0)
    {
      RequestIrq(8 + channel);
    }
  }
}

void Processor::WriteDmaControl(uint8_t channel)
{
  switch (channel)
  {
    case 0:
      if (((dmaRegs[0][3] ^ ReadU16(DMA0CNT_H, ioRegStart)) & (1 << 15)) == 0)
      {
        return;
      }
      dmaRegs[0][0] = ReadU32(DMA0SAD, ioRegStart) & 0x07FFFFFF;
      dmaRegs[0][1] = ReadU32(DMA0DAD, ioRegStart) & 0x07FFFFFF;
      dmaRegs[0][2] = ReadU16(DMA0CNT_L, ioRegStart);
      dmaRegs[0][3] = ReadU16(DMA0CNT_H, ioRegStart);
      break;
    case 1:
      if (((dmaRegs[1][3] ^ ReadU16(DMA1CNT_H, ioRegStart)) & (1 << 15)) == 0)
      {
        return;
      }
      dmaRegs[1][0] = ReadU32(DMA1SAD, ioRegStart) & 0x0FFFFFFF;
      dmaRegs[1][1] = ReadU32(DMA1DAD, ioRegStart) & 0x07FFFFFF;
      dmaRegs[1][2] = ReadU16(DMA1CNT_L, ioRegStart);
      dmaRegs[1][3] = ReadU16(DMA1CNT_H, ioRegStart);
      break;
    case 2:
      if (((dmaRegs[2][3] ^ ReadU16(DMA2CNT_H, ioRegStart)) & (1 << 15)) == 0)
      {
        return;
      }
      dmaRegs[2][0] = ReadU32(DMA2SAD, ioRegStart) & 0x0FFFFFFF;
      dmaRegs[2][1] = ReadU32(DMA2DAD, ioRegStart) & 0x07FFFFFF;
      dmaRegs[2][2] = ReadU16(DMA2CNT_L, ioRegStart);
      dmaRegs[2][3] = ReadU16(DMA2CNT_H, ioRegStart);
      break;
    case 3:
      if (((dmaRegs[3][3] ^ ReadU16(DMA3CNT_H, ioRegStart)) & (1 << 15)) == 0)
      {
        return;
      }
      dmaRegs[3][0] = ReadU32(DMA3SAD, ioRegStart) & 0x0FFFFFFF;
      dmaRegs[3][1] = ReadU32(DMA3DAD, ioRegStart) & 0x0FFFFFFF;
      dmaRegs[3][2] = ReadU16(DMA3CNT_L, ioRegStart);
      dmaRegs[3][3] = ReadU16(DMA3CNT_H, ioRegStart);
      break;
   }

   switch((dmaRegs[channel][3] >> 12) & 0x3)
   {
      case 0:
        DmaTransfer(channel);
        break;
      case 1:
      case 2:
        //Hblank and Vblank DMA's
        break;
      case 3:
        //TODO (DMA Sound)
        return;
   }
}

void Processor::WriteTimerControl(uint32_t timer, uint32_t newCnt)
{
  uint16_t control = ReadU16(TM0CNT + (uint32_t)(timer * 4), ioRegStart);
  uint32_t count = ReadU16(TM0D + (uint32_t)(timer * 4), ioRegStart);

  if((newCnt & (1 <<7)) != 0 && (control & (1 << 7)) == 0)
  {
    timerCnt[timer] = count << 10;
  }
}

uint8_t Processor::ReadU8(uint32_t address, uint32_t RAMRange)
{
  uint8_t tmp;
  
  if(RAMRange == oamRamStart)
  {
    tmp = OAMRAM[address];
  }
  else if(RAMRange == ioRegStart)
  {
    tmp = IOREG[address];
  }
  else
  {
    tmp = SPIRAMRead(RAMRange + address);
  }

  return tmp;
}

uint16_t Processor::ReadU16(uint32_t address, uint32_t RAMRange)
{
  uint16_t tmp;
  
  if(RAMRange == oamRamStart)
  {
    tmp = (uint16_t)(OAMRAM[address] | (OAMRAM[address + 1] << 8));
  }
  else if(RAMRange == ioRegStart)
  {
    tmp = (uint16_t)(IOREG[address] | (IOREG[address + 1] << 8));
  }
  else
  {
    tmp = (uint16_t)(SPIRAMRead(RAMRange + address) | (SPIRAMRead(RAMRange + address + 1) << 8));
  }
  
  return tmp;
}

uint32_t Processor::ReadU32(uint32_t address, uint32_t RAMRange)
{
  uint32_t tmp;
  
  if(RAMRange == oamRamStart)
  {
    tmp = (uint32_t)(OAMRAM[address] | (OAMRAM[address + 1] << 8) | (OAMRAM[address + 2] << 16) | (OAMRAM[address + 3] << 24));
  }
  else if(RAMRange == ioRegStart)
  {
    tmp = (uint32_t)(IOREG[address] | (IOREG[address + 1] << 8) | (IOREG[address + 2] << 16) | (IOREG[address + 3] << 24));
  }
  else
  {
    tmp =  (uint32_t)(SPIRAMRead(RAMRange + address) | (SPIRAMRead(RAMRange + address + 1) << 8) | (SPIRAMRead(RAMRange + address + 2) << 16) | (SPIRAMRead(RAMRange + address + 3) << 24));
  }
   
  return tmp;
}

void Processor::WriteU8(uint32_t address, uint32_t RAMRange, uint8_t value)
{
  if(RAMRange == oamRamStart)
  {
    OAMRAM[address] = value;
  }
  else if(RAMRange == ioRegStart)
  {
    IOREG[address] = value;
  }
  else
  {
    SPIRAMWrite((RAMRange + address), value);
  }
}

void Processor::WriteU16(uint32_t address, uint32_t RAMRange, uint16_t value)
{
  if(RAMRange == oamRamStart)
  {
    OAMRAM[address] = (uint8_t)(value & 0xFF);
    OAMRAM[address + 1] = (uint8_t)(value >> 8);
  }
  else if(RAMRange == ioRegStart)
  {
    IOREG[address] = (uint8_t)(value & 0xFF);
    IOREG[address + 1] = (uint8_t)((value >> 8) & 0xFF);
  }
  else
  {
    SPIRAMWrite((RAMRange + address), (uint8_t)(value & 0xFF));
    SPIRAMWrite((RAMRange + address) + 1, (uint8_t)(value >> 8));
  }
}

void Processor::WriteU32(uint32_t address, uint32_t RAMRange, uint32_t value)
{
  if(RAMRange == oamRamStart)
  {
    OAMRAM[address] = (uint8_t)(value & 0xFF);
    OAMRAM[address + 1] = (uint8_t)((value >> 8) & 0xFF);
    OAMRAM[address + 2] = (uint8_t)((value >> 16) & 0xFF);
    OAMRAM[address + 3] = (uint8_t)(value >> 24);
  }
  else if(RAMRange == ioRegStart)
  {
    IOREG[address] = (uint8_t)(value & 0xFF);
    IOREG[address + 1] = (uint8_t)((value >> 8) & 0xFF);
    IOREG[address + 2] = (uint8_t)((value >> 16) & 0xFF);
    IOREG[address + 3] = (uint8_t)(value >> 24);
  }
  else
  {
    SPIRAMWrite((RAMRange + address), (uint8_t)(value & 0xFF));
    SPIRAMWrite((RAMRange + address) + 1, (uint8_t)((value >> 8) & 0xFF));
    SPIRAMWrite((RAMRange + address) + 2, (uint8_t)((value >> 16) & 0xFF));
    SPIRAMWrite((RAMRange + address) + 3, (uint8_t)((value >> 24) & 0xFF));
  }
}

uint32_t Processor::ReadUnreadable()
{
  if(inUnreadable)
  {
    return 0;
  }

  inUnreadable = true;

  uint32_t res;

  if(ArmState())
  {
    res = ReadU32(registers[15]);
  }
  else
  {
    uint16_t val = ReadU16(registers[15]);
    res = (uint32_t)(val | (val << 16));
  }

  inUnreadable = false;

  return res;
}

uint8_t Processor::ReadNop8(uint32_t address)
{
  return (uint8_t)ReadUnreadable() & 0xFF;
}

uint16_t Processor::ReadNop16(uint32_t address)
{
  return (uint16_t)ReadUnreadable() & 0xFFFF;
}

uint32_t Processor::ReadNop32(uint32_t address)
{
  return ReadUnreadable();
}

uint8_t Processor::ReadBIOS8(uint32_t address)
{
  waitCycles++;
  
  if(registers[15] < 0x01000000)
  {
    return BIOS[address & biosRamMask];
  }
  
  return (uint8_t)(ReadUnreadable() & 0xFF);
}

uint16_t Processor::ReadBIOS16(uint32_t address)
{
  waitCycles++;
  if(registers[15] < 0x01000000)
  {
    return (uint16_t)(BIOS[address & biosRamMask] | (BIOS[(address & biosRamMask) + 1] << 8));
  }

  return (uint16_t)(ReadUnreadable() & 0xFFFF);
}

uint32_t Processor::ReadBIOS32(uint32_t address)
{
  waitCycles++;
  if(registers[15] < 0x01000000)
  {
    return (uint32_t)(BIOS[address & biosRamMask] | (BIOS[(address & biosRamMask) + 1] << 8) | (BIOS[(address & biosRamMask) + 2] << 16) | (BIOS[(address & biosRamMask) + 3] << 24));
  }

  return ReadUnreadable();
}

uint8_t Processor::ReadEwRam8(uint32_t address)
{
  waitCycles += 3;
  address = (address & ewRamMask);
  return SPIRAMRead(ewRamStart + address);
}

uint16_t Processor::ReadEwRam16(uint32_t address)
{
  waitCycles += 3;
  address = (address & ewRamMask);
  return ReadU16(address, ewRamStart);
}

uint32_t Processor::ReadEwRam32(uint32_t address)
{
  waitCycles += 6;
  address = (address & ewRamMask);
  return ReadU32(address, ewRamStart);
}

uint8_t Processor::ReadIwRam8(uint32_t address)
{
  waitCycles++;
  address = (address & iwRamMask);
  return SPIRAMRead(iwRamStart + address);
}

uint16_t Processor::ReadIwRam16(uint32_t address)
{
  waitCycles++;
  address = (address & iwRamMask);
  return ReadU16(address, iwRamStart);
}

uint32_t Processor::ReadIwRam32(uint32_t address)
{
  waitCycles++;
  address = (address & iwRamMask);
  return ReadU32(address, iwRamStart);
}

uint8_t Processor::ReadIO8(uint32_t address)
{
  waitCycles++;
  address &= 0xFFFFFF;

  if(address >= ioRegMask) return 0;

  switch (address)
  {
    case KEYINPUT:
      return (uint8_t)(keyState & 0xFF);
    case KEYINPUT + 1:
      return (uint8_t)(keyState >> 8);

    case DMA0CNT_H:
      return (uint8_t)(dmaRegs[0][3] & 0xFF);
    case DMA0CNT_H + 1:
      return (uint8_t)(dmaRegs[0][3] >> 8);
    case DMA1CNT_H:
      return (uint8_t)(dmaRegs[1][3] & 0xFF);
    case DMA1CNT_H + 1:
      return (uint8_t)(dmaRegs[1][3] >> 8);
    case DMA2CNT_H:
      return (uint8_t)(dmaRegs[2][3] & 0xFF);
    case DMA2CNT_H + 1:
      return (uint8_t)(dmaRegs[2][3] >> 8);
    case DMA3CNT_H:
      return (uint8_t)(dmaRegs[3][3] & 0xFF);
    case DMA3CNT_H + 1:
      return (uint8_t)(dmaRegs[3][3] >> 8);

    case TM0D:
      UpdateTimers();
      return (uint8_t)((timerCnt[0] >> 10) & 0xFF);
    case TM0D + 1:
      UpdateTimers();
      return (uint8_t)((timerCnt[0] >> 10) >> 8);
    case TM1D:
      UpdateTimers();
      return (uint8_t)((timerCnt[1] >> 10) & 0xFF);
    case TM1D + 1:
      UpdateTimers();
      return (uint8_t)((timerCnt[1] >> 10) >> 8);
    case TM2D:
      UpdateTimers();
      return (uint8_t)((timerCnt[2] >> 10) & 0xFF);
    case TM2D + 1:
      UpdateTimers();
      return (uint8_t)((timerCnt[2] >> 10) >> 8);
    case TM3D:
      UpdateTimers();
      return (uint8_t)((timerCnt[3] >> 10) & 0xFF);
    case TM3D + 1:
      UpdateTimers();
      return (uint8_t)((timerCnt[3] >> 10) >> 8);

    default:
      return IOREG[address];
  }
}

uint16_t Processor::ReadIO16(uint32_t address)
{
  waitCycles++;
  address &= 0xFFFFFF;

  if(address >= ioRegMask) return 0;

  switch (address)
  {
    case KEYINPUT:
      return keyState;
    case DMA0CNT_H:
      return (uint16_t)dmaRegs[0][3];
    case DMA1CNT_H:
      return (uint16_t)dmaRegs[1][3];
    case DMA2CNT_H:
      return (uint16_t)dmaRegs[2][3];
    case DMA3CNT_H:
      return (uint16_t)dmaRegs[3][3];

    case TM0D:
      UpdateTimers();
      return (uint16_t)((timerCnt[0] >> 10) & 0xFFFF);
    case TM1D:
      UpdateTimers();
      return (uint16_t)((timerCnt[1] >> 10) & 0xFFFF);
    case TM2D:
      UpdateTimers();
      return (uint16_t)((timerCnt[2] >> 10) & 0xFFFF);
    case TM3D:
      UpdateTimers();
      return (uint16_t)((timerCnt[3] >> 10) & 0xFFFF);

    default:
      return ReadU16(address, ioRegStart);
  }
}

uint32_t Processor::ReadIO32(uint32_t address)
{
  waitCycles++;
  address &= 0xFFFFFF;
  
  if(address >= ioRegMask) return 0;

  switch (address)
  {
    case KEYINPUT:
      return keyState | ((uint32_t)ReadU16(address + 0x2, ioRegStart) << 16);
    case DMA0CNT_L:
      return (uint32_t)ReadU16(address, ioRegStart) | (dmaRegs[0][3] << 16);
    case DMA1CNT_L:
      return (uint32_t)ReadU16(address, ioRegStart) | (dmaRegs[1][3] << 16);
    case DMA2CNT_L:
      return (uint32_t)ReadU16(address, ioRegStart) | (dmaRegs[2][3] << 16);
    case DMA3CNT_L:
      return (uint32_t)ReadU16(address, ioRegStart) | (dmaRegs[3][3] << 16);

    case TM0D:
      UpdateTimers();
      return (uint32_t)(((timerCnt[0] >> 10) & 0xFFFF) | (uint32_t)(ReadU16(address + 2, ioRegStart) << 16));
    case TM1D:
      UpdateTimers();
      return (uint32_t)(((timerCnt[1] >> 10) & 0xFFFF) | (uint32_t)(ReadU16(address + 2, ioRegStart) << 16));
    case TM2D:
      UpdateTimers();
      return (uint32_t)(((timerCnt[2] >> 10) & 0xFFFF) | (uint32_t)(ReadU16(address + 2, ioRegStart) << 16));
    case TM3D:
      UpdateTimers();
      return (uint32_t)(((timerCnt[3] >> 10) & 0xFFFF) | (uint32_t)(ReadU16(address + 2, ioRegStart) << 16));

    default:
      return ReadU32(address, ioRegStart);
  }
}

uint8_t Processor::ReadPalRam8(uint32_t address)
{
  waitCycles++;
  address = (address & palRamMask);
  return SPIRAMRead(palRamStart + address);
}

uint16_t Processor::ReadPalRam16(uint32_t address)
{
  waitCycles++;
  address = (address & palRamMask);
  return ReadU16(address, palRamStart);
}

uint32_t Processor::ReadPalRam32(uint32_t address)
{
  waitCycles += 2;
  address = (address & palRamMask);
  return ReadU32(address, palRamStart);
}

uint8_t Processor::ReadVRam8(uint32_t address)
{
  waitCycles++;
  address &= vRamMask;
  if (address > 0x17FFF) address = 0x10000 + ((address - 0x17FFF) & 0x7FFF);
  return SPIRAMRead(vRamStart + address);
}

uint16_t Processor::ReadVRam16(uint32_t address)
{
  waitCycles++;
  address &= vRamMask;
  if (address > 0x17FFF) address = 0x10000 + ((address - 0x17FFF) & 0x7FFF);
  return ReadU16(address, vRamStart);
}

uint32_t Processor::ReadVRam32(uint32_t address)
{
  waitCycles += 2;
  address = (address & vRamMask);
  if (address > 0x17FFF) address = 0x10000 + ((address - 0x17FFF) & 0x7FFF);
  return ReadU32(address, vRamStart);
}

uint8_t Processor::ReadOamRam8(uint32_t address)
{
  waitCycles++;
  address = (address & oamRamMask);
  return OAMRAM[address];
}

uint16_t Processor::ReadOamRam16(uint32_t address)
{
  waitCycles++;
  address = (address & oamRamMask);
  return ReadU16(address, oamRamStart);
}

uint32_t Processor::ReadOamRam32(uint32_t address)
{
  waitCycles += 2;
  address = (address & oamRamMask);
  return ReadU32(address, oamRamStart);
}

uint8_t Processor::ReadROM8(uint32_t address, uint8_t bank)
{
  waitCycles += bankSTimes[(address >> 24) & 0xF];
  
  if(bank == 1)
  {
    address = (address & romBank1Mask);
  }
  else if(bank == 2)
  {
    address = (address & romBank2Mask) + romBank1Mask;
  }
  
  ROM->seek(address);
  uint8_t tmp =  ROM->read();
  Serial.println("ROM 8 Address: " + String((bank == 2 ? address - romBank1Mask : address), DEC) + " Value: " + String(tmp, DEC) + " Bank: " + String(bank, DEC));
  Serial.flush();
  return tmp;
}

uint16_t Processor::ReadROM16(uint32_t address, uint8_t bank)
{
  waitCycles += bankSTimes[(address >> 24) & 0xF];

  if(bank == 1)
  {
    address = (address & romBank1Mask);
  }
  else if(bank == 2)
  {
    address = (address & romBank2Mask) + romBank1Mask;
  }
  
  ROM->seek(address);
  uint16_t tmp = (uint16_t)(ROM->read() | (ROM->read() << 8));
  Serial.println("ROM 16 Address: " + String((bank == 2 ? address - romBank1Mask : address), DEC) + " Value: " + String(tmp, DEC) + " Bank: " + String(bank, DEC));
  Serial.flush();
  return tmp;
}

uint32_t Processor::ReadROM32(uint32_t address, uint8_t bank)
{
  waitCycles += (bankSTimes[(address >> 24) & 0xF] * 2) + 1;

  if(bank == 1)
  {
    address = (address & romBank1Mask);
  }
  else if(bank == 2)
  {
    address = (address & romBank2Mask) + romBank1Mask;
  }
  
  ROM->seek(address);
  uint32_t tmp = (uint32_t)(ROM->read() | (ROM->read() << 8) | (ROM->read() << 16) | (ROM->read() << 24));
  Serial.println("ROM 32 Address: " + String((bank == 2 ? address - romBank1Mask : address), DEC) + " Value: " + String(tmp, DEC) + " Bank: " + String(bank, DEC));
  Serial.flush();
  return tmp;
}

uint8_t Processor::ReadSRam8(uint32_t address)
{
  address = (address & sRamMask);
  return SPIRAMRead(sRamStart + address);
}

uint16_t Processor::ReadSRam16(uint32_t address)
{
  address = (address & sRamMask);
  return ReadU16(address, sRamStart);
}

uint32_t Processor::ReadSRam32(uint32_t address)
{
  address = (address & sRamMask);
  return ReadU32(address, sRamStart);
}

void Processor::WriteNop8(uint32_t address, uint8_t value)
{

}

void Processor::WriteNop16(uint32_t address, uint16_t value)
{

}

void Processor::WriteNop32(uint32_t address, uint32_t value)
{

}

void Processor::WriteEwRam8(uint32_t address, uint8_t value)
{
  waitCycles += 3;
  address = (address & ewRamMask);
  SPIRAMWrite((ewRamStart + address), value);
}

void Processor::WriteEwRam16(uint32_t address, uint16_t value)
{
  waitCycles += 3;
  address = (address & ewRamMask);
  WriteU16(address, ewRamStart, value);
}

void Processor::WriteEwRam32(uint32_t address, uint32_t value)
{
  waitCycles += 6;
  address = (address & ewRamMask);
  WriteU32(address, ewRamStart, value);
}

void Processor::WriteIwRam8(uint32_t address, uint8_t value)
{
  waitCycles++;
  address = (address & iwRamMask);
  SPIRAMWrite((iwRamStart + address), value);
}

void Processor::WriteIwRam16(uint32_t address, uint16_t value)
{
  waitCycles++;
  address = (address & iwRamMask);
  WriteU16(address, iwRamStart, value);
}

void Processor::WriteIwRam32(uint32_t address, uint32_t value)
{
  waitCycles++;
  address = (address & iwRamMask);
  WriteU32(address, iwRamStart, value);
}

void Processor::WriteIO8(uint32_t address, uint8_t value)
{
  waitCycles++;
  address &= 0xFFFFFF;
  
  if(address >= ioRegMask) return;

  switch (address)
  {
    case BG2X_L:
    case BG2X_L + 1:
    case BG2X_L + 2:
    case BG2X_L + 3:
      {
        IOREG[address] = value;
        uint32_t tmp = ReadU32(BG2X_L, ioRegStart);
        if ((tmp & (1 << 27)) != 0) tmp |= 0xF0000000;
        WriteU32(BG2X_L, ioRegStart, tmp);

        bgx[0] = (int32_t)tmp;
      }
      break;

    case BG3X_L:
    case BG3X_L + 1:
    case BG3X_L + 2:
    case BG3X_L + 3:
      {
        IOREG[address] = value;
        uint32_t tmp = ReadU32(BG3X_L, ioRegStart);
        if ((tmp & (1 << 27)) != 0) tmp |= 0xF0000000;
        WriteU32(BG3X_L, ioRegStart, tmp);

        bgx[1] = (int32_t)tmp;
      }
      break;

    case BG2Y_L:
    case BG2Y_L + 1:
    case BG2Y_L + 2:
    case BG2Y_L + 3:
      {
        IOREG[address] = value;
        uint32_t tmp = ReadU32(BG2Y_L, ioRegStart);
        if ((tmp & (1 << 27)) != 0) tmp |= 0xF0000000;
        WriteU32(BG2Y_L, ioRegStart, tmp);

        bgy[0] = (int32_t)tmp;
      }
      break;

    case BG3Y_L:
    case BG3Y_L + 1:
    case BG3Y_L + 2:
    case BG3Y_L + 3:
      {
        IOREG[address] = value;
        uint32_t tmp = ReadU32(BG3Y_L, ioRegStart);
        if ((tmp & (1 << 27)) != 0) tmp |= 0xF0000000;
        WriteU32(BG3Y_L, ioRegStart, tmp);
        
        bgy[1] = (int32_t)tmp;
      }
      break;

    case DMA0CNT_H:
    case DMA0CNT_H + 1:
        IOREG[address] = value;
        WriteDmaControl(0);
        break;

    case DMA1CNT_H:
    case DMA1CNT_H + 1:
        IOREG[address] = value;
        WriteDmaControl(1);
        break;

    case DMA2CNT_H:
    case DMA2CNT_H + 1:
        IOREG[address] = value;
        WriteDmaControl(2);
        break;

    case DMA3CNT_H:
    case DMA3CNT_H + 1:
        IOREG[address] = value;
        WriteDmaControl(3);
        break;

    case TM0CNT:
    case TM0CNT + 1:
      {
        uint16_t oldCnt = ReadU16(TM0CNT, ioRegStart);
        IOREG[address] = value;
        WriteTimerControl(0, oldCnt);
      }
      break;

    case TM1CNT:
    case TM1CNT + 1:
      {
        uint16_t oldCnt = ReadU16(TM1CNT, ioRegStart);
        IOREG[address] = value;
        WriteTimerControl(1, oldCnt);
      }
      break;

    case TM2CNT:
    case TM2CNT + 1:
      {
        uint16_t oldCnt = ReadU16(TM2CNT, ioRegStart);
        IOREG[address] = value;
        WriteTimerControl(2, oldCnt);
      }
      break;

    case TM3CNT:
    case TM3CNT + 1:
      {
        uint16_t oldCnt = ReadU16(TM3CNT, ioRegStart);
        IOREG[address] = value;
        WriteTimerControl(3, oldCnt);
      }
      break;

    case FIFO_A_L:
    case FIFO_A_L + 1:
    case FIFO_A_H:
    case FIFO_A_H + 1:
      {
        IOREG[address] = value;
        sound.IncrementFifoA();
      }
      break;

    case FIFO_B_L:
    case FIFO_B_L + 1:
    case FIFO_B_H:
    case FIFO_B_H + 1:
      {
        IOREG[address] = value;
        sound.IncrementFifoB();
      }
      break;

    case IF:
    case IF + 1:
      {
        IOREG[address] &= (uint8_t)~value;
      }
      break;

    case HALTCNT + 1:
      {
        IOREG[address] = value;
        Halt();
      }
      break;

    default:
      IOREG[address] = value;
      break;
  }
}

void Processor::WriteIO16(uint32_t address, uint16_t value)
{
  waitCycles++;
  address &= 0xFFFFFF;

  if(address >= ioRegMask) return;

  switch (address)
  {
    case BG2X_L:
    case BG2X_L + 2:
      {
        WriteU16(address, ioRegStart, value);
        uint32_t tmp = ReadU32(BG2X_L, ioRegStart);
        if ((tmp & (1 << 27)) != 0) tmp |= 0xF0000000;
        WriteU32(BG2X_L, ioRegStart, tmp);

        bgx[0] = (int32_t)tmp;
      }
      break;

    case BG3X_L:
    case BG3X_L + 2:
      {
        WriteU16(address, ioRegStart, value);
        uint32_t tmp = ReadU32(BG3X_L, ioRegStart);
        if ((tmp & (1 << 27)) != 0) tmp |= 0xF0000000;
        WriteU32(BG3X_L, ioRegStart, tmp);

        bgx[1] = (int32_t)tmp;
      }
      break;

    case BG2Y_L:
    case BG2Y_L + 2:
      {
        WriteU16(address, ioRegStart, value);
        uint32_t tmp = ReadU32(BG2Y_L, ioRegStart);
        if ((tmp & (1 << 27)) != 0) tmp |= 0xF0000000;
        WriteU32(BG2Y_L, ioRegStart, tmp);

        bgy[0] = (int32_t)tmp;
      }
      break;

    case BG3Y_L:
    case BG3Y_L + 2:
      {
        WriteU16(address, ioRegStart, value);
        uint32_t tmp = ReadU32(BG3Y_L, ioRegStart);
        if ((tmp & (1 << 27)) != 0) tmp |= 0xF0000000;
        WriteU32(BG3Y_L, ioRegStart, tmp);

        bgy[1] = (int32_t)tmp;
      }
      break;

    case DMA0CNT_H:
        WriteU16(address, ioRegStart, value);
        WriteDmaControl(0);
        break;

    case DMA1CNT_H:
        WriteU16(address, ioRegStart, value);
        WriteDmaControl(1);
        break;

    case DMA2CNT_H:
        WriteU16(address, ioRegStart, value);
        WriteDmaControl(2);
        break;

    case DMA3CNT_H:
        WriteU16(address, ioRegStart, value);
        WriteDmaControl(3);
        break;

    case TM0CNT:
      {
        uint16_t oldCnt = ReadU16(TM0CNT, ioRegStart);
        WriteU16(address, ioRegStart, value);
        WriteTimerControl(0, oldCnt);
      }
      break;

    case TM1CNT:
      {
        uint16_t oldCnt = ReadU16(TM1CNT, ioRegStart);
        WriteU16(address, ioRegStart, value);
        WriteTimerControl(1, oldCnt);
      }
      break;

    case TM2CNT:
      {
        uint16_t oldCnt = ReadU16(TM2CNT, ioRegStart);
        WriteU16(address, ioRegStart, value);
        WriteTimerControl(2, oldCnt);
      }
      break;

    case TM3CNT:
      {
        uint16_t oldCnt = ReadU16(TM3CNT, ioRegStart);
        WriteU16(address, ioRegStart, value);
        WriteTimerControl(3, oldCnt);
      }
      break;

    case FIFO_A_L:
    case FIFO_A_H:
      {
        WriteU16(address, ioRegStart, value);
        sound.IncrementFifoA();
      }
      break;

    case FIFO_B_L:
    case FIFO_B_H:
      {
        WriteU16(address, ioRegStart, value);
        sound.IncrementFifoB();
      }
      break;

    case SOUNDCNT_H:
      {
        WriteU16(address, ioRegStart, value);

        if ((value & (1 << 11)) != 0)
        {
          sound.ResetFifoA();
        }
        if ((value & (1 << 15)) != 0)
        {
          sound.ResetFifoB();
        }
      }

    case IF:
      {
        uint16_t tmp = ReadU16(address, ioRegStart);
        WriteU16(address, ioRegStart, (uint16_t)(tmp & (~value)));
      }
      break;

    case HALTCNT:
      {
        WriteU16(address, ioRegStart, value);      
        Halt();
      }
      break;

    default:
      WriteU16(address, ioRegStart, value); 
      break;
  }
}

void Processor::WriteIO32(uint32_t address, uint32_t value)
{
  waitCycles++;
  address &= 0xFFFFFF;

  if(address >= ioRegMask) return;
  
  switch (address)
  {
    case BG2X_L:
      {
        WriteU32(address, ioRegStart, value);
        uint32_t tmp = ReadU32(BG2X_L, ioRegStart);
        if ((tmp & (1 << 27)) != 0) tmp |= 0xF0000000;
        WriteU32(BG2X_L, ioRegStart, tmp);

        bgx[0] = (int32_t)tmp;
      }
      break;

    case BG3X_L:
      {
        WriteU32(address, ioRegStart, value);
        uint32_t tmp = ReadU32(BG3X_L, ioRegStart);
        if ((tmp & (1 << 27)) != 0) tmp |= 0xF0000000;
        WriteU32(BG3X_L, ioRegStart, tmp);

        bgx[1] = (int32_t)tmp;
      }
      break;

    case BG2Y_L:
      {
        WriteU32(address, ioRegStart, value);
        uint32_t tmp = ReadU32(BG2Y_L, ioRegStart);
        if ((tmp & (1 << 27)) != 0) tmp |= 0xF0000000;
        WriteU32(BG2Y_L, ioRegStart, tmp);

        bgy[0] = (int32_t)tmp;
      }
      break;

    case BG3Y_L:
      {
        WriteU32(address, ioRegStart, value);
        uint32_t tmp = ReadU32(BG3Y_L, ioRegStart);
        if ((tmp & (1 << 27)) != 0) tmp |= 0xF0000000;
        WriteU32(BG3Y_L, ioRegStart, tmp);

        bgy[1] = (int32_t)tmp;
      }
      break;

    case DMA0CNT_L:
        WriteU32(address, ioRegStart, value);
        WriteDmaControl(0);
        break;

    case DMA1CNT_L:
        WriteU32(address, ioRegStart, value);
        WriteDmaControl(1);
        break;

    case DMA2CNT_L:
        WriteU32(address, ioRegStart, value);
        WriteDmaControl(2);
        break;

    case DMA3CNT_L:
        WriteU32(address, ioRegStart, value);
        WriteDmaControl(3);
        break;

    case TM0D:
      {
        uint16_t oldCnt = ReadU16(TM0CNT, ioRegStart);
        WriteU32(address, ioRegStart, value);
        WriteTimerControl(0, oldCnt);
      }
      break;

    case TM1D:
      {
        uint16_t oldCnt = ReadU16(TM1CNT, ioRegStart);
        WriteU32(address, ioRegStart, value);
        WriteTimerControl(1, oldCnt);
      }
      break;

    case TM2D:
      {
        uint16_t oldCnt = ReadU16(TM2CNT, ioRegStart);
        WriteU32(address, ioRegStart, value);
        WriteTimerControl(2, oldCnt);
      }
      break;

    case TM3D:
      {
        uint16_t oldCnt = ReadU16(TM3CNT, ioRegStart);
        WriteU32(address, ioRegStart, value);
        WriteTimerControl(3, oldCnt);
      }
      break;

    case FIFO_A_L:
      {
        WriteU32(address, ioRegStart, value);
        sound.IncrementFifoA();
      }
      break;

    case FIFO_B_L:
      {
        WriteU32(address, ioRegStart, value);
        sound.IncrementFifoB();
      }
      break;

    case SOUNDCNT_L:
      {
        WriteU32(address, ioRegStart, value);

        if (((value >> 16) & (1 << 11)) != 0)
        {
          sound.ResetFifoA();
        }
        if (((value >> 16) & (1 << 15)) != 0)
        {
          sound.ResetFifoB();
        }
      }
      break;

    case IE0:
      {
        uint32_t tmp = ReadU32(address, ioRegStart);
        uint32_t res = (uint32_t)((value & 0xFFFF) | (tmp & (~(value & 0xFFFF0000))));
        WriteU32(address, ioRegStart, res);
      }
      break;

    case HALTCNT:
      {
        WriteU32(address, ioRegStart, value);
        Halt();
      }
      break;

    default:
      WriteU32(address, ioRegStart, value);
      break;
  }
}

void Processor::WritePalRam8(uint32_t address, uint8_t value)
{
  waitCycles++;
  address &= palRamMask & ~1U;
  SPIRAMWrite((palRamStart + address), value);
  SPIRAMWrite((palRamStart + address) + 1, value);
}

void Processor::WritePalRam16(uint32_t address, uint16_t value)
{
  waitCycles++;
  address = (address & palRamMask);
  WriteU16(address, palRamStart, value);
}

void Processor::WritePalRam32(uint32_t address, uint32_t value)
{
  waitCycles += 2;
  address = (address & palRamMask);
  WriteU32(address, palRamStart, value);
}

void Processor::WriteVRam8(uint32_t address, uint8_t value)
{
  waitCycles++;
  address &= vRamMask & ~1U;
  if (address > 0x17FFF) address = 0x10000 + ((address - 0x17FFF) & 0x7FFF);
  SPIRAMWrite((vRamStart + address), value);
  SPIRAMWrite((vRamStart + address) + 1, value);
}

void Processor::WriteVRam16(uint32_t address, uint16_t value)
{
  waitCycles++;
  address = (address & vRamMask);
  if (address > 0x17FFF) address = 0x10000 + ((address - 0x17FFF) & 0x7FFF);
  WriteU16(address, vRamStart, value);
}

void Processor::WriteVRam32(uint32_t address, uint32_t value)
{
  waitCycles += 2;
  address &= vRamMask;
  if (address > 0x17FFF) address = 0x10000 + ((address - 0x17FFF) & 0x7FFF);
  WriteU32(address, vRamStart, value);
}

void Processor::WriteOamRam8(uint32_t address, uint8_t value)
{
  waitCycles++;
  address &= oamRamMask & ~1U;
  OAMRAM[address] = value;
  OAMRAM[address + 1] = value;
}

void Processor::WriteOamRam16(uint32_t address, uint16_t value)
{
  waitCycles++;
  address = (address & oamRamMask);
  WriteU16(address, oamRamStart, value);
}

void Processor::WriteOamRam32(uint32_t address, uint32_t value)
{
  waitCycles++;
  address = (address & oamRamMask);
  WriteU32(address, oamRamStart, value);
}

void Processor::WriteSRam8(uint32_t address, uint8_t value)
{
  address = (address & sRamMask);
  SPIRAMWrite((sRamStart + address), value);
}

void Processor::WriteSRam16(uint32_t address, uint16_t value)
{
  //TODO
}

void Processor::WriteSRam32(uint32_t address, uint32_t value)
{
  //TODO
}

uint32_t curEepromByte;
int32_t eepromReadAddress = -1;
uint8_t eepromMode = 0; //idle = 0, readdata = 1
uint8_t eepromStore[0xFF];

void Processor::WriteEeprom8(uint32_t address, uint8_t value)
{
  //EEPROM writes must be done my DMA 3
  if((dmaRegs[3][3] & (1 << 15)) == 0) return;

  if(dmaRegs[3][2] == 0) return;

  if(eepromMode != 1)
  {
    curEepromByte = 0;
    eepromMode = 1;
    eepromReadAddress = -1;

    for(uint8_t i = 0; i < (sizeof(curEepromByte)/sizeof(uint8_t)); i++)
    {
      eepromStore[i] = 0;
    }
  }

  eepromStore[curEepromByte >> 3] |= (uint8_t)(value << (7 - (curEepromByte & 0x7)));
  curEepromByte++;

  if(curEepromByte == dmaRegs[3][2])
  {
    if((eepromStore[0] & 0x80) == 0)
    {
      return;
    }

    if((eepromStore[0] & 0x40) != 0)
    {
      //Read Request
      if(curEepromByte == 9)
      {
        eepromReadAddress = eepromStore[0] & 0x3F;
      }
      else
      {
        eepromReadAddress = ((eepromStore[0] & 0x3F) << 8) | eepromStore[1];
      }

      curEepromByte = 0;
    }
    else
    {
      //Write Request
      uint32_t eepromAddress;
      uint32_t offSet;

      if(curEepromByte == 64 + 9)
      {
        eepromAddress = (int32_t)(eepromStore[0] & 0x3F);
        offSet = 1;
      }
      else
      {
        eepromAddress = ((eepromStore[0] & 0x3F) << 8) | eepromStore[1];
        offSet = 2;
      }

      for(uint8_t i = 0; i < 8; i++)
      {
        SPIRAMWrite((eeStart + ((eepromAddress * (8 + i)))), (eepromStore[i + offSet]));
      }

      eepromMode = 0; //Idle
    }
  }
}

void Processor::WriteEeprom16(uint32_t address, uint16_t value)
{
  WriteEeprom8(address, (uint8_t)(value & 0xFF));
}

void Processor::WriteEeprom32(uint32_t address, uint32_t value)
{
  WriteEeprom8(address, (uint8_t)(value & 0xFF));
}

uint8_t Processor::ReadEeprom8(uint32_t address)
{
  if (eepromReadAddress == -1) return 1;

  uint8_t retval = 0;

  if (curEepromByte >= 4)
  {
    retval = SPIRAMRead(eeStart + (eepromReadAddress * 8 + ((curEepromByte - 4) / 8)));
    retval = (uint8_t)((retval >> (7 - ((curEepromByte - 4) & 7))) & 1);
  }

  curEepromByte++;

  if (curEepromByte == dmaRegs[3][2])
  {
    eepromReadAddress = -1;
    eepromMode = 0; //Idle
  }

  return retval;
}

uint16_t Processor::ReadEeprom16(uint32_t address)
{
  return (uint16_t)ReadEeprom8(address);
}

uint32_t Processor::ReadEeprom32(uint32_t address)
{
  return (uint32_t)ReadEeprom8(address);
}

void Processor::ShaderWritePalRam8(uint32_t address, uint8_t value)
{
  waitCycles++;
  address &= palRamMask & ~1U;
  WriteU8(address, palRamStart, value);
  WriteU8(address + 1, palRamStart, value);
}

void Processor::ShaderWritePalRam16(uint32_t address, uint16_t value)
{
  waitCycles++;
  WriteU16(address & palRamMask, palRamStart, value);
}

void Processor::ShaderWritePalRam32(uint32_t address, uint32_t value)
{
  waitCycles+=2;
  WriteU32(address & palRamMask, palRamStart, value);
}

void Processor::ShaderWriteVRam8(uint32_t address, uint8_t value)
{
  waitCycles++;
  address &= vRamMask & ~1U;
  if (address > 0x17FFF) address = 0x10000 + ((address - 0x17FFF) & 0x7FFF);
  WriteU8(address, vRamStart, value);
  WriteU8(address + 1, vRamStart, value);
}

void Processor::ShaderWriteVRam16(uint32_t address, uint16_t value)
{
  waitCycles++;
  address &= vRamMask;
  if (address > 0x17FFF) address = 0x10000 + ((address - 0x17FFF) & 0x7FFF);
  WriteU16(address, vRamStart, value);
}

void Processor::ShaderWriteVRam32(uint32_t address, uint32_t value)
{
  waitCycles += 2;
  address &= vRamMask;
  if (address > 0x17FFF) address = 0x10000 + ((address - 0x17FFF) & 0x7FFF);
  WriteU32(address, vRamStart, value);
}

uint8_t Processor::ReadU8(uint32_t address)
{
  uint16_t bank = (address >> 24) & 0xf;
  return ReadU8Funcs(bank, address);
}

uint16_t Processor::ReadU16(uint32_t address)
{
  address &= ~1;
  uint16_t bank = (address >> 24) & 0xf;
  return ReadU16Funcs(bank, address);
}

 uint32_t Processor::ReadU32(uint32_t address)
{
  uint32_t shiftAmt = (int)((address & 3U) << 3);
  address &= ~3;
  uint16_t bank = (address >> 24) & 0xf;
  uint32_t res = ReadU32Funcs(bank, address);
  return (res >> shiftAmt) | (res << (32 - shiftAmt));
}

uint32_t Processor::ReadU32Aligned(uint32_t address)
{
  uint16_t bank = (address >> 24) & 0xf;
  return ReadU32Funcs(bank, address);
}

uint16_t Processor::ReadU16Debug(uint32_t address)
{
  address &= ~1;
  uint16_t bank = (address >> 24) & 0xf;
  uint32_t oldWaitCycles = waitCycles;
  uint16_t res = ReadU16Funcs(bank, address);
  waitCycles = oldWaitCycles;
  return res;
}

uint32_t Processor::ReadU32Debug(uint32_t address)
{
  int32_t shiftAmt = (int)((address & 3) << 3);
  address &= ~3;
  uint16_t bank = (address >> 24) & 0xf;
  uint32_t oldWaitCycles = waitCycles;
  uint32_t res = ReadU32Funcs(bank, address);
  waitCycles = oldWaitCycles;
  uint32_t tmp = (res >> shiftAmt) | (res << (32 - shiftAmt));
  return tmp;
}

void Processor::WriteU8(uint32_t address, uint8_t value)
{
  uint16_t bank = (address >> 24) & 0xf;
  WriteU8Funcs(bank, address, value);
}

void Processor::WriteU16(uint32_t address, uint16_t value)
{
  address &= ~1U;
  uint16_t bank = (address >> 24) & 0xf;
  WriteU16Funcs(bank, address, value);
}

void Processor::WriteU32(uint32_t address, uint32_t value)
{
  address &= ~3U;
  uint16_t bank = (address >> 24) & 0xf;
  WriteU32Funcs(bank, address, value);
}

void Processor::WriteU8Debug(uint32_t address, uint8_t value)
{
  uint16_t bank = (address >> 24) & 0xf;
  uint32_t oldWaitCycles = waitCycles;
  WriteU8Funcs(bank, address, value);
  waitCycles = oldWaitCycles;
}

void Processor::WriteU16Debug(uint32_t address, uint16_t value)
{
  address &= ~1U;
  uint16_t bank = (address >> 24) & 0xf;
  uint32_t oldWaitCycles = waitCycles;
  WriteU16Funcs(bank, address, value);
  waitCycles = oldWaitCycles;
}

void Processor::WriteU32Debug(uint32_t address, uint32_t value)
{
  address &= ~3U;
  uint16_t bank = (address >> 24) & 0xf;
  uint32_t oldWaitCycles = waitCycles;
  WriteU32Funcs(bank, address, value);
  waitCycles = oldWaitCycles;
}

void Processor::LoadCartridge()
{
  ResetRomBanks();
  
  uint64_t ROMSize = ROM->size();
  uint64_t cartSize = 1;

  while(cartSize < ROMSize)
  {
    cartSize <<= 1;
  }

  if(cartSize != ROMSize) //ROM size has to be a power of 2
  {
    return;
  }

  if (cartSize > (1 << 24)) //Two Banks
  {
    romBank1Mask = (1 << 24) - 1;
    romBank2Mask = (1 << 24) - 1;
  }
  else //1 Bank 
  {
    romBank1Mask = (uint32_t)(cartSize - 1);
  }

  if(romBank1Mask != 0)
  {
    RomBankCount = 1;
  }

  if(romBank2Mask != 0)
  {
    RomBankCount = 2;
  }

  //Address Bytes Expl.
  //000h    4     ROM Entry Point  (32bit ARM branch opcode, eg. "B rom_start")
  //004h    156   Nintendo Logo    (compressed bitmap, required!)
  //0A0h    12    Game Title       (uppercase ascii, max 12 characters)
  //0ACh    4     Game Code        (uppercase ascii, 4 characters)
  //0B0h    2     Maker Code       (uppercase ascii, 2 characters)
  //0B2h    1     Fixed value      (must be 96h, required!)
  //0B3h    1     Main unit code   (00h for current GBA models)
  //0B4h    1     Device type      (usually 00h)
  //0B5h    7     Reserved Area    (should be zero filled)
  //0BCh    1     Software version (usually 00h)
  //0BDh    1     Complement check (header checksum, required!)
  //0BEh    2     Reserved Area    (should be zero filled)
  //--- Additional Multiboot Header Entries ---
  //0C0h    4     RAM Entry Point  (32bit ARM branch opcode, eg. "B ram_start")
  //0C4h    1     Boot mode        (init as 00h - BIOS overwrites this value!)
  //0C5h    1     Slave ID Number  (init as 00h - BIOS overwrites this value!)
  //0C6h    26    Not used         (seems to be unused)
  //0E0h    4     JOYBUS Entry Pt. (32bit ARM branch opcode, eg. "B joy_start")
}

void Processor::ResetRomBanks()
{
  romBank1Mask = 0;
  romBank2Mask = 0;
    
  for(uint8_t i = 0; i < (sizeof(bankSTimes)/sizeof(uint32_t)); i++)
  {
    bankSTimes[i] = 2;
  }

  RomBankCount = 0;
  RomBankCount = 0;
}

uint8_t Processor::ReadU8Funcs(uint16_t bank, uint32_t address)
{
  switch(bank)
  {
    case 0:
      return ReadBIOS8(address);
      break;
    case 1:
      return ReadNop8(address);
      break;
    case 2:
      return ReadEwRam8(address);
      break;
    case 3:
      return ReadIwRam8(address);
      break;
    case 4:
      return ReadIO8(address);
      break;
    case 5:
      return ReadPalRam8(address);
      break;
    case 6:
      return ReadVRam8(address);
      break;
    case 7:
      return ReadOamRam8(address);
      break;
    case 8: //0x8
      return RomBankCount == 0 ? ReadNop8(address) : ReadROM8(address, 1);
      break;
    case 9: //0x9
      return RomBankCount == 2 ? ReadROM8(address, 2) : ReadNop8(address);
      break;
    case 10:
      return ReadNop8(address);
      break;
    case 11: //0xA
      return RomBankCount == 0 ? ReadNop8(address) : ReadROM8(address, 1);
      break;
    case 12: //0xB
      return RomBankCount == 2 ? ReadROM8(address, 2) : ReadNop8(address);
      break;
    case 13: //0xC
      return RomBankCount == 0 ? ReadNop8(address) : ReadROM8(address, 1);
      break;
    case 14: //0xD
      return RomBankCount == 2 ? ReadROM8(address, 2) : ReadNop8(address);
      break;
    case 15:
      return ReadNop8(address);
      break;
    default:
      return 0;
  }
}

uint16_t Processor::ReadU16Funcs(uint16_t bank, uint32_t address)
{
  //Serial.println("ReadU16 Bank: " + String(bank, DEC) + " Address: " + String(address, DEC));
  switch(bank)
  {
    case 0:
      return ReadBIOS16(address);
      break;
    case 1:
      return ReadNop16(address);
      break;
    case 2:
      return ReadEwRam16(address);
      break;
    case 3:
      return ReadIwRam16(address);
      break;
    case 4:
      return ReadIO16(address);
      break;
    case 5:
      return ReadPalRam16(address);
      break;
    case 6:
      return ReadVRam16(address);
      break;
    case 7:
      return ReadOamRam16(address);
      break;
    case 8: //0x8
      return RomBankCount == 0 ? ReadNop16(address) : ReadROM16(address, 1);
      break;
    case 9: //0x9
      return RomBankCount == 2 ? ReadROM16(address, 2) : ReadNop16(address);
      break;
    case 10: 
      return ReadNop16(address);
      break;
    case 11: //0xA
      return RomBankCount == 0 ? ReadNop16(address) : ReadROM16(address, 1);
      break; 
    case 12: //0xB
      return RomBankCount == 2 ? ReadROM16(address, 2) : ReadNop16(address);
      break;
    case 13: //0xC
      return RomBankCount == 0 ? ReadNop16(address) : ReadROM16(address, 1);
      break;
    case 14: //0xD
      return RomBankCount == 2 ? ReadROM16(address, 2) : ReadNop16(address);
      break;
    case 15:
      return ReadNop16(address);
      break;
    default:
      return 0;
  }
}

uint32_t Processor::ReadU32Funcs(uint16_t bank, uint32_t address)
{
  switch(bank)
  {
    case 0:
      return ReadBIOS32(address);
      break;
    case 1:
      return ReadNop32(address);
      break;
    case 2:
      return ReadEwRam32(address);
      break;
    case 3:
      return ReadIwRam32(address);
      break;
    case 4:
      return ReadIO32(address);
      break;
    case 5:
      return ReadPalRam32(address);
      break;
    case 6:
      return ReadVRam32(address);
      break;
    case 7:
      return ReadOamRam32(address);
      break;
    case 8: //0x8
      return RomBankCount == 0 ? ReadNop32(address) : ReadROM32(address, 1);
      break;
    case 9: //0x9
      return RomBankCount == 2 ? ReadROM32(address, 2) : ReadNop32(address);
      break;
    case 10:
      return ReadNop32(address);
      break;
    case 11: //0xA
      return RomBankCount == 0 ? ReadNop32(address) : ReadROM32(address, 1);
      break;
    case 12: //0xB
      return RomBankCount == 2 ? ReadROM32(address, 2) : ReadNop32(address);
      break;
    case 13: //0xC
      return RomBankCount == 0 ? ReadNop32(address) : ReadROM32(address, 1);
      break;
    case 14: //0xD
      return RomBankCount == 2 ? ReadROM32(address, 2) : ReadNop32(address);
      break;
    case 15:
      return ReadNop32(address);
      break;
    default:
      return 0;
  }
}

void Processor::WriteU8Funcs(uint16_t bank, uint32_t address, uint8_t value)
{
  switch(bank)
  {
    case 0:
      WriteNop8(address, value);
      break;
    case 1:
      WriteNop8(address, value);
      break;
    case 2:
      WriteEwRam8(address, value);
      break;
    case 3:
      WriteIwRam8(address, value);
      break;
    case 4:
      WriteIO8(address, value);
      break;
    case 5:
      EnableVRUpdating ? ShaderWritePalRam8(address, value) : WritePalRam8(address, value);
      break;
    case 6:
      EnableVRUpdating ? ShaderWriteVRam8(address, value) : WriteVRam8(address, value);
      break;
    case 7:
      WriteOamRam8(address, value);
      break;
    case 8:
      WriteNop8(address, value);
      break;
    case 9:
      WriteNop8(address, value);
      break;
    case 10:
      WriteNop8(address, value);
      break;
    case 11:
      WriteNop8(address, value);
      break;
    case 12:
      WriteNop8(address, value);
      break;
    case 13:
      WriteNop8(address, value);
      break;
    case 14:
      WriteSRam8(address, value);
      break;
    case 15:
      WriteNop8(address, value);
      break;
  }
}

void Processor::WriteU16Funcs(uint16_t bank, uint32_t address, uint16_t value)
{
  switch(bank)
  {
    case 0:
      WriteNop16(address, value);
      break;
    case 1:
      WriteNop16(address, value);
      break;
    case 2:
      WriteEwRam16(address, value);
      break;
    case 3:
      WriteIwRam16(address, value);
      break;
    case 4:
      WriteIO16(address, value);
      break;
    case 5:
      EnableVRUpdating ? ShaderWritePalRam16(address, value) : WritePalRam16(address, value);
      break;
    case 6:
      EnableVRUpdating ? ShaderWriteVRam16(address, value) : WriteVRam16(address, value);
      break;
    case 7:
      WriteOamRam16(address, value);
      break;
    case 8:
      WriteNop16(address, value);
      break;
    case 9:
      WriteNop16(address, value);
      break;
    case 10:
      WriteNop16(address, value);
      break;
    case 11:
      WriteNop16(address, value);
      break;
    case 12:
      WriteNop16(address, value);
      break;
    case 13:
      WriteNop16(address, value);
      break;
    case 14:
      WriteSRam16(address, value);
      break;
    case 15:
      WriteNop16(address, value);
      break;
  }
}

void Processor::WriteU32Funcs(uint16_t bank, uint32_t address, uint32_t value)
{
  switch(bank)
  {
    case 0:
      WriteNop32(address, value);
      break;
    case 1:
      WriteNop32(address, value);
      break;
    case 2:
      WriteEwRam32(address, value);
      break;
    case 3:
      WriteIwRam32(address, value);
      break;
    case 4:
      WriteIO32(address, value);
      break;
    case 5:
      EnableVRUpdating ? ShaderWritePalRam32(address, value) : WritePalRam32(address, value);
      break;
    case 6:
      EnableVRUpdating ? ShaderWriteVRam32(address, value) : WriteVRam32(address, value);
      break;
    case 7:
      WriteOamRam32(address, value);
      break;
    case 8:
      WriteNop32(address, value);
      break;
    case 9:
      WriteNop32(address, value);
      break;
    case 10:
      WriteNop32(address, value);
      break;
    case 11:
      WriteNop32(address, value);
      break;
    case 12:
      WriteNop32(address, value);
      break;
    case 13:
      WriteNop32(address, value);
      break;
    case 14:
      WriteSRam32(address, value);
      break;
    case 15:
      WriteNop32(address, value);
      break;
  }
}

void Processor::SPIRAMWrite(uint32_t address, uint8_t value)
{
  SetAddress(address);
  
  //Start Write Cycle
  digitalWriteFast(CE, LOW);
  digitalWriteFast(WE, LOW);
  digitalWriteFast(OE, HIGH);
  
  pinMode(2, OUTPUT); //IO 0
  pinMode(3, OUTPUT); //IO 1
  pinMode(4, OUTPUT); //IO 2
  pinMode(5, OUTPUT); //IO 3
  pinMode(6, OUTPUT); //IO 4
  pinMode(7, OUTPUT); //IO 5
  pinMode(8, OUTPUT); //IO 6
  pinMode(9, OUTPUT); //IO 7
  
  //Write IO Pins
  digitalWriteFast(2, (value & 0x01));
  digitalWriteFast(3, ((value >> 1) & 0x01));
  digitalWriteFast(4, ((value >> 2) & 0x01));
  digitalWriteFast(5, ((value >> 3) & 0x01));
  digitalWriteFast(6, ((value >> 4) & 0x01));
  digitalWriteFast(7, ((value >> 5) & 0x01));
  digitalWriteFast(8, ((value >> 6) & 0x01));
  digitalWriteFast(9, ((value >> 7) & 0x01));

  //Back to Read
  digitalWriteFast(CE, LOW);
  digitalWriteFast(WE, HIGH);

  SetAddress(0);
  
  pinMode(2, INPUT); //IO 0
  pinMode(3, INPUT); //IO 1
  pinMode(4, INPUT); //IO 2
  pinMode(5, INPUT); //IO 3
  pinMode(6, INPUT); //IO 4
  pinMode(7, INPUT); //IO 5
  pinMode(8, INPUT); //IO 6
  pinMode(9, INPUT); //IO 7

  digitalWriteFast(OE, LOW);
}

uint8_t Processor::SPIRAMRead(uint32_t address)
{
  SetAddress(address);

  //Start Read Cycle
  digitalWriteFast(CE, LOW);
  digitalWriteFast(WE, HIGH);
  digitalWriteFast(OE, LOW);
  uint8_t value;
  
  pinMode(2, INPUT); //IO 0
  pinMode(3, INPUT); //IO 1
  pinMode(4, INPUT); //IO 2
  pinMode(5, INPUT); //IO 3
  pinMode(6, INPUT); //IO 4
  pinMode(7, INPUT); //IO 5
  pinMode(8, INPUT); //IO 6
  pinMode(9, INPUT); //IO 7

  //Read IO Pins
  value = digitalReadFast(2);
  value |= (digitalReadFast(3) << 1);
  value |= (digitalReadFast(4) << 2);
  value |= (digitalReadFast(5) << 3);
  value |= (digitalReadFast(6) << 4);
  value |= (digitalReadFast(7) << 5);
  value |= (digitalReadFast(8) << 6);
  value |= (digitalReadFast(9) << 7);
  
  //Back to Read
  digitalWriteFast(CE, LOW);
  digitalWriteFast(WE, HIGH);
  digitalWriteFast(OE, LOW);

  SetAddress(0);

  return value;
}

void Processor::SetAddress(uint32_t value)
{
  digitalWriteFast(ADD0, (value & 0x01));
  digitalWriteFast(ADD1, ((value >> 1) & 0x01));
  digitalWriteFast(ADD2, ((value >> 2) & 0x01));
  digitalWriteFast(ADD3, ((value >> 3) & 0x01));
  digitalWriteFast(ADD4, ((value >> 4) & 0x01));
  digitalWriteFast(ADD5, ((value >> 5) & 0x01));
  digitalWriteFast(ADD6, ((value >> 6) & 0x01));
  digitalWriteFast(ADD7, ((value >> 7) & 0x01));
  digitalWriteFast(ADD8, ((value >> 8) & 0x01));
  digitalWriteFast(ADD9, ((value >> 9) & 0x01));
  digitalWriteFast(ADD10, ((value >> 10) & 0x01));
  digitalWriteFast(ADD11, ((value >> 11) & 0x01));
  digitalWriteFast(ADD12, ((value >> 12) & 0x01));
  digitalWriteFast(ADD13, ((value >> 13) & 0x01));
  digitalWriteFast(ADD14, ((value >> 14) & 0x01));
  digitalWriteFast(ADD15, ((value >> 15) & 0x01));
  digitalWriteFast(ADD16, ((value >> 16) & 0x01));
  digitalWriteFast(ADD17, ((value >> 17) & 0x01));
  digitalWriteFast(ADD18, ((value >> 18) & 0x01));
}




