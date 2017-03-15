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

#ifndef ThumbCore_h
#define ThumbCore_h

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
#define OP_LSL 0x2
#define OP_LSR 0x3
#define OP_ASR 0x4
#define OP_ADC 0x5
#define OP_SBC 0x6
#define OP_ROR 0x7
#define OP_TST 0x8
#define OP_NEG 0x9
#define OP_CMP 0xA
#define OP_CMN 0xB
#define OP_ORR 0xC
#define OP_MUL 0xD
#define OP_BIC 0xE
#define OP_MVN 0xF

class ThumbCore
{
  public:
    //Variables
    uint16_t instructionQueue = 0;
    uint16_t curInstruction = 0;
    uint32_t zero;
    uint32_t carry;
    uint32_t negative;
    uint32_t overFlow;
    
    //Methods
    ThumbCore();
    ThumbCore(class Processor *par);
    void BeginExecution();
    void Execute();
    void OverflowCarryAdd(uint32_t a, uint32_t b, uint32_t r);
    void OverflowCarrySub(uint32_t a, uint32_t b, uint32_t r);
    void OpLslImm();
    void OpLsrImm();
    void OpAsrImm();
    void OpAddRegReg();
    void OpSubRegReg();
    void OpAddRegImm();
    void OpSubRegImm();
    void OpMovImm();
    void OpCmpImm();
    void OpAddImm();
    void OpSubImm();
    void OpArith();
    void OpAddHi();
    void OpCmpHi();
    void OpMovHi();
    void OpBx();
    void OpLdrPc();
    void OpStrReg();
    void OpStrhReg();
    void OpStrbReg();
    void OpLdrsbReg();
    void OpLdrReg();
    void OpLdrhReg();
    void OpLdrbReg();
    void OpLdrshReg();
    void OpStrImm();
    void OpLdrImm();
    void OpStrbImm();
    void OpLdrbImm();
    void OpStrhImm();
    void OpLdrhImm();
    void OpStrSp();
    void OpLdrSp();
    void OpAddPc();
    void OpAddSp();
    void OpSubSp();
    void OpPush();
    void OpPushLr();
    void OpPop();
    void OpPopPc();
    void OpStmia();
    void OpLdmia();
    void OpBCond();
    void OpSwi();
    void OpB();
    void OpBl1();
    void OpBl2();
    void OpUnd();
    void PackFlags();
    void UnpackFlags();
    void FlushQueue();
    void NormalOps(uint8_t op);
};

#endif




