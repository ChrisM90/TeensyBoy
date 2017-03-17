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

#include "ThumbCore.h"
#include "Arm7.h"

//CPU Mode Definitions
const uint32_t USR = 0x10;
const uint32_t FIQ = 0x11;
const uint32_t IRQ = 0x12;
const uint32_t SVC = 0x13;
const uint32_t ABT = 0x17;
const uint32_t UND = 0x1B;
const uint32_t SYS = 0x1F;

Processor *parentt;

ThumbCore::ThumbCore()
{
  
}

ThumbCore::ThumbCore(class Processor *par)
{
  parentt = par;
}

void ThumbCore::BeginExecution()
{
  FlushQueue();
}

void ThumbCore::Execute()
{
  UnpackFlags();

  while (parentt->Cycles > 0)
  {
    curInstruction = instructionQueue;
    instructionQueue = parentt->ReadU16(parentt->registers[15]);
    parentt->registers[15] += 2;

    // Execute the instruction
    NormalOps(curInstruction >> 8);

    parentt->Cycles -= parentt->GetWaitCycles();

    if ((parentt->cpsr & parentt->T_MASK) != parentt->T_MASK)
    {
      if ((curInstruction >> 8) != 0xDF) 
      {
        parentt->ReloadQueue();
      }
      break;
    }
  }
  
  PackFlags();
  
}

void ThumbCore::OverflowCarryAdd(uint32_t a, uint32_t b, uint32_t r)
{
  overFlow = ((a & b & ~r) | (~a & ~b & r)) >> 31;
  carry = ((a & b) | (a & ~r) | (b & ~r)) >> 31;
}

void ThumbCore::OverflowCarrySub(uint32_t a, uint32_t b, uint32_t r)
{
  overFlow = ((a & ~b & ~r) | (~a & b & r)) >> 31;
  carry = ((a & ~b) | (a & ~r) | (~b & ~r)) >> 31;
}

void ThumbCore::OpLslImm()
{
  // 0x00 - 0x07
  // lsl rd, rm, #immed
  int32_t rd = curInstruction & 0x7;
  int32_t rm = (curInstruction >> 3) & 0x7;
  int32_t immed = (curInstruction >> 6) & 0x1F;

  if (immed == 0)
  {
    parentt->registers[rd] = parentt->registers[rm];
  } 
  else
  {
    carry = (parentt->registers[rm] >> (32 - immed)) & 0x1;
    parentt->registers[rd] = parentt->registers[rm] << immed;
  }

    negative = parentt->registers[rd] >> 31;
    zero = parentt->registers[rd] == 0 ? 1U : 0U;
}

void ThumbCore::OpLsrImm()
{
  // 0x08 - 0x0F
  // lsr rd, rm, #immed
  int32_t rd = curInstruction & 0x7;
  int32_t rm = (curInstruction >> 3) & 0x7;
  int32_t immed = (curInstruction >> 6) & 0x1F;

  if (immed == 0)
  {
    carry = parentt->registers[rm] >> 31;
    parentt->registers[rd] = 0;
  }
  else
  {
    carry = (parentt->registers[rm] >> (immed - 1)) & 0x1;
    parentt->registers[rd] = parentt->registers[rm] >> immed;
  }

  negative = parentt->registers[rd] >> 31;
  zero = parentt->registers[rd] == 0 ? 1U : 0U;
}

void ThumbCore::OpAsrImm()
{
  // asr rd, rm, #immed
  int32_t rd = curInstruction & 0x7;
  int32_t rm = (curInstruction >> 3) & 0x7;
  int32_t immed = (curInstruction >> 6) & 0x1F;
  
  if (immed == 0)
  {
    carry = parentt->registers[rm] >> 31;
    if (carry == 1)
    {
      parentt->registers[rd] = 0xFFFFFFFF;
    }
    else
    {
      parentt->registers[rd] = 0;
    }
  }
  else
  {
    carry = (parentt->registers[rm] >> (immed - 1)) & 0x1;
    parentt->registers[rd] = (uint32_t)(((int32_t)parentt->registers[rm]) >> immed);
  }
  
  negative = parentt->registers[rd] >> 31;
  zero = parentt->registers[rd] == 0 ? 1U : 0U;
}

void ThumbCore::OpAddRegReg()
{
  // add rd, rn, rm
  int32_t rd = curInstruction & 0x7;
  int32_t rn = (curInstruction >> 3) & 0x7;
  int32_t rm = (curInstruction >> 6) & 0x7;
  
  uint32_t orn = parentt->registers[rn];
  uint32_t orm = parentt->registers[rm];
  
  parentt->registers[rd] = orn + orm;
  
  OverflowCarryAdd(orn, orm, parentt->registers[rd]);
  negative = parentt->registers[rd] >> 31;
  zero = parentt->registers[rd] == 0 ? 1U : 0U;
}

void ThumbCore::OpSubRegReg()
{
  // sub rd, rn, rm
  int32_t rd = curInstruction & 0x7;
  int32_t rn = (curInstruction >> 3) & 0x7;
  int32_t rm = (curInstruction >> 6) & 0x7;
  
  uint32_t orn = parentt->registers[rn];
  uint32_t orm = parentt->registers[rm];
  
  parentt->registers[rd] = orn - orm;
  
  OverflowCarrySub(orn, orm, parentt->registers[rd]);
  negative = parentt->registers[rd] >> 31;
  zero = parentt->registers[rd] == 0 ? 1U : 0U;
}

void ThumbCore::OpAddRegImm()
{
  // add rd, rn, #immed
  int32_t rd = curInstruction & 0x7;
  int32_t rn = (curInstruction >> 3) & 0x7;
  uint32_t immed = (uint32_t)((curInstruction >> 6) & 0x7);
  
  uint32_t orn = parentt->registers[rn];
  
  parentt->registers[rd] = orn + immed;
  
  OverflowCarryAdd(orn, immed, parentt->registers[rd]);
  negative = parentt->registers[rd] >> 31;
  zero = parentt->registers[rd] == 0 ? 1U : 0U;
}

void ThumbCore::OpSubRegImm()
{
  // sub rd, rn, #immed
  int32_t rd = curInstruction & 0x7;
  int32_t rn = (curInstruction >> 3) & 0x7;
  uint32_t immed = (uint32_t)((curInstruction >> 6) & 0x7);
  
  uint32_t orn = parentt->registers[rn];
  
  parentt->registers[rd] = orn - immed;
  
  OverflowCarrySub(orn, immed, parentt->registers[rd]);
  negative = parentt->registers[rd] >> 31;
  zero = parentt->registers[rd] == 0 ? 1U : 0U;
}

void ThumbCore::OpMovImm()
{
  // mov rd, #immed
  int32_t rd = (curInstruction >> 8) & 0x7;
  
  parentt->registers[rd] = (uint32_t)(curInstruction & 0xFF);
  
  negative = 0;
  zero = parentt->registers[rd] == 0 ? 1U : 0U;
}

void ThumbCore::OpCmpImm()
{
  // cmp rn, #immed
  int32_t rn = (curInstruction >> 8) & 0x7;
  
  uint32_t alu = parentt->registers[rn] - (uint32_t)(curInstruction & 0xFF);
  
  OverflowCarrySub(parentt->registers[rn], (uint32_t)(curInstruction & 0xFF), alu);
  negative = alu >> 31;
  zero = alu == 0 ? 1U : 0U;
}

void ThumbCore::OpAddImm()
{
  // add rd, #immed
  int32_t rd = (curInstruction >> 8) & 0x7;
  
  uint32_t ord = parentt->registers[rd];
  
  parentt->registers[rd] += (uint32_t)(curInstruction & 0xFF);
  
  OverflowCarryAdd(ord, (uint32_t)(curInstruction & 0xFF), parentt->registers[rd]);
  negative = parentt->registers[rd] >> 31;
  zero = parentt->registers[rd] == 0 ? 1U : 0U;
}

void ThumbCore::OpSubImm()
{
  // sub rd, #immed
  int32_t rd = (curInstruction >> 8) & 0x7;
  
  uint32_t ord = parentt->registers[rd];
  
  parentt->registers[rd] -= (uint32_t)(curInstruction & 0xFF);
  
  OverflowCarrySub(ord, (uint32_t)(curInstruction & 0xFF), parentt->registers[rd]);
  negative = parentt->registers[rd] >> 31;
  zero = parentt->registers[rd] == 0 ? 1U : 0U;
}

void ThumbCore::OpArith()
{
  int32_t rd = curInstruction & 0x7;
  uint32_t rn = parentt->registers[(curInstruction >> 3) & 0x7];

  uint32_t orig;
  uint32_t alu;
  int32_t shiftAmt;

  switch ((curInstruction >> 6) & 0xF)
  {
    case OP_ADC:
      {
        orig = parentt->registers[rd];
        parentt->registers[rd] += rn + carry;
  
        negative = parentt->registers[rd] >> 31;
        zero = parentt->registers[rd] == 0 ? 1U : 0U;
        OverflowCarryAdd(orig, rn, parentt->registers[rd]);
      }
      break;

    case OP_AND:
      {
        parentt->registers[rd] &= rn;
  
        negative = parentt->registers[rd] >> 31;
        zero = parentt->registers[rd] == 0 ? 1U : 0U;
      }
      break;

    case OP_ASR:
      {
        shiftAmt = (int32_t)(rn & 0xFF);
        if (shiftAmt == 0)
        {
          // Do nothing
        }
        else if (shiftAmt < 32)
        {
          carry = (parentt->registers[rd] >> (shiftAmt - 1)) & 0x1;
          parentt->registers[rd] = (uint32_t)(((int32_t)parentt->registers[rd]) >> shiftAmt);
        }
        else
        {
          carry = (parentt->registers[rd] >> 31) & 1;
          if (carry == 1) parentt->registers[rd] = 0xFFFFFFFF;
          else parentt->registers[rd] = 0;
        }
  
        negative = parentt->registers[rd] >> 31;
        zero = parentt->registers[rd] == 0 ? 1U : 0U;
      }
      break;

    case OP_BIC:
      {
        parentt->registers[rd] &= ~rn;
  
        negative = parentt->registers[rd] >> 31;
        zero = parentt->registers[rd] == 0 ? 1U : 0U;
      }
      break;

    case OP_CMN:
      {
        alu = parentt->registers[rd] + rn;
  
        negative = alu >> 31;
        zero = alu == 0 ? 1U : 0U;
        OverflowCarryAdd(parentt->registers[rd], rn, alu);
      }
      break;

    case OP_CMP:
      {
        alu = parentt->registers[rd] - rn;
  
        negative = alu >> 31;
        zero = alu == 0 ? 1U : 0U;
        OverflowCarrySub(parentt->registers[rd], rn, alu);
      }
      break;

    case OP_EOR:
      {
        parentt->registers[rd] ^= rn;
  
        negative = parentt->registers[rd] >> 31;
        zero = parentt->registers[rd] == 0 ? 1U : 0U;
      }
      break;

    case OP_LSL:
      {
        shiftAmt = (int32_t)(rn & 0xFF);
        if (shiftAmt == 0)
        {
                  // Do nothing
        }
        else if (shiftAmt < 32)
        {
          carry = (parentt->registers[rd] >> (32 - shiftAmt)) & 0x1;
          parentt->registers[rd] <<= shiftAmt;
        }
        else if (shiftAmt == 32)
        {
          carry = parentt->registers[rd] & 0x1;
          parentt->registers[rd] = 0;
        }
        else
        {
          carry = 0;
          parentt->registers[rd] = 0;
        }
  
        negative = parentt->registers[rd] >> 31;
        zero = parentt->registers[rd] == 0 ? 1U : 0U;
      }
      break;

    case OP_LSR:
      {
        shiftAmt = (int32_t)(rn & 0xFF);
        if (shiftAmt == 0)
        {
          // Do nothing
        }
        else if (shiftAmt < 32)
        {
          carry = (parentt->registers[rd] >> (shiftAmt - 1)) & 0x1;
          parentt->registers[rd] >>= shiftAmt;
        }
        else if (shiftAmt == 32)
        {
          carry = (parentt->registers[rd] >> 31) & 0x1;
          parentt->registers[rd] = 0;
        }
        else
        {
          carry = 0;
          parentt->registers[rd] = 0;
        }
  
        negative = parentt->registers[rd] >> 31;
        zero = parentt->registers[rd] == 0 ? 1U : 0U;
      }
      break;

    case OP_MUL:
      {
        int32_t mulCycles = 4;
        // Multiply cycle calculations
        if ((rn & 0xFFFFFF00) == 0 || (rn & 0xFFFFFF00) == 0xFFFFFF00)
        {
          mulCycles = 1;
        }
        else if ((rn & 0xFFFF0000) == 0 || (rn & 0xFFFF0000) == 0xFFFF0000)
        {
          mulCycles = 2;
        }
        else if ((rn & 0xFF000000) == 0 || (rn & 0xFF000000) == 0xFF000000)
        {
          mulCycles = 3;
        }
  
        parentt->Cycles -= mulCycles;
  
        parentt->registers[rd] *= rn;
  
        negative = parentt->registers[rd] >> 31;
        zero = parentt->registers[rd] == 0 ? 1U : 0U;
      }
      break;

    case OP_MVN:
      {
        parentt->registers[rd] = ~rn;

        negative = parentt->registers[rd] >> 31;
        zero = parentt->registers[rd] == 0 ? 1U : 0U;
      }
      break;

    case OP_NEG:
      {
        parentt->registers[rd] = 0 - rn;

        OverflowCarrySub(0, rn, parentt->registers[rd]);
        negative = parentt->registers[rd] >> 31;
        zero = parentt->registers[rd] == 0 ? 1U : 0U;
      }
      break;

    case OP_ORR:
      {
        parentt->registers[rd] |= rn;

        negative = parentt->registers[rd] >> 31;
        zero = parentt->registers[rd] == 0 ? 1U : 0U;
      }
      break;

    case OP_ROR:
      {
        shiftAmt = (int32_t)(rn & 0xFF);
        if (shiftAmt == 0)
        {
          // Do nothing
        }
        else if ((shiftAmt & 0x1F) == 0)
        {
          carry = parentt->registers[rd] >> 31;
        }
        else
        {
          shiftAmt &= 0x1F;
          carry = (parentt->registers[rd] >> (shiftAmt - 1)) & 0x1;
          parentt->registers[rd] = (parentt->registers[rd] >> shiftAmt) | (parentt->registers[rd] << (32 - shiftAmt));
         }

          negative = parentt->registers[rd] >> 31;
          zero = parentt->registers[rd] == 0 ? 1U : 0U;
      }
      break;

    case OP_SBC:
      {
        orig = parentt->registers[rd];
        parentt->registers[rd] = (parentt->registers[rd] - rn) - (1U - carry);

        negative = parentt->registers[rd] >> 31;
        zero = parentt->registers[rd] == 0 ? 1U : 0U;
        OverflowCarrySub(orig, rn, parentt->registers[rd]);
      }
      break;

    case OP_TST:
      {
        alu = parentt->registers[rd] & rn;

        negative = alu >> 31;
        zero = alu == 0 ? 1U : 0U;
      }
      break;
    }
}

void ThumbCore::OpAddHi()
{
  int32_t rd = ((curInstruction & (1 << 7)) >> 4) | (curInstruction & 0x7);
  int32_t rm = (curInstruction >> 3) & 0xF;

  parentt->registers[rd] += parentt->registers[rm];

  if (rd == 15)
  {
      parentt->registers[rd] &= ~1U;
      FlushQueue();
  }
}

void ThumbCore::OpCmpHi()
{
    int32_t rd = ((curInstruction & (1 << 7)) >> 4) | (curInstruction & 0x7);
    int32_t rm = (curInstruction >> 3) & 0xF;

    uint32_t alu = parentt->registers[rd] - parentt->registers[rm];

    negative = alu >> 31;
    zero = alu == 0 ? 1U : 0U;
    OverflowCarrySub(parentt->registers[rd], parentt->registers[rm], alu);
}

void ThumbCore::OpMovHi()
{
    int32_t rd = ((curInstruction & (1 << 7)) >> 4) | (curInstruction & 0x7);
    int32_t rm = (curInstruction >> 3) & 0xF;

    parentt->registers[rd] = parentt->registers[rm];

    if (rd == 15)
    {
        parentt->registers[rd] &= ~1U;
        FlushQueue();
    }
}

void ThumbCore::OpBx()
{
    int32_t rm = (curInstruction >> 3) & 0xf;

    PackFlags();

    parentt->cpsr &= ~parentt->T_MASK;
    parentt->cpsr |= (parentt->registers[rm] & 1) << parentt->T_BIT;

    parentt->registers[15] = parentt->registers[rm] & (~1U);

    UnpackFlags();

    // Check for branch back to Arm Mode
    if ((parentt->cpsr & parentt->T_MASK) != parentt->T_MASK)
    {
        return;
    }

    FlushQueue();
}

void ThumbCore::OpLdrPc()
{
    int32_t rd = (curInstruction >> 8) & 0x7;

    parentt->registers[rd] = parentt->ReadU32((parentt->registers[15] & ~2U) + (uint32_t)((curInstruction & 0xFF) * 4));

    parentt->Cycles--;
}

void ThumbCore::OpStrReg()
{
    parentt->WriteU32(parentt->registers[(curInstruction >> 3) & 0x7] + parentt->registers[(curInstruction >> 6) & 0x7], parentt->registers[curInstruction & 0x7]);
}

void ThumbCore::OpStrhReg()
{
    parentt->WriteU16(parentt->registers[(curInstruction >> 3) & 0x7] + parentt->registers[(curInstruction >> 6) & 0x7],(uint16_t)(parentt->registers[curInstruction & 0x7] & 0xFFFF));
}

void ThumbCore::OpStrbReg()
{
    parentt->WriteU8(parentt->registers[(curInstruction >> 3) & 0x7] + parentt->registers[(curInstruction >> 6) & 0x7],(uint8_t)(parentt->registers[curInstruction & 0x7] & 0xFF));
}

void ThumbCore::OpLdrsbReg()
{
    parentt->registers[curInstruction & 0x7] = parentt->ReadU8(parentt->registers[(curInstruction >> 3) & 0x7] + parentt->registers[(curInstruction >> 6) & 0x7]);

    if ((parentt->registers[curInstruction & 0x7] & (1 << 7)) != 0)
    {
        parentt->registers[curInstruction & 0x7] |= 0xFFFFFF00;
    }

    parentt->Cycles--;
}

void ThumbCore::OpLdrReg()
{
    parentt->registers[curInstruction & 0x7] = parentt->ReadU32(parentt->registers[(curInstruction >> 3) & 0x7] + parentt->registers[(curInstruction >> 6) & 0x7]);

    parentt->Cycles--;
}

void ThumbCore::OpLdrhReg()
{
    parentt->registers[curInstruction & 0x7] = parentt->ReadU16(parentt->registers[(curInstruction >> 3) & 0x7] + parentt->registers[(curInstruction >> 6) & 0x7]);

    parentt->Cycles--;
}

void ThumbCore::OpLdrbReg()
{
    parentt->registers[curInstruction & 0x7] = parentt->ReadU8(parentt->registers[(curInstruction >> 3) & 0x7] + parentt->registers[(curInstruction >> 6) & 0x7]);

    parentt->Cycles--;
}

void ThumbCore::OpLdrshReg()
{
    parentt->registers[curInstruction & 0x7] = parentt->ReadU16(parentt->registers[(curInstruction >> 3) & 0x7] + parentt->registers[(curInstruction >> 6) & 0x7]);

    if ((parentt->registers[curInstruction & 0x7] & (1 << 15)) != 0)
    {
        parentt->registers[curInstruction & 0x7] |= 0xFFFF0000;
    }

    parentt->Cycles--;
}

void ThumbCore::OpStrImm()
{
    parentt->WriteU32(parentt->registers[(curInstruction >> 3) & 0x7] + (uint32_t)(((curInstruction >> 6) & 0x1F) * 4), parentt->registers[curInstruction & 0x7]);
}

void ThumbCore::OpLdrImm()
{
    parentt->registers[curInstruction & 0x7] = parentt->ReadU32(parentt->registers[(curInstruction >> 3) & 0x7] + (uint32_t)(((curInstruction >> 6) & 0x1F) * 4));

    parentt->Cycles--;
}

void ThumbCore::OpStrbImm()
{
    parentt->WriteU8(parentt->registers[(curInstruction >> 3) & 0x7] + (uint32_t)((curInstruction >> 6) & 0x1F),(uint8_t)(parentt->registers[curInstruction & 0x7] & 0xFF));
}

void ThumbCore::OpLdrbImm()
{
    parentt->registers[curInstruction & 0x7] = parentt->ReadU8(parentt->registers[(curInstruction >> 3) & 0x7] + (uint32_t)((curInstruction >> 6) & 0x1F));

    parentt->Cycles--;
}

void ThumbCore::OpStrhImm()
{
    parentt->WriteU16(parentt->registers[(curInstruction >> 3) & 0x7] + (uint32_t)(((curInstruction >> 6) & 0x1F) * 2), (uint16_t)(parentt->registers[curInstruction & 0x7] & 0xFFFF));
}

void ThumbCore::OpLdrhImm()
{
    parentt->registers[curInstruction & 0x7] = parentt->ReadU16(parentt->registers[(curInstruction >> 3) & 0x7] + (uint32_t)(((curInstruction >> 6) & 0x1F) * 2));

    parentt->Cycles--;
}

void ThumbCore::OpStrSp()
{
    parentt->WriteU32(parentt->registers[13] + (uint32_t)((curInstruction & 0xFF) * 4), parentt->registers[(curInstruction >> 8) & 0x7]);
}

void ThumbCore::OpLdrSp()
{
    parentt->registers[(curInstruction >> 8) & 0x7] = parentt->ReadU32(parentt->registers[13] + (uint32_t)((curInstruction & 0xFF) * 4));
}

void ThumbCore::OpAddPc()
{
    parentt->registers[(curInstruction >> 8) & 0x7] = (parentt->registers[15] & ~2U) + (uint32_t)((curInstruction & 0xFF) * 4);
}

void ThumbCore::OpAddSp()
{
    parentt->registers[(curInstruction >> 8) & 0x7] = parentt->registers[13] + (uint32_t)((curInstruction & 0xFF) * 4);
}

void ThumbCore::OpSubSp()
{
    if ((curInstruction & (1 << 7)) != 0)
        parentt->registers[13] -= (uint32_t)((curInstruction & 0x7F) * 4);
    else
        parentt->registers[13] += (uint32_t)((curInstruction & 0x7F) * 4);
}

void ThumbCore::OpPush()
{    
    for (int i = 7; i >= 0; i--)
    {
        if (((curInstruction >> i) & 1) != 0)
        {
            parentt->registers[13] -= 4;
            parentt->WriteU32(parentt->registers[13], parentt->registers[i]);
        }
    }
}

void ThumbCore::OpPushLr()
{
    parentt->registers[13] -= 4;
    parentt->WriteU32(parentt->registers[13], parentt->registers[14]);

    for (int i = 7; i >= 0; i--)
    {
        if (((curInstruction >> i) & 1) != 0)
        {
            parentt->registers[13] -= 4;
            parentt->WriteU32(parentt->registers[13], parentt->registers[i]);
        }
    }
}

void ThumbCore::OpPop()
{
    for (int i = 0; i < 8; i++)
    {
        if (((curInstruction >> i) & 1) != 0)
        {
            parentt->registers[i] = parentt->ReadU32(parentt->registers[13]);
            parentt->registers[13] += 4;
        }
    }

    parentt->Cycles--;
}

void ThumbCore::OpPopPc()
{
    for (int i = 0; i < 8; i++)
    {
        if (((curInstruction >> i) & 1) != 0)
        {
            parentt->registers[i] = parentt->ReadU32(parentt->registers[13]);
            parentt->registers[13] += 4;
        }
    }

    parentt->registers[15] = parentt->ReadU32(parentt->registers[13]) & (~1U);
    parentt->registers[13] += 4;

    // ARM9 check here

    FlushQueue();

    parentt->Cycles--;
}

void ThumbCore::OpStmia()
{
    int32_t rn = (curInstruction >> 8) & 0x7;

    for (int i = 0; i < 8; i++)
    {
        if (((curInstruction >> i) & 1) != 0)
        {
            parentt->WriteU32(parentt->registers[rn] & (~3U), parentt->registers[i]);
            parentt->registers[rn] += 4;
        }
    }
}

void ThumbCore::OpLdmia()
{
    int32_t rn = (curInstruction >> 8) & 0x7;

    uint32_t address = parentt->registers[rn];

    for (int i = 0; i < 8; i++)
    {
        if (((curInstruction >> i) & 1) != 0)
        {
            parentt->registers[i] = parentt->ReadU32Aligned(address & (~3U));
            address += 4;
        }
    }

    if (((curInstruction >> rn) & 1) == 0)
    {
        parentt->registers[rn] = address;
    }
}

void ThumbCore::OpBCond()
{
    uint32_t cond = 0;
    switch ((curInstruction >> 8) & 0xF)
    {
        case COND_AL: cond = 1; break;
        case COND_EQ: cond = zero; break;
        case COND_NE: cond = 1 - zero; break;
        case COND_CS: cond = carry; break;
        case COND_CC: cond = 1 - carry; break;
        case COND_MI: cond = negative; break;
        case COND_PL: cond = 1 - negative; break;
        case COND_VS: cond = overFlow; break;
        case COND_VC: cond = 1 - overFlow; break;
        case COND_HI: cond = carry & (1 - zero); break;
        case COND_LS: cond = (1 - carry) | zero; break;
        case COND_GE: cond = (1 - negative) ^ overFlow; break;
        case COND_LT: cond = negative ^ overFlow; break;
        case COND_GT: cond = (1 - zero) & (negative ^ (1 - overFlow)); break;
        case COND_LE: cond = (negative ^ overFlow) | zero; break;
    }

    if (cond == 1)
    {
        uint32_t offSet = (uint32_t)(curInstruction & 0xFF);
        if ((offSet & (1 << 7)) != 0) offSet |= 0xFFFFFF00;

        parentt->registers[15] += offSet << 1;

        FlushQueue();
    }
}

void ThumbCore::OpSwi()
{
    parentt->registers[15] -= 4U;
    parentt->EnterException(SVC, 0x8, false, false);
}

void ThumbCore::OpB()
{
    uint32_t offSet = (uint32_t)(curInstruction & 0x7FF);
    if ((offSet & (1 << 10)) != 0) offSet |= 0xFFFFF800;

    parentt->registers[15] += offSet << 1;

    FlushQueue();
}

void ThumbCore::OpBl1()
{
    uint32_t offSet = (uint32_t)(curInstruction & 0x7FF);
    if ((offSet & (1 << 10)) != 0) offSet |= 0xFFFFF800;

    parentt->registers[14] = parentt->registers[15] + (offSet << 12);
}

void ThumbCore::OpBl2()
{
    uint32_t tmp = parentt->registers[15];
    parentt->registers[15] = parentt->registers[14] + (uint32_t)((curInstruction & 0x7FF) << 1);
    parentt->registers[14] = (tmp - 2U) | 1;

    FlushQueue();
}

void ThumbCore::OpUnd()
{
    //Explode
}

void ThumbCore::PackFlags()
{
    parentt->cpsr &= 0x0FFFFFFF;
    parentt->cpsr |= negative << parentt->N_BIT;
    parentt->cpsr |= zero << parentt->Z_BIT;
    parentt->cpsr |= carry << parentt->C_BIT;
    parentt->cpsr |= overFlow << parentt->V_BIT;
}

void ThumbCore::UnpackFlags()
{
    negative = (parentt->cpsr >> parentt->N_BIT) & 1;
    zero = (parentt->cpsr >> parentt->Z_BIT) & 1;
    carry = (parentt->cpsr >> parentt->C_BIT) & 1;
    overFlow = (parentt->cpsr >> parentt->V_BIT) & 1;
}

void ThumbCore::FlushQueue()
{
    instructionQueue = parentt->ReadU16(parentt->registers[15]);
    parentt->registers[15] += 2;
}

void ThumbCore::NormalOps(uint8_t op)
{
  switch (op)
  {
    case 0:   //OpLslImm
    case 1:   //OpLslImm
    case 2:   //OpLslImm
    case 3:   //OpLslImm
    case 4:   //OpLslImm
    case 5:   //OpLslImm
    case 6:   //OpLslImm
    case 7:   //OpLslImm
      OpLslImm();
      break;
    case 8:   //OpLsrImm
    case 9:   //OpLsrImm
    case 10:  //OpLsrImm
    case 11:  //OpLsrImm
    case 12:  //OpLsrImm
    case 13:  //OpLsrImm
    case 14:  //OpLsrImm
    case 15:  //OpLsrImm
      OpLsrImm();
      break;
    case 16:  //OpAsrImm
    case 17:  //OpAsrImm
    case 18:  //OpAsrImm
    case 19:  //OpAsrImm
    case 20:  //OpAsrImm
    case 21:  //OpAsrImm
    case 22:  //OpAsrImm
    case 23:  //OpAsrImm
      OpAsrImm();
      break;
    case 24:  //OpAddRegReg
    case 25:  //OpAddRegReg
      OpAddRegReg();
      break;
    case 26:  //OpSubRegReg
    case 27:  //OpSubRegReg
      OpSubRegReg();
      break;
    case 28:  //OpAddRegImm
    case 29:  //OpAddRegImm
      OpAddRegImm();
      break;
    case 30:  //OpSubRegImm
    case 31:  //OpSubRegImm
      OpSubRegImm();
      break;
    case 32:  //OpMovImm
    case 33:  //OpMovImm
    case 34:  //OpMovImm
    case 35:  //OpMovImm
    case 36:  //OpMovImm
    case 37:  //OpMovImm
    case 38:  //OpMovImm
    case 39:  //OpMovImm
      OpMovImm();
      break;
    case 40:  //OpCmpImm
    case 41:  //OpCmpImm
    case 42:  //OpCmpImm
    case 43:  //OpCmpImm
    case 44:  //OpCmpImm
    case 45:  //OpCmpImm
    case 46:  //OpCmpImm
    case 47:  //OpCmpImm
      OpCmpImm();
      break;
    case 48:  //OpAddImm
    case 49:  //OpAddImm
    case 50:  //OpAddImm
    case 51:  //OpAddImm
    case 52:  //OpAddImm
    case 53:  //OpAddImm
    case 54:  //OpAddImm
    case 55:  //OpAddImm
      OpAddImm();
      break;
    case 56:  //OpSubImm
    case 57:  //OpSubImm
    case 58:  //OpSubImm
    case 59:  //OpSubImm
    case 60:  //OpSubImm
    case 61:  //OpSubImm
    case 62:  //OpSubImm
    case 63:  //OpSubImm
      OpSubImm();
      break;
    case 64:  //OpArith
    case 65:  //OpArith
    case 66:  //OpArith
    case 67:  //OpArith
      OpArith();
      break;
    case 68:  //OpAddHi
      OpAddHi();
      break;
    case 69:  //OpCmpHi
      OpCmpHi();
      break;
    case 70:  //OpMovHi
      OpMovHi();
      break;
    case 71:  //OpBx
      OpBx();
      break;
    case 72:  //OpLdrPc
    case 73:  //OpLdrPc
    case 74:  //OpLdrPc
    case 75:  //OpLdrPc
    case 76:  //OpLdrPc
    case 77:  //OpLdrPc
    case 78:  //OpLdrPc
    case 79:  //OpLdrPc
      OpLdrPc();
      break;
    case 80:  //OpStrReg
    case 81:  //OpStrReg
      OpStrReg();
      break;
    case 82:  //OpStrhReg
    case 83:  //OpStrhReg
      OpStrhReg();
      break;
    case 84:  //OpStrbReg
    case 85:  //OpStrbReg
      OpStrbReg();
      break;
    case 86:  //OpLdrsbReg
    case 87:  //OpLdrsbReg
      OpLdrsbReg();
      break;
    case 88:  //OpLdrReg
    case 89:  //OpLdrReg
      OpLdrReg();
      break;
    case 90:  //OpLdrhReg
    case 91:  //OpLdrhReg
      OpLdrhReg();
      break;
    case 92:  //OpLdrbReg
    case 93:  //OpLdrbReg
      OpLdrbReg();
      break;
    case 94:  //OpLdrshReg
    case 95:  //OpLdrshReg
      OpLdrshReg();
      break;
    case 96:  //OpStrImm
    case 97:  //OpStrImm
    case 98:  //OpStrImm
    case 99:  //OpStrImm
    case 100: //OpStrImm
    case 101: //OpStrImm
    case 102: //OpStrImm
    case 103: //OpStrImm
      OpStrImm();
      break;
    case 104: //OpLdrImm
    case 105: //OpLdrImm
    case 106: //OpLdrImm
    case 107: //OpLdrImm
    case 108: //OpLdrImm
    case 109: //OpLdrImm
    case 110: //OpLdrImm
    case 111: //OpLdrImm
      OpLdrImm();
      break;
    case 112: //OpStrbImm
    case 113: //OpStrbImm
    case 114: //OpStrbImm
    case 115: //OpStrbImm
    case 116: //OpStrbImm
    case 117: //OpStrbImm
    case 118: //OpStrbImm
    case 119: //OpStrbImm
      OpStrbImm();
      break;
    case 120: //OpLdrbImm
    case 121: //OpLdrbImm
    case 122: //OpLdrbImm
    case 123: //OpLdrbImm
    case 124: //OpLdrbImm
    case 125: //OpLdrbImm
    case 126: //OpLdrbImm
    case 127: //OpLdrbImm
      OpLdrbImm();
      break;
    case 128: //OpStrhImm
    case 129: //OpStrhImm
    case 130: //OpStrhImm
    case 131: //OpStrhImm
    case 132: //OpStrhImm
    case 133: //OpStrhImm
    case 134: //OpStrhImm
    case 135: //OpStrhImm
      OpStrhImm();
      break;
    case 136: //OpLdrhImm
    case 137: //OpLdrhImm
    case 138: //OpLdrhImm
    case 139: //OpLdrhImm
    case 140: //OpLdrhImm
    case 141: //OpLdrhImm
    case 142: //OpLdrhImm
    case 143: //OpLdrhImm
      OpLdrhImm();
      break;
    case 144: //OpStrSp
    case 145: //OpStrSp
    case 146: //OpStrSp
    case 147: //OpStrSp
    case 148: //OpStrSp
    case 149: //OpStrSp
    case 150: //OpStrSp
    case 151: //OpStrSp
      OpStrSp();
      break;
    case 152: //OpLdrSp
    case 153: //OpLdrSp
    case 154: //OpLdrSp
    case 155: //OpLdrSp
    case 156: //OpLdrSp
    case 157: //OpLdrSp
    case 158: //OpLdrSp
    case 159: //OpLdrSp
      OpLdrSp();
      break;
    case 160: //OpAddPc
    case 161: //OpAddPc
    case 162: //OpAddPc
    case 163: //OpAddPc
    case 164: //OpAddPc
    case 165: //OpAddPc
    case 166: //OpAddPc
    case 167: //OpAddPc
      OpAddPc();
      break;
    case 168: //OpAddSp
    case 169: //OpAddSp
    case 170: //OpAddSp
    case 171: //OpAddSp
    case 172: //OpAddSp
    case 173: //OpAddSp
    case 174: //OpAddSp
    case 175: //OpAddSp
      OpAddSp();
      break;
    case 176: //OpSubSp
      OpSubSp();
      break;
    case 177: //OpUnd
    case 178: //OpUnd
    case 179: //OpUnd
      OpUnd();
      break;
    case 180: //OpPush
      OpPush();
      break;
    case 181: //OpPushLr
      OpPushLr();
      break;
    case 182: //OpUnd
    case 183: //OpUnd
    case 184: //OpUnd
    case 185: //OpUnd
    case 186: //OpUnd
    case 187: //OpUnd
      OpUnd();
      break;
    case 188: //OpPop
      OpPop();
      break;
    case 189: //OpPopPc
      OpPopPc();
      break;
    case 190: //OpUnd
    case 191: //OpUnd
      OpUnd();
      break;
    case 192: //OpStmia
    case 193: //OpStmia
    case 194: //OpStmia
    case 195: //OpStmia
    case 196: //OpStmia
    case 197: //OpStmia
    case 198: //OpStmia
    case 199: //OpStmia
      OpStmia();
      break;
    case 200: //OpLdmia
    case 201: //OpLdmia
    case 202: //OpLdmia
    case 203: //OpLdmia
    case 204: //OpLdmia
    case 205: //OpLdmia
    case 206: //OpLdmia
    case 207: //OpLdmia
      OpLdmia();
      break;
    case 208: //OpBCond
    case 209: //OpBCond
    case 210: //OpBCond
    case 211: //OpBCond
    case 212: //OpBCond
    case 213: //OpBCond
    case 214: //OpBCond
    case 215: //OpBCond
    case 216: //OpBCond
    case 217: //OpBCond
    case 218: //OpBCond
    case 219: //OpBCond
    case 220: //OpBCond
    case 221: //OpBCond
      OpBCond();
      break;
    case 222: //OpUnd
      OpUnd();
      break;
    case 223: //OpSwi
      OpSwi();
      break;
    case 224: //OpB
    case 225: //OpB
    case 226: //OpB
    case 227: //OpB
    case 228: //OpB
    case 229: //OpB
    case 230: //OpB
    case 231: //OpB
      OpB();
      break;
    case 232: //OpUnd
    case 233: //OpUnd
    case 234: //OpUnd
    case 235: //OpUnd
    case 236: //OpUnd
    case 237: //OpUnd
    case 238: //OpUnd
    case 239: //OpUnd
      OpUnd();
      break;
    case 240: //OpBl1
    case 241: //OpBl1
    case 242: //OpBl1
    case 243: //OpBl1
    case 244: //OpBl1
    case 245: //OpBl1
    case 246: //OpBl1
    case 247: //OpBl1
      OpBl1();
      break;
    case 248: //OpBl2
    case 249: //OpBl2
    case 250: //OpBl2
    case 251: //OpBl2
    case 252: //OpBl2
    case 253: //OpBl2
    case 254: //OpBl2
    case 255: //OpBl2
      OpBl2();
      break;
  }
}






