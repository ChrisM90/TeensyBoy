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

#ifndef Arm7_h
#define Arm7_h

#include <inttypes.h>
#include <Arduino.h>

#define REG_BASE 0x4000000
#define PAL_BASE 0x5000000
#define VRAM_BASE 0x6000000
#define OAM_BASE 0x7000000

#define DISPSTAT 0x4
#define VCOUNT 0x6

#define BG0CNT 0x8
#define BG1CNT 0xA
#define BG2CNT 0xC
#define BG3CNT 0xE

#define BG0HOFS 0x10
#define BG0VOFS 0x12
#define BG1HOFS 0x14
#define BG1VOFS 0x16
#define BG2HOFS 0x18
#define BG2VOFS 0x1A
#define BG3HOFS 0x1C
#define BG3VOFS 0x1E

#define BG2PA 0x20
#define BG2PB 0x22
#define BG2PC 0x24
#define BG2PD 0x26
#define BG2X_L 0x28
#define BG2X_H 0x2A
#define BG2Y_L 0x2C
#define BG2Y_H 0x2E
#define BG3PA 0x30
#define BG3PB 0x32
#define BG3PC 0x34
#define BG3PD 0x36
#define BG3X_L 0x38
#define BG3X_H 0x3A
#define BG3Y_L 0x3C
#define BG3Y_H 0x3E

#define BLDCNT 0x50
#define BLDALPHA 0x52
#define BLDY 0x54

#define SOUNDCNT_L 0x80
#define SOUNDCNT_H 0x82
#define SOUNDCNT_X 0x84

#define FIFO_A_L 0xA0
#define FIFO_A_H 0xA2
#define FIFO_B_L 0xA4
#define FIFO_B_H 0xA6

#define DMA0SAD 0xB0
#define DMA0DAD 0xB4
#define DMA0CNT_L 0xB8
#define DMA0CNT_H 0xBA
#define DMA1SAD 0xBC
#define DMA1DAD 0xC0
#define DMA1CNT_L 0xC4
#define DMA1CNT_H 0xC6
#define DMA2SAD 0xC8
#define DMA2DAD 0xCC
#define DMA2CNT_L 0xD0
#define DMA2CNT_H 0xD2
#define DMA3SAD 0xD4
#define DMA3DAD 0xD8
#define DMA3CNT_L 0xDC
#define DMA3CNT_H 0xDE

#define TM0D 0x100
#define TM0CNT 0x102
#define TM1D 0x104
#define TM1CNT 0x106
#define TM2D 0x108
#define TM2CNT 0x10A
#define TM3D 0x10C
#define TM3CNT 0x10E

#define KEYINPUT 0x130
#define KEYCNT 0x132
#define IE0 0x200
#define IF 0x202
#define IME 0x208

#define HALTCNT 0x300

#define biosRamMask 0x3FFF //BIOS ROM 16KB
#define ewRamMask 0x3FFFF  //External Work Ram 256KB
#define iwRamMask 0x7FFF   //Internal MCU Memory 32KB
#define ioRegMask 0x4FF    //IO RAM 1KB 
#define vRamMask 0x1FFFF   //Video RAM 96KB
#define palRamMask 0x3FF   //Palettes RAM 1KB
#define oamRamMask 0x3FF   //Object Attribute RAM 1KB
#define sRamMask 0xFFFF    //Cartridge RAM 64KB
#define eeMask 0xFFFF

#define ewRamStart  0x00000000 //0x00000 - 0x3FFFF = 0x3FFFF
#define iwRamStart  0x00040000 //0x40000 - 0x47FFF = 0x7FFF
#define ioRegStart  0x00048000 //0x48000 - 0x484FF = 0x4FF
#define vRamStart   0x00048500 //0x48500 - 0x684FF = 0x1FFFF
#define palRamStart 0x00068500 //0x68500 - 0x688FF = 0x3FF
#define oamRamStart 0x00068900 //0x68900 - 0x68CFF = 0x3FF
#define sRamStart   0x00068D00 //0x68D00 - 0x78CFF = 0xFFFF
#define eeStart     0x00078D00 //0x78D00 - 0x88CFF = 0xFFFF

class Processor
{
  public:
    //Variables
    //CPSR Bit Definitions
    uint32_t N_BIT = 31;
    uint32_t Z_BIT = 30;
    uint32_t C_BIT = 29;
    uint32_t V_BIT = 28;
    uint32_t I_BIT = 7;
    uint32_t F_BIT = 6;
    uint32_t T_BIT = 5;
    
    uint32_t N_MASK = (1 << N_BIT);
    uint32_t Z_MASK = (1 << Z_BIT);
    uint32_t C_MASK = (1 << C_BIT);
    uint32_t V_MASK = (1 << V_BIT);
    uint32_t I_MASK = (1 << I_BIT);
    uint32_t F_MASK = (1 << F_BIT);
    uint32_t T_MASK = (1 << T_BIT);

    int32_t Cycles = 0;
    int32_t timerCycles = 0;
    int32_t soundCycles = 0;
    uint32_t registers[16];
    uint32_t cpsr = 0;
    uint32_t waitCycles = 0;
    int32_t bgx[2];
    int32_t bgy[2];
    bool cpuHalted = false;
    uint8_t OAMRAM[0x3FF];
    uint8_t IOREG[0x4FF];
    uint16_t keyState = 0x3FF;

    //Methods
    Processor();
    void Print(const char* value, uint32_t v);
    void CreateCores(class Processor *par, class File *rom, bool SkipBios);
    bool ArmState();
    bool SPSRExists();
    uint32_t GetWaitCycles();
    uint32_t GetSPSR();
    void SetSPSR(uint32_t value);
    void SwapRegsHelper(uint32_t swapRegs[]);
    void SwapRegisters(uint32_t bank);
    void WriteCpsr(uint32_t newCpsr);
    void EnterException(uint32_t mode, uint32_t vector, bool interruptDisabled, bool fiqDisabled);
    void RequestIrq(uint16_t irq);
    void FireIrq();
    void Reset(bool skipBios);
    void Halt();
    void ReloadQueue();
    void UpdateTimer(uint16_t timer, uint32_t cycles, bool countUp);
    void UpdateTimers();
    void UpdateKeyState();
    void UpdateSound();
    void Execute(int cycles);

    void Reset();
    
    void HBlankDma();
    void VBlankDma();
    void FifoDma(uint8_t channel);
    void DmaTransfer(uint8_t channel);
    void WriteDmaControl(uint8_t channel);
    void WriteTimerControl(uint32_t timer, uint32_t newCnt);
    
    uint8_t ReadU8(uint32_t address, uint32_t RAMRange);
    uint16_t ReadU16(uint32_t address, uint32_t RAMRange);
    uint32_t ReadU32(uint32_t address, uint32_t RAMRange);
    
    void WriteU8(uint32_t address, uint32_t RAMRange, uint8_t value);
    void WriteU16(uint32_t address, uint32_t RAMRange, uint16_t value);
    void WriteU32(uint32_t address, uint32_t RAMRange, uint32_t value);
    
    uint32_t ReadUnreadable();
    uint8_t ReadNop8(uint32_t address);
    uint16_t ReadNop16(uint32_t address);
    uint32_t ReadNop32(uint32_t address);
    uint8_t  ReadBIOS8(uint32_t address);
    uint16_t ReadBIOS16(uint32_t address);
    uint32_t ReadBIOS32(uint32_t address);
    uint8_t ReadEwRam8(uint32_t address);
    uint16_t ReadEwRam16(uint32_t address);
    uint32_t ReadEwRam32(uint32_t address);
    uint8_t ReadIwRam8(uint32_t address);
    uint16_t ReadIwRam16(uint32_t address);
    uint32_t ReadIwRam32(uint32_t address);
    uint8_t ReadIO8(uint32_t address);
    uint16_t ReadIO16(uint32_t address);
    uint32_t ReadIO32(uint32_t address);
    uint8_t ReadPalRam8(uint32_t address);
    uint16_t ReadPalRam16(uint32_t address);
    uint32_t ReadPalRam32(uint32_t address);
    uint8_t ReadVRam8(uint32_t address);
    uint16_t ReadVRam16(uint32_t address);
    uint32_t ReadVRam32(uint32_t address);
    uint8_t ReadOamRam8(uint32_t address);
    uint16_t ReadOamRam16(uint32_t address);
    uint32_t ReadOamRam32(uint32_t address);
    uint8_t  ReadROM8(uint32_t address, uint8_t bank);
    uint16_t ReadROM16(uint32_t address, uint8_t bank);
    uint32_t ReadROM32(uint32_t address, uint8_t bank);
    uint8_t ReadSRam8(uint32_t address);
    uint16_t ReadSRam16(uint32_t address);
    uint32_t ReadSRam32(uint32_t address);

    void WriteNop8(uint32_t address, uint8_t value);
    void WriteNop16(uint32_t address, uint16_t value);
    void WriteNop32(uint32_t address, uint32_t value);
    void WriteEwRam8(uint32_t address, uint8_t value);
    void WriteEwRam16(uint32_t address, uint16_t value);
    void WriteEwRam32(uint32_t address, uint32_t value);
    void WriteIwRam8(uint32_t address, uint8_t value);
    void WriteIwRam16(uint32_t address, uint16_t value);
    void WriteIwRam32(uint32_t address, uint32_t value);
    void WriteIO8(uint32_t address, uint8_t value);
    void WriteIO16(uint32_t address, uint16_t value);
    void WriteIO32(uint32_t address, uint32_t value);
    void WritePalRam8(uint32_t address, uint8_t value);
    void WritePalRam16(uint32_t address, uint16_t value);
    void WritePalRam32(uint32_t address, uint32_t value);
    void WriteVRam8(uint32_t address, uint8_t value);
    void WriteVRam16(uint32_t address, uint16_t value);
    void WriteVRam32(uint32_t address, uint32_t value);
    void WriteOamRam8(uint32_t address, uint8_t value);
    void WriteOamRam16(uint32_t address, uint16_t value);
    void WriteOamRam32(uint32_t address, uint32_t value);
    void WriteSRam8(uint32_t address, uint8_t value);
    void WriteSRam16(uint32_t address, uint16_t value);
    void WriteSRam32(uint32_t address, uint32_t value);
    void WriteEeprom8(uint32_t address, uint8_t value);
    void WriteEeprom16(uint32_t address, uint16_t value);
    void WriteEeprom32(uint32_t address, uint32_t value);

    uint8_t ReadEeprom8(uint32_t address);
    uint16_t ReadEeprom16(uint32_t address);
    uint32_t ReadEeprom32(uint32_t address);

    void ShaderWritePalRam8(uint32_t address, uint8_t value);
    void ShaderWritePalRam16(uint32_t address, uint16_t value);
    void ShaderWritePalRam32(uint32_t address, uint32_t value);
    void ShaderWriteVRam8(uint32_t address, uint8_t value);
    void ShaderWriteVRam16(uint32_t address, uint16_t value);
    void ShaderWriteVRam32(uint32_t address, uint32_t value);

    uint8_t ReadU8(uint32_t address);
    uint16_t ReadU16(uint32_t address);
    uint32_t ReadU32(uint32_t address);
    uint32_t ReadU32Aligned(uint32_t address);
    uint16_t ReadU16Debug(uint32_t address);
    uint32_t ReadU32Debug(uint32_t address);

    void WriteU8(uint32_t address, uint8_t value);
    void WriteU16(uint32_t address, uint16_t value);
    void WriteU32(uint32_t address, uint32_t value);
    void WriteU8Debug(uint32_t address, uint8_t value);
    void WriteU16Debug(uint32_t address, uint16_t value);
    void WriteU32Debug(uint32_t address, uint32_t value);

    void LoadCartridge();
    void ResetRomBanks();
    
    uint8_t ReadU8Funcs(uint16_t bank, uint32_t address);
    uint16_t ReadU16Funcs(uint16_t bank, uint32_t address);
    uint32_t ReadU32Funcs(uint16_t bank, uint32_t address);

    void WriteU8Funcs(uint16_t bank, uint32_t address, uint8_t value);
    void WriteU16Funcs(uint16_t bank, uint32_t address, uint16_t value);
    void WriteU32Funcs(uint16_t bank, uint32_t address, uint32_t value);
};

#ifdef __cplusplus
extern "C" {
#endif

static inline void SetAddress(uint32_t value)
{
  //Pin assignments are going to have to change in order to acheive maximum speed...
  //Memory Address Time Ran: 0.42us
  //Memory Address Time Seq: 0.40us
  
  //           BITMASK       PORTSET       PORTCLR
  // ADD0 0   //(1 << 16)    GPIOB_PSOR    GPIOB_PCOR
  // ADD1 1   //(1 << 17)    GPIOB_PSOR    GPIOB_PCOR
  // ADD2 24  //(1 << 26)    GPIOE_PSOR    GPIOE_PCOR
  // ADD3 25  //(1 << 5)     GPIOA_PSOR    GPIOA_PCOR
  // ADD4 31  //(1 << 10)    GPIOB_PSOR    GPIOB_PCOR
  // ADD5 32  //(1 << 11)    GPIOB_PSOR    GPIOB_PCOR
  // ADD6 40  //(1 << 28)    GPIOA_PSOR    GPIOA_PCOR
  // ADD7 41  //(1 << 29)    GPIOA_PSOR    GPIOA_PCOR 
  // ADD8 42  //(1 << 26)    GPIOA_PSOR    GPIOA_PCOR 
  // ADD9 43  //(1 << 20)    GPIOB_PSOR    GPIOB_PCOR
  // ADD10 44 //(1 << 22)    GPIOB_PSOR    GPIOB_PCOR
  // ADD11 45 //(1 << 23)    GPIOB_PSOR    GPIOB_PCOR
  // ADD12 46 //(1 << 21)    GPIOB_PSOR    GPIOB_PCOR
  // ADD13 47 //(1 << 8)     GPIOD_PSOR    GPIOD_PCOR 
  // ADD14 48 //(1 << 9)     GPIOD_PSOR    GPIOD_PCOR 
  // ADD15 49 //(1 << 4)     GPIOB_PSOR    GPIOB_PCOR
  // ADD16 50 //(1 << 5)     GPIOB_PSOR    GPIOB_PCOR 
  // ADD17 51 //(1 << 14)    GPIOD_PSOR    GPIOD_PCOR
  // ADD18 52 //(1 << 13)    GPIOD_PSOR    GPIOD_PCOR

  //GPIOB
  //Bit   24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9  8  7  6  5  4  3  2  1  0
  //Pin   -  45 44 46 43 -  -  1  0  -  -  -  -  32 31 -  -  -  -  50 49 -  -  -  -
  //Add   -  11 10 12 9  -  -  1  0  -  -  -  -  5  4  -  -  -  -  16 15 -  -  -  -

  //GPIOA
  //Bit   32 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9  8  7  6  5  4  3  2  1  0
  //Pin   -  -  -  41 40 -  42 -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  25 -  -  -  -  -
  //Add   -  -  -  7  6  -  8  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  3  -  -  -  -  -

  //GPIOD
  //Bit   16 15 14 13 12 11 10 9  8  7  6  5  4  3  2  1  0
  //Pin   -  -  51 52 -  -  -  48 47 -  -  -  -  -  -  -  -
  //Add   -  -  17 18 -  -  -  14 13 -  -  -  -  -  -  -  -

  //GPIOE
  //Bit   32 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9  8  7  6  5  4  3  2  1  0
  //Pin   -  -  -  -  -  -  24 -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
  //Add   -  -  -  -  -  -  2  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -

  //---------------------------Port B--------------------------------//
  
  GPIOB_PCOR |= 12782640; //Clear Address Lines On Port B
  GPIOB_PSOR |= ((value & 0x03) << 16); //Set Address 0 & 1
  GPIOB_PSOR |= (((value >> 4) & 0x03) << 10); //Set Address 4 & 5
  GPIOB_PSOR |= (((value >> 10) & 0x03) << 22); //Set Address 10 & 11
  GPIOB_PSOR |= (((value >> 15) & 0x03) << 4); //Set Address 15 & 16

  if(((value >> 9) & 0x01)) //ADD9
  {
    GPIOB_PSOR = (1 << 20);
  }
  else
  {
    GPIOB_PCOR = (1 << 20);
  }

  if(((value >> 12) & 0x01)) //ADD12
  {
    GPIOB_PSOR = (1 << 21);
  }
  else
  {
    GPIOB_PCOR = (1 << 21);
  }
  
  //---------------------------Port A--------------------------------//

  GPIOA_PCOR |= 805306368; //Clear Address Lines On Port A
  GPIOA_PSOR |= (((value >> 6) & 0x03) << 28); //Set Address 6 & 7

  if(((value >> 3) & 0x01)) //ADD3
  {
    GPIOA_PSOR = (1 << 5);
  }
  else
  {
    GPIOA_PCOR = (1 << 5);
  }
    
  if(((value >> 8) & 0x01)) //ADD8
  {
    GPIOA_PSOR = (1 << 26);
  }
  else
  {
    GPIOA_PCOR = (1 << 26);
  }

  //---------------------------Port D--------------------------------//
  GPIOD_PCOR |= 3840; //Clear Address Lines On Port D
  GPIOD_PSOR |= (((value >> 13) & 0x03) << 8); //Set Address 13 & 14

  if(((value >> 17) & 0x01)) //ADD17
  {
    GPIOD_PSOR = (1 << 14);
  }
  else
  {
    GPIOD_PCOR = (1 << 14);
  }

  if(((value >> 18) & 0x01)) //ADD18
  {
    GPIOD_PSOR = (1 << 13);
  }
  else
  {
    GPIOD_PCOR = (1 << 13);
  }

  //---------------------------Port E--------------------------------//

  if(((value >> 2) & 0x01)) //ADD2
  {
    GPIOE_PSOR = (1 << 26);
  }
  else
  {
    GPIOE_PCOR = (1 << 26);
  }
}

static uint8_t AccessMode = 2;

static inline void SPIRAMWrite(uint32_t address, uint8_t value)
{
  SetAddress(address);
  
  GPIOB_PCOR = (1 << 18); //WE LOW
  GPIOB_PSOR = (1 << 19); //OE HIGH

  if(AccessMode != 1) //Write pinMode(OUTPUT);
  {
    *portModeRegister(2) = 1; //IO 0
    *portModeRegister(3) = 1; //IO 1
    *portModeRegister(4) = 1; //IO 2
    *portModeRegister(5) = 1; //IO 3
    *portModeRegister(6) = 1; //IO 4
    *portModeRegister(7) = 1; //IO 5
    *portModeRegister(8) = 1; //IO 6
    *portModeRegister(9) = 1; //IO 7
    AccessMode = 1;
  }

  if((value & 0x01)) //DIO0
  {
    GPIOD_PSOR = (1 << 0);
  }
  else
  {
    GPIOD_PCOR = (1 << 0);
  }

  GPIOA_PCOR |= 12288; //Clear PORTA Data Lines
  GPIOA_PSOR |= (((value >> 1) & 0x03) << 12); //DIO1 & DIO2

  if(((value >> 3) & 0x01)) //DIO3
  {
    GPIOD_PSOR = (1 << 7);
  }
  else
  {
    GPIOD_PCOR = (1 << 7);
  }

  if(((value >> 4) & 0x01)) //DIO4
  {
    GPIOD_PSOR = (1 << 4);
  }
  else
  {
    GPIOD_PCOR = (1 << 4);
  }

  GPIOD_PCOR |= 12; //Clear PORTD Data Lines
  GPIOD_PSOR |= (((value >> 5) & 0x03) << 2); //DIO5 & DIO6

  if(((value >> 7) & 0x01)) //DIO7
  {
    GPIOC_PSOR = (1 << 3);
  }
  else
  {
    GPIOC_PCOR = (1 << 3);
  }

  //Back to Read
  GPIOB_PSOR = (1 << 18); //WE HIGH
}

static inline uint8_t SPIRAMRead(uint32_t address)
{
  SetAddress(address);

  GPIOB_PSOR = (1 << 18); //WE HIGH
  GPIOB_PCOR = (1 << 19); //OE LOW

  uint8_t value;

  if(AccessMode != 0) //Read pinMode(INPUT);
  {
    *portModeRegister(2) = 0; //IO 0
    *portModeRegister(3) = 0; //IO 1
    *portModeRegister(4) = 0; //IO 2
    *portModeRegister(5) = 0; //IO 3
    *portModeRegister(6) = 0; //IO 4
    *portModeRegister(7) = 0; //IO 5
    *portModeRegister(8) = 0; //IO 6
    *portModeRegister(9) = 0; //IO 7
    AccessMode = 0;
  }

  //Read IO Pins
  value = (GPIOD_PDIR & (1 << 0) ? 1 : 0);            //DIO0
  value |= (((GPIOA_PDIR >> 12) & 0x03) << 1);        //DIO1 & DIO2
  value |= ((GPIOD_PDIR & (1 << 7) ? 1 : 0) << 3);    //DIO3
  value |= ((GPIOD_PDIR & (1 << 4) ? 1 : 0) << 4);    //DIO4
  value |= (((GPIOD_PDIR >> 2) & 0x03) << 5);         //DIO5 & DIO6
  value |= ((GPIOC_PDIR & (1 << 3) ? 1 : 0) << 7);    //DIO7
  
  return value;
}

#ifdef __cplusplus
}
#endif

#endif





