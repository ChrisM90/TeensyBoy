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

#include "ArmCore.h"
#include "Arm7.h"

#define SHIFT_LSL 0
#define SHIFT_LSR 1
#define SHIFT_ASR 2
#define SHIFT_ROR 3

//CPU Mode Definitions
const uint32_t USR = 0x10;
const uint32_t FIQ = 0x11;
const uint32_t IRQ = 0x12;
const uint32_t SVC = 0x13;
const uint32_t ABT = 0x17;
const uint32_t UND = 0x1B;
const uint32_t SYS = 0x1F;

Processor *parent;

ArmCore::ArmCore()
{
  
}

ArmCore::ArmCore(class Processor *par)
{
  parent = par;
}

void ArmCore::BeginExecution()
{
  FlushQueue();
}

void ArmCore::Execute()
{
  UnpackFlags();
  thumbMode = false;
  
  while(parent->Cycles > 0)
  {
    curInstruction = instructionQueue;
    
    instructionQueue = parent->ReadU32Aligned(parent->registers[15]);
    parent->registers[15] += 4;
    
    if((curInstruction >> 28) == COND_AL)
    {
      NormalOps((curInstruction >> 25) & 0x7);
    }
    else
    {
      uint32_t cond = 0;
      switch(curInstruction >> 28)
      {
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

      if(cond == 1)
      {
        NormalOps((curInstruction >> 25) & 0x7);
      }
    }

    parent->Cycles -= parent->GetWaitCycles();
    
    if(thumbMode)
    {
      parent->ReloadQueue();
      break;
    }
  }

  PackFlags();
}

void ArmCore::NormalOps(uint8_t index)
{
  switch(index)
  {
    case 0:
      DataProcessing();
      break;
    case 1:
      DataProcessingImmed();
      break;
    case 2:
      LoadStoreImmediate();
      break;
    case 3:
      LoadStoreRegister();
      break;
    case 4:
      LoadStoreMultiple();
      break;
    case 5:
      Branch();
      break;
    case 6:
      CoprocessorLoadStore();
      break;
    case 7:
      SoftwareInterrupt();
      break;
  }
}

uint32_t ArmCore::BarrelShifter(uint32_t shifterOperand)
{
  uint32_t type = (shifterOperand >> 5) & 0x3;

  bool registerShift = (shifterOperand & (1 << 4)) == (1 << 4);

  uint32_t rm = parent->registers[shifterOperand & 0xF];

  int32_t amount;
  if (registerShift)
  {
    uint32_t rs = (shifterOperand >> 8) & 0xF;
    
    if (rs == 15)
    {
      amount = (int32_t)((parent->registers[rs] + 0x4) & 0xFF);
    }
    else
    {
      amount = (int32_t)(parent->registers[rs] & 0xFF);
    }

    if ((shifterOperand & 0xF) == 15)
    {
      rm += 4;
    }
  }
  else
  {
    amount = (int32_t)((shifterOperand >> 7) & 0x1F);
  }

  if (registerShift)
  {
    if (amount == 0)
    {
      shifterCarry = carry;
      return rm;
    }

    switch (type)
    {
      case SHIFT_LSL:
        if (amount < 32)
        {
          shifterCarry = (rm >> (32 - amount)) & 1;
          return rm << amount;
        }
        else if (amount == 32)
        {
          shifterCarry = rm & 1;
          return 0;
        }
        else
        {
          shifterCarry = 0;
          return 0;
        }

      case SHIFT_LSR:
        if (amount < 32)
        {
          shifterCarry = (rm >> (amount - 1)) & 1;
          return rm >> amount;
        }
        else if (amount == 32)
        {
          shifterCarry = (rm >> 31) & 1;
          return 0;
        }
        else
        {
          shifterCarry = 0;
          return 0;
        }

      case SHIFT_ASR:
        if (amount >= 32)
        {
          if ((rm & (1 << 31)) == 0)
          {
            shifterCarry = 0;
            return 0;
          }
          else
          {
            shifterCarry = 1;
            return 0xFFFFFFFF;
          }
        }
        else
        {
          shifterCarry = (rm >> (amount - 1)) & 1;
          return (uint32_t)(((int32_t)rm) >> amount);
        }

      case SHIFT_ROR:
        if ((amount & 0x1F) == 0)
        {
          shifterCarry = (rm >> 31) & 1;
          return rm;
        }
        else
        {
          amount &= 0x1F;
          shifterCarry = (rm >> amount) & 1;
          return (rm >> amount) | (rm << (32 - amount));
        }
    }
  }
  else
  {
    switch (type)
    {
      case SHIFT_LSL:
        if (amount == 0)
        {
          shifterCarry = carry;
          return rm;
        }
        else
        {
          shifterCarry = (rm >> (32 - amount)) & 1;
          return rm << amount;
        }

      case SHIFT_LSR:
        if (amount == 0)
        {
          shifterCarry = (rm >> 31) & 1;
          return 0;
        }
        else
        {
          shifterCarry = (rm >> (amount - 1)) & 1;
          return rm >> amount;
        }

      case SHIFT_ASR:
        if (amount == 0)
        {
          if ((rm & (1 << 31)) == 0)
          {
            shifterCarry = 0;
            return 0;
          }
          else
          {
            shifterCarry = 1;
            return 0xFFFFFFFF;
          }
        }
        else
        {
          shifterCarry = (rm >> (amount - 1)) & 1;
          return (uint32_t)(((int32_t)rm) >> amount);
        }

      case SHIFT_ROR:
        if (amount == 0)
        {
          // Actually an RRX
          shifterCarry = rm & 1;
          return (carry << 31) | (rm >> 1);
        }
        else
        {
          shifterCarry = (rm >> (amount - 1)) & 1;
          return (rm >> amount) | (rm << (32 - amount));
        }
    }
  }
}

void ArmCore::OverflowCarryAdd(uint32_t a, uint32_t b, uint32_t r)
{
  overFlow = ((a & b & ~r) | (~a & ~b & r)) >> 31;
  carry = ((a & b) | (a & ~r) | (b & ~r)) >> 31;
}

void ArmCore::OverflowCarrySub(uint32_t a, uint32_t b, uint32_t r)
{
  overFlow = ((a & ~b & ~r) | (~a & b & r)) >> 31;
  carry = ((a & ~b) | (a & ~r) | (~b & ~r)) >> 31;
}

void ArmCore::DoDataProcessing(uint32_t shifterOperand)
{
  uint32_t rn = (curInstruction >> 16) & 0xF;
  uint32_t rd = (curInstruction >> 12) & 0xF;
  uint32_t alu;

  bool registerShift = (curInstruction & (1 << 4)) == (1 << 4);
  
  if (rn == 15 && ((curInstruction >> 25) & 0x7) == 0 && registerShift)
  {
    rn = parent->registers[rn] + 4;
  }
  else
  {
    rn = parent->registers[rn];
  }

  uint32_t opcode = (curInstruction >> 21) & 0xF;

  if (((curInstruction >> 20) & 1) == 1)
  {
    // Set flag bit set
    switch (opcode)
    {
      case OP_ADC:
        parent->registers[rd] = rn + shifterOperand + carry;

        negative = parent->registers[rd] >> 31;
        zero = parent->registers[rd] == 0 ? 1U : 0U;
        OverflowCarryAdd(rn, shifterOperand, parent->registers[rd]);
        break;

      case OP_ADD:
        parent->registers[rd] = rn + shifterOperand;

        negative = parent->registers[rd] >> 31;
        zero = parent->registers[rd] == 0 ? 1U : 0U;
        OverflowCarryAdd(rn, shifterOperand, parent->registers[rd]);
        break;

      case OP_AND:
        parent->registers[rd] = rn & shifterOperand;

        negative = parent->registers[rd] >> 31;
        zero = parent->registers[rd] == 0 ? 1U : 0U;
        carry = shifterCarry;
        break;

      case OP_BIC:
        parent->registers[rd] = rn & ~shifterOperand;

        negative = parent->registers[rd] >> 31;
        zero = parent->registers[rd] == 0 ? 1U : 0U;
        carry = shifterCarry;
        break;

      case OP_CMN:
        alu = rn + shifterOperand;

        negative = alu >> 31;
        zero = alu == 0 ? 1U : 0U;
        OverflowCarryAdd(rn, shifterOperand, alu);
        break;

      case OP_CMP:
        alu = rn - shifterOperand;

        negative = alu >> 31;
        zero = alu == 0 ? 1U : 0U;
        OverflowCarrySub(rn, shifterOperand, alu);
        break;

      case OP_EOR:
        parent->registers[rd] = rn ^ shifterOperand;

        negative = parent->registers[rd] >> 31;
        zero = parent->registers[rd] == 0 ? 1U : 0U;
        carry = shifterCarry;
        break;

      case OP_MOV:
        parent->registers[rd] = shifterOperand;

        negative = parent->registers[rd] >> 31;
        zero = parent->registers[rd] == 0 ? 1U : 0U;
        carry = shifterCarry;
        break;

      case OP_MVN:
        parent->registers[rd] = ~shifterOperand;

        negative = parent->registers[rd] >> 31;
        zero = parent->registers[rd] == 0 ? 1U : 0U;
        carry = shifterCarry;
        break;

      case OP_ORR:
        parent->registers[rd] = rn | shifterOperand;

        negative = parent->registers[rd] >> 31;
        zero = parent->registers[rd] == 0 ? 1U : 0U;
        carry = shifterCarry;
        break;

      case OP_RSB:
        parent->registers[rd] = shifterOperand - rn;

        negative = parent->registers[rd] >> 31;
        zero = parent->registers[rd] == 0 ? 1U : 0U;
        OverflowCarrySub(shifterOperand, rn, parent->registers[rd]);
        break;

      case OP_RSC:
        parent->registers[rd] = shifterOperand - rn - (1U - carry);

        negative = parent->registers[rd] >> 31;
        zero = parent->registers[rd] == 0 ? 1U : 0U;
        OverflowCarrySub(shifterOperand, rn, parent->registers[rd]);
        break;

      case OP_SBC:
        parent->registers[rd] = rn - shifterOperand - (1U - carry);

        negative = parent->registers[rd] >> 31;
        zero = parent->registers[rd] == 0 ? 1U : 0U;
        OverflowCarrySub(rn, shifterOperand, parent->registers[rd]);
        break;

      case OP_SUB:
        parent->registers[rd] = rn - shifterOperand;

        negative = parent->registers[rd] >> 31;
        zero = parent->registers[rd] == 0 ? 1U : 0U;
        OverflowCarrySub(rn, shifterOperand, parent->registers[rd]);
        break;

      case OP_TEQ:
        alu = rn ^ shifterOperand;

        negative = alu >> 31;
        zero = alu == 0 ? 1U : 0U;
        carry = shifterCarry;
        break;

      case OP_TST:
        alu = rn & shifterOperand;

        negative = alu >> 31;
        zero = alu == 0 ? 1U : 0U;
        carry = shifterCarry;
        break;
    }

    if (rd == 15)
    {
      // Prevent writing if no SPSR exists (this will be true for USER or SYSTEM mode)
      if (parent->SPSRExists()) 
      {
        parent->WriteCpsr(parent->GetSPSR());
      }
      
      UnpackFlags();

      // Check for branch back to Thumb Mode
      if ((parent->cpsr & parent->T_MASK) == parent->T_MASK)
      {
        thumbMode = true;
        return;
      }

      // Otherwise, flush the instruction queue
      FlushQueue();
    }
  }
  else
  {
    // Set flag bit not set
    switch (opcode)
    {
      case OP_ADC: parent->registers[rd] = rn + shifterOperand + carry; break;
      case OP_ADD: parent->registers[rd] = rn + shifterOperand; break;
      case OP_AND: parent->registers[rd] = rn & shifterOperand; break;
      case OP_BIC: parent->registers[rd] = rn & ~shifterOperand; break;
      case OP_EOR: parent->registers[rd] = rn ^ shifterOperand; break;
      case OP_MOV: parent->registers[rd] = shifterOperand; break;
      case OP_MVN: parent->registers[rd] = ~shifterOperand; break;
      case OP_ORR: parent->registers[rd] = rn | shifterOperand; break;
      case OP_RSB: parent->registers[rd] = shifterOperand - rn; break;
      case OP_RSC: parent->registers[rd] = shifterOperand - rn - (1U - carry); break;
      case OP_SBC: parent->registers[rd] = rn - shifterOperand - (1U - carry); break;
      case OP_SUB: parent->registers[rd] = rn - shifterOperand; break;

      case OP_CMN:
        // MSR SPSR, shifterOperand
        if ((curInstruction & (1 << 16)) == 1 << 16 && parent->SPSRExists())
        {
          parent->SetSPSR(parent->GetSPSR() & 0xFFFFFF00);
          parent->SetSPSR(parent->GetSPSR() | (shifterOperand & 0x000000FF));
        }
        if ((curInstruction & (1 << 17)) == 1 << 17 && parent->SPSRExists())
        {
          parent->SetSPSR(parent->GetSPSR() & 0xFFFF00FF);
          parent->SetSPSR(parent->GetSPSR() | (shifterOperand & 0x0000FF00));
        }
        if ((curInstruction & (1 << 18)) == 1 << 18 && parent->SPSRExists())
        {
          parent->SetSPSR(parent->GetSPSR() & 0xFF00FFFF);
          parent->SetSPSR(parent->GetSPSR() | (shifterOperand & 0x00FF0000));
        }
        if ((curInstruction & (1 << 19)) == 1 << 19 && parent->SPSRExists())
        {
          parent->SetSPSR(parent->GetSPSR() & 0x00FFFFFF);
          parent->SetSPSR(parent->GetSPSR() | (shifterOperand & 0xFF000000));
        }
        // Queue will be flushed since rd == 15, so adjust the PC
        parent->registers[15] -= 4;
        break;

      case OP_CMP:
        // MRS rd, SPSR
        if (parent->SPSRExists())
        {
          parent->registers[rd] = parent->GetSPSR();
        }
        break;

      case OP_TEQ:
        if (((curInstruction >> 4) & 0xf) == 1)
        {
          // BX
          uint32_t rm = curInstruction & 0xf;

          PackFlags();

          parent->cpsr &= ~parent->T_MASK;
          parent->cpsr |= (parent->registers[rm] & 1) << parent->T_BIT;

          parent->registers[15] = parent->registers[rm] & (~1U);

          UnpackFlags();

          // Check for branch back to Thumb Mode
          if ((parent->cpsr & parent->T_MASK) == parent->T_MASK)
          {
            thumbMode = true;
            return;
          }

          // Queue will be flushed later because rd == 15
        }
        else if (((curInstruction >> 4) & 0xf) == 0)
        {
          // MSR CPSR, shifterOperand
          bool userMode = (parent->cpsr & 0x1F) == USR;

          PackFlags();

          uint32_t tmpCPSR = parent->cpsr;

          if ((curInstruction & (1 << 16)) == 1 << 16 && !userMode)
          {
            tmpCPSR &= 0xFFFFFF00;
            tmpCPSR |= shifterOperand & 0x000000FF;
          }
          if ((curInstruction & (1 << 17)) == 1 << 17 && !userMode)
          {
            tmpCPSR &= 0xFFFF00FF;
            tmpCPSR |= shifterOperand & 0x0000FF00;
          }
          if ((curInstruction & (1 << 18)) == 1 << 18 && !userMode)
          {
            tmpCPSR &= 0xFF00FFFF;
            tmpCPSR |= shifterOperand & 0x00FF0000;
          }
          if ((curInstruction & (1 << 19)) == 1 << 19)
          {
            tmpCPSR &= 0x00FFFFFF;
            tmpCPSR |= shifterOperand & 0xFF000000;
          }

          parent->WriteCpsr(tmpCPSR);

          UnpackFlags();

          // Check for branch back to Thumb Mode
          if ((parent->cpsr & parent->T_MASK) == parent->T_MASK)
          {
            thumbMode = true;
            return;
          }

          // Queue will be flushed since rd == 15, so adjust the PC
          parent->registers[15] -= 4;
        }
        break;

      case OP_TST:
        // MRS rd, CPSR
        PackFlags();
        parent->registers[rd] = parent->cpsr;
        break;
    }

    if (rd == 15)
    {
      // Flush the queue
      FlushQueue();
    }
  }
}

void ArmCore::DataProcessing()
{
  // Special instruction
  switch ((curInstruction >> 4) & 0xF)
  {
    case 0x9:
      // Multiply or swap instructions
      MultiplyOrSwap();
      return;
    case 0xB:
      // Load/Store Unsigned halfword
      LoadStoreHalfword();
      return;
    case 0xD:
      // Load/Store Signed byte
      LoadStoreHalfword();
      return;
    case 0xF:
      // Load/Store Signed halfword
      LoadStoreHalfword();
      return;
  }

  DoDataProcessing(BarrelShifter(curInstruction));
}

void ArmCore::DataProcessingImmed()
{
  uint32_t immed = curInstruction & 0xFF;
  int32_t rotateAmount = (int32_t)(((curInstruction >> 8) & 0xF) * 2);

  immed = (immed >> rotateAmount) | (immed << (32 - rotateAmount));

  if (rotateAmount == 0)
  {
    shifterCarry = carry;
  }
  else
  {
    shifterCarry = (immed >> 31) & 1;
  }

  DoDataProcessing(immed);
}

void ArmCore::LoadStore(uint32_t offSet)
{
  uint32_t rn = (curInstruction >> 16) & 0xF;
  uint32_t rd = (curInstruction >> 12) & 0xF;

  uint32_t address = parent->registers[rn];

  bool preIndexed = (curInstruction & (1 << 24)) == 1 << 24;
  bool byteTransfer = (curInstruction & (1 << 22)) == 1 << 22;
  bool writeback = (curInstruction & (1 << 21)) == 1 << 21;

  // Add or subtract offset
  if ((curInstruction & (1 << 23)) != 1 << 23) offSet = (uint32_t)-offSet;

  if (preIndexed)
  {
    address += offSet;

    if (writeback)
    {
      parent->registers[rn] = address;
    }
  }

  if ((curInstruction & (1 << 20)) == 1 << 20)
  {
    // Load
    if (byteTransfer)
    {
      parent->registers[rd] = parent->ReadU8(address);
    }
    else
    {
      parent->registers[rd] = parent->ReadU32(address);
    }

    // ARM9 fix here

    if (rd == 15)
    {
      parent->registers[rd] &= ~3U;
      FlushQueue();
    }

    if (!preIndexed)
    {
      if (rn != rd)
      {
        parent->registers[rn] = address + offSet;
      }
    }
  }
  else
  {
    // Store
    uint32_t amount = parent->registers[rd];
    if (rd == 15) amount += 4;

    if (byteTransfer)
    {
      parent->WriteU8(address, (uint8_t)(amount & 0xFF));
    }
    else
    {
      parent->WriteU32(address, amount);
    }

    if (!preIndexed)
    {
      parent->registers[rn] = address + offSet;
    }
  }
}

void ArmCore::LoadStoreImmediate()
{
  LoadStore(curInstruction & 0xFFF);
}

void ArmCore::LoadStoreRegister()
{
  // The barrel shifter expects a 0 in bit 4 for immediate shifts, this is implicit in
  // the meaning of the instruction, so it is fine
  LoadStore(BarrelShifter(curInstruction));
}

void ArmCore::LoadStoreMultiple()
{
  uint32_t rn = (curInstruction >> 16) & 0xF;

  PackFlags();
  uint32_t curCpsr = parent->cpsr;

  bool preIncrement = (curInstruction & (1 << 24)) != 0;
  bool up = (curInstruction & (1 << 23)) != 0;
  bool writeback = (curInstruction & (1 << 21)) != 0;

  uint32_t address;
  uint32_t bitsSet = 0;
  
  for (int8_t i = 0; i < 16; i++)
  {
    if (((curInstruction >> i) & 1) != 0)
    {
      bitsSet++;
    }
  }

  if (preIncrement)
  {
    if (up)
    {
      // Increment before
      address = parent->registers[rn] + 4;
      if (writeback) 
      {
        parent->registers[rn] += bitsSet * 4;
      }
    }
    else
    {
      // Decrement before
      address = parent->registers[rn] - (bitsSet * 4);
      if (writeback)
      {
        parent->registers[rn] -= bitsSet * 4;
      }
    }
  }
  else
  {
    if (up)
    {
      // Increment after
      address = parent->registers[rn];
      if (writeback)
      {
        parent->registers[rn] += bitsSet * 4;
      }
    }
    else
    {
      // Decrement after
      address = parent->registers[rn] - (bitsSet * 4) + 4;
      if (writeback) 
      {
        parent->registers[rn] -= bitsSet * 4;
      }
    }
  }

  if ((curInstruction & (1 << 20)) != 0)
  {
    if ((curInstruction & (1 << 22)) != 0 && ((curInstruction >> 15) & 1) == 0)
    {
      // Switch to user mode temporarily
      parent->WriteCpsr((curCpsr & ~0x1FU) | USR);
    }

    // Load multiple
    for (int8_t i = 0; i < 15; i++)
    {
      if (((curInstruction >> i) & 1) != 1) 
      {
        continue;
      }
      parent->registers[i] = parent->ReadU32Aligned(address & (~0x3U));
      address += 4;
    }

    if (((curInstruction >> 15) & 1) == 1)
    {
      // Arm9 fix here

      parent->registers[15] = parent->ReadU32Aligned(address & (~0x3U));

      if ((curInstruction & (1 << 22)) != 0)
      {
        // Load the CPSR from the SPSR
        if (parent->SPSRExists())
        {
          parent->WriteCpsr(parent->GetSPSR());
          UnpackFlags();

          // Check for branch back to Thumb Mode
          if ((parent->cpsr & parent->T_MASK) == parent->T_MASK)
          {
            thumbMode = true;
            parent->registers[15] &= ~0x1U;
            return;
          }
        }
      }

      parent->registers[15] &= ~0x3U;
      FlushQueue();
    }
    else
    {
      if ((curInstruction & (1 << 22)) != 0)
      {
        // Switch back to the correct mode
        parent->WriteCpsr(curCpsr);
        UnpackFlags();

        if ((parent->cpsr & parent->T_MASK) == parent->T_MASK)
        {
          thumbMode = true;
          return;
        }
      }
    }
  }
  else
  {
    if ((curInstruction & (1 << 22)) != 0)
    {
      // Switch to user mode temporarily
      parent->WriteCpsr((curCpsr & ~0x1FU) | USR);
    }

    if (((curInstruction >> (int32_t)rn) & 1) != 0 && writeback && (curInstruction & ~(0xFFFFFFFF << (int32_t)rn)) == 0)
    {
      // If the lowest register is also the writeback, we use the original value
      // Does anybody do this????
    }
    else
    {
      // Store multiple
      for (uint8_t i = 0; i < 15; i++)
      {
        if (((curInstruction >> i) & 1) == 0) 
        {
          continue;
        }
        parent->WriteU32(address, parent->registers[i]);
        address += 4;
      }

      if (((curInstruction >> 15) & 1) != 0)
      {
        parent->WriteU32(address, parent->registers[15] + 4U);
      }
    }

    if ((curInstruction & (1 << 22)) != 0)
    {
      // Switch back to the correct mode
      parent->WriteCpsr(curCpsr);
      UnpackFlags();
    }
  }
}

void ArmCore::Branch()
{
  if ((curInstruction & (1 << 24)) != 0)
  {
    parent->registers[14] = (parent->registers[15] - 4U) & ~3U;
  }

  uint32_t branchOffset = curInstruction & 0x00FFFFFF;
  if (branchOffset >> 23 == 1) 
  {
    branchOffset |= 0xFF000000;
  }

  parent->registers[15] += branchOffset << 2;

  FlushQueue();
}

void ArmCore::CoprocessorLoadStore()
{
  //Unhandled opcode - coproc load/store"
}

void ArmCore::SoftwareInterrupt()
{
  // Adjust PC for prefetch
  parent->registers[15] -= 4U;
  parent->EnterException(SVC, 0x8, false, false);
}

void ArmCore::MultiplyOrSwap()
{
  if ((curInstruction & (1 << 24)) == 1 << 24)
  {
    // Swap instruction
    uint32_t rn = (curInstruction >> 16) & 0xF;
    uint32_t rd = (curInstruction >> 12) & 0xF;
    uint32_t rm = curInstruction & 0xF;

    if ((curInstruction & (1 << 22)) != 0)
    {
      // SWPB
      uint8_t tmp = parent->ReadU8(parent->registers[rn]);
      parent->WriteU8(parent->registers[rn], (uint8_t)(parent->registers[rm] & 0xFF));
      parent->registers[rd] = tmp;
    }
    else
    {
      // SWP
      uint32_t tmp = parent->ReadU32(parent->registers[rn]);
      parent->WriteU32(parent->registers[rn], parent->registers[rm]);
      parent->registers[rd] = tmp;
    }
  }
  else
  {
    // Multiply instruction
    switch ((curInstruction >> 21) & 0x7)
    {
      case 0:
      case 1:
        {
          // Multiply/Multiply + Accumulate
          uint32_t rd = (curInstruction >> 16) & 0xF;
          uint32_t rn = parent->registers[(curInstruction >> 12) & 0xF];
          uint32_t rs = (curInstruction >> 8) & 0xF;
          uint32_t rm = curInstruction & 0xF;

          int32_t cycles = 4;
          // Multiply cycle calculations
          if ((parent->registers[rs] & 0xFFFFFF00) == 0 || (parent->registers[rs] & 0xFFFFFF00) == 0xFFFFFF00)
          {
            cycles = 1;
          }
          else if ((parent->registers[rs] & 0xFFFF0000) == 0 || (parent->registers[rs] & 0xFFFF0000) == 0xFFFF0000)
          {
            cycles = 2;
          }
          else if ((parent->registers[rs] & 0xFF000000) == 0 || (parent->registers[rs] & 0xFF000000) == 0xFF000000)
          {
            cycles = 3;
          }

          parent->registers[rd] = parent->registers[rs] * parent->registers[rm];
          parent->Cycles -= cycles;

          if ((curInstruction & (1 << 21)) == 1 << 21)
          {
            parent->registers[rd] += rn;
            parent->Cycles -= 1;
          }

          if ((curInstruction & (1 << 20)) == 1 << 20)
          {
            negative = parent->registers[rd] >> 31;
            zero = parent->registers[rd] == 0 ? 1U : 0U;
          }
          break;
        }

      case 2:
      case 3:
        //throw new Exception("Invalid multiply");
        break;
      case 4:
      case 5:
      case 6:
      case 7:
        {
          // Multiply/Signed Multiply Long
          uint32_t rdhi = (curInstruction >> 16) & 0xF;
          uint32_t rdlo = (curInstruction >> 12) & 0xF;
          uint32_t rs = (curInstruction >> 8) & 0xF;
          uint32_t rm = curInstruction & 0xF;

          int32_t cycles = 5;
          // Multiply cycle calculations
          if ((parent->registers[rs] & 0xFFFFFF00) == 0 || (parent->registers[rs] & 0xFFFFFF00) == 0xFFFFFF00)
          {
            cycles = 2;
          }
          else if ((parent->registers[rs] & 0xFFFF0000) == 0 || (parent->registers[rs] & 0xFFFF0000) == 0xFFFF0000)
          {
            cycles = 3;
          }
          else if ((parent->registers[rs] & 0xFF000000) == 0 || (parent->registers[rs] & 0xFF000000) == 0xFF000000)
          {
            cycles = 4;
          }

          parent->Cycles -= cycles;

          switch ((curInstruction >> 21) & 0x3)
          {
            case 0:
              {
                // UMULL
                uint64_t result = ((uint64_t)parent->registers[rm]) * parent->registers[rs];
                parent->registers[rdhi] = (uint32_t)(result >> 32);
                parent->registers[rdlo] = (uint32_t)(result & 0xFFFFFFFF);
                break;
              }
            case 1:
              {
                // UMLAL
                uint64_t accum = (((uint64_t)parent->registers[rdhi]) << 32) | parent->registers[rdlo];
                uint64_t result = ((uint64_t)parent->registers[rm]) * parent->registers[rs];
                result += accum;
                parent->registers[rdhi] = (uint32_t)(result >> 32);
                parent->registers[rdlo] = (uint32_t)(result & 0xFFFFFFFF);
                break;
              }
            case 2:
              {
                // SMULL
                int64_t result = ((int64_t)((int32_t)parent->registers[rm])) * ((int64_t)((int32_t)parent->registers[rs]));
                parent->registers[rdhi] = (uint32_t)(result >> 32);
                parent->registers[rdlo] = (uint32_t)(result & 0xFFFFFFFF);
                break;
              }
            case 3:
              {
                // SMLAL
                int64_t accum = (((int64_t)((int32_t)parent->registers[rdhi])) << 32) | parent->registers[rdlo];
                int64_t result = ((int64_t)((int32_t)parent->registers[rm])) * ((int64_t)((int32_t)parent->registers[rs]));
                result += accum;
                parent->registers[rdhi] = (uint32_t)(result >> 32);
                parent->registers[rdlo] = (uint32_t)(result & 0xFFFFFFFF);
                break;
              }
          }

          if ((curInstruction & (1 << 20)) == 1 << 20)
          {
            negative = parent->registers[rdhi] >> 31;
            zero = (parent->registers[rdhi] == 0 && parent->registers[rdlo] == 0) ? 1U : 0U;
          }
          break;
        }
    } 
  }
}

void ArmCore::LoadStoreHalfword()
{
  uint32_t rn = (curInstruction >> 16) & 0xF;
  uint32_t rd = (curInstruction >> 12) & 0xF;

  uint32_t address = parent->registers[rn];

  bool preIndexed = (curInstruction & (1 << 24)) != 0;
  bool byteTransfer = (curInstruction & (1 << 5)) == 0;
  bool signedTransfer = (curInstruction & (1 << 6)) != 0;
  bool writeback = (curInstruction & (1 << 21)) != 0;

  uint32_t offSet;
  if ((curInstruction & (1 << 22)) != 0)
  {
    // Immediate offset
    offSet = ((curInstruction & 0xF00) >> 4) | (curInstruction & 0xF);
  }
  else
  {
    // Register offset
    offSet = parent->registers[curInstruction & 0xF];
  }

  // Add or subtract offset
  if ((curInstruction & (1 << 23)) == 0) offSet = (uint32_t)-offSet;

  if (preIndexed)
  {
    address += offSet;

    if (writeback)
    {
      parent->registers[rn] = address;
    }
  }

  if ((curInstruction & (1 << 20)) != 0)
  {
    // Load
    if (byteTransfer)
    {
      if (signedTransfer)
      {
        parent->registers[rd] = parent->ReadU8(address);
        if ((parent->registers[rd] & 0x80) != 0)
        {
          parent->registers[rd] |= 0xFFFFFF00;
        }
      }
      else
      {
        parent->registers[rd] = parent->ReadU8(address);
      }
    }
    else
    {
      if (signedTransfer)
      {
        parent->registers[rd] = parent->ReadU16(address);
        if ((parent->registers[rd] & 0x8000) != 0)
        {
          parent->registers[rd] |= 0xFFFF0000;
        }
      }
      else
      {
        parent->registers[rd] = parent->ReadU16(address);
      }
    }

    if (rd == 15)
    {
      parent->registers[rd] &= ~3U;
      FlushQueue();
    }

    if (!preIndexed)
    {
      if (rn != rd)
      {
        parent->registers[rn] = address + offSet;
      }
    }
  }
  else
  {
    // Store
    if (byteTransfer)
    {
      parent->WriteU8(address, (uint8_t)(parent->registers[rd] & 0xFF));
    }
    else
    {
      parent->WriteU16(address, (uint16_t)(parent->registers[rd] & 0xFFFF));
    }

    if (!preIndexed)
    {
      parent->registers[rn] = address + offSet;
    }
  }
}

void ArmCore::PackFlags()
{
  parent->cpsr &= 0x0FFFFFFF;
  parent->cpsr |= negative << parent->N_BIT;
  parent->cpsr |= zero << parent->Z_BIT;
  parent->cpsr |= carry << parent->C_BIT;
  parent->cpsr |= overFlow << parent->V_BIT;
}

void ArmCore::UnpackFlags()
{
  negative = (parent->cpsr >> parent->N_BIT) & 1;
  zero = (parent->cpsr >> parent->Z_BIT) & 1;
  carry = (parent->cpsr >> parent->C_BIT) & 1;
  overFlow = (parent->cpsr >> parent->V_BIT) & 1;
}

void ArmCore::FlushQueue()
{
  instructionQueue = parent->ReadU32(parent->registers[15]);
  parent->registers[15] += 4;
}



