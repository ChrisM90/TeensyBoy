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

#ifndef ArmCore_h
#define ArmCore_h

#include <inttypes.h>

#define COND_EQ 0   // Z set
#define COND_NE 1   // Z clear
#define COND_CS 2   // C set
#define COND_CC 3   // C clear
#define COND_MI 4   // N set
#define COND_PL 5   // N clear
#define COND_VS 6   // V set
#define COND_VC 7   // V clear
#define COND_HI 8   // C set and Z clear
#define COND_LS 9   // C clear or Z set
#define COND_GE 10  // N equals V
#define COND_LT 11  // N not equal to V
#define COND_GT 12  // Z clear AND (N equals V)
#define COND_LE 13  // Z set OR (N not equal to V)
#define COND_AL 14  // Always
#define COND_NV 15  // Never execute

#define OP_AND 0x0
#define OP_EOR 0x1
#define OP_SUB 0x2
#define OP_RSB 0x3
#define OP_ADD 0x4
#define OP_ADC 0x5
#define OP_SBC 0x6
#define OP_RSC 0x7
#define OP_TST 0x8
#define OP_TEQ 0x9
#define OP_CMP 0xA
#define OP_CMN 0xB
#define OP_ORR 0xC
#define OP_MOV 0xD
#define OP_BIC 0xE
#define OP_MVN 0xF

class ArmCore
{
  public:
    //Variables
    uint32_t instructionQueue = 0;
    uint32_t curInstruction = 0;
    uint32_t zero;
    uint32_t carry;
    uint32_t negative;
    uint32_t overFlow;
    uint32_t shifterCarry;
    bool thumbMode;
  
    //Methods
    ArmCore();
    ArmCore(class Processor *par);
    void BeginExecution();
    void Execute();
    void NormalOps(uint8_t index);
    uint32_t BarrelShifter(uint32_t shifterOperand);
    void OverflowCarryAdd(uint32_t a, uint32_t b, uint32_t r);
    void OverflowCarrySub(uint32_t a, uint32_t b, uint32_t r);
    void DoDataProcessing(uint32_t shifterOperand);
    void DataProcessing();
    void DataProcessingImmed();
    void LoadStore(uint32_t offSet);
    void LoadStoreImmediate();
    void LoadStoreRegister();
    void LoadStoreMultiple();
    void Branch();
    void CoprocessorLoadStore();
    void SoftwareInterrupt();
    void MultiplyOrSwap();
    void LoadStoreHalfword();
    void PackFlags();
    void UnpackFlags();
    void FlushQueue();
};

#endif





