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

#include "SoundManager.h"
#include "Arm7.h"

const int cpuFreq = 16 * 1024 * 1024;
Processor *parents;

#define SOUNDCNT_L 0x80
#define SOUNDCNT_H 0x82
#define SOUNDCNT_X 0x84

#define FIFO_A_L 0xA0
#define FIFO_A_H 0xA2
#define FIFO_B_L 0xA4
#define FIFO_B_H 0xA6

#define ioRegStart  0x00048000 //0x48000 - 0x484FF = 0x4FF

SoundManager::SoundManager() {}

void SoundManager::StartSM(int32_t Frequency, class Processor *par)
{
  SetFrequency(Frequency);
  parents = par;
}

int32_t SoundManager::GetFrequency()
{
  return Frequency;
}

void SoundManager::SetFrequency(int32_t value)
{
  Frequency = value;
  cyclesPerSample = (cpuFreq << 5) / Frequency;
}

int32_t SoundManager::QueueSizeA()
{
  return 32;
}

int32_t SoundManager::QueueSizeB()
{
  return 32;
}

void SoundManager::GetSample(int16_t Buffer[], int32_t Length)
{
  for (int32_t i = 0; i < Length; i++)
  {
    if (lastSoundBufferPos == sizeof(soundBuffer)/sizeof(int16_t))
    {
      lastSoundBufferPos = 0;
    }
    Buffer[i] = soundBuffer[lastSoundBufferPos++];
  }
}

void SoundManager::Mix(int32_t cycles)
{
  uint16_t soundCntH = parents->ReadU16(SOUNDCNT_H, ioRegStart);
  uint16_t soundCntX = parents->ReadU16(SOUNDCNT_X, ioRegStart);

  cycles <<= 5;
  cycles += leftover;

  if (cycles > 0)
  {
    // Precompute loop invariants
    uint16_t directA = (uint16_t)(uint8_t)(latchedA);
    uint16_t directB = (uint16_t)(uint8_t)(latchedB);

    if ((soundCntH & (1 << 2)) == 0)
    {
      directA >>= 1;
    }
    if ((soundCntH & (1 << 3)) == 0)
    {
      directB >>= 1;
    }

    while (cycles > 0)
    {
      uint16_t l = 0;
      uint16_t r = 0;

      cycles -= cyclesPerSample;

      // Mixing
      if ((soundCntX & (1 << 7)) != 0)
      {
        if ((soundCntH & (1 << 8)) != 0)
        {
          r += directA;
        }
        if ((soundCntH & (1 << 9)) != 0)
        {
          l += directA;
        }
        if ((soundCntH & (1 << 12)) != 0)
        {
          r += directB;
        }
        if ((soundCntH & (1 << 13)) != 0)
        {
          l += directB;
        }
      }

      if (soundBufferPos == sizeof(soundBuffer)/sizeof(int16_t))
      {
        soundBufferPos = 0;
      }

      soundBuffer[soundBufferPos++] = (uint16_t)(l << 6);
      soundBuffer[soundBufferPos++] = (uint16_t)(r << 6);
      }
  }
  leftover = cycles;
}

void SoundManager::ResetFifoA()
{
  for(uint8_t i = 0; i < 32; i++)
  {
    soundQueue[0][i] = 0;
  }
  latchedA = 0;
}

void SoundManager::ResetFifoB()
{
  for(uint8_t i = 0; i < 32; i++)
  {
    soundQueue[1][i] = 0;
  }
  latchedB = 0;
}

void SoundManager::IncrementFifoA()
{
  for (uint8_t i = 0; i < 4; i++)
  {
    EnqueueDSoundSample(0, parents->ReadU8(FIFO_A_L + i, ioRegStart));
  }
}

void SoundManager::IncrementFifoB()
{
  for (uint8_t i = 0; i < 4; i++)
  {
    EnqueueDSoundSample(1, parents->ReadU8(FIFO_B_L + i, ioRegStart));
  }
}

void SoundManager::DequeueA()
{
  if (soundQueueACount > 0)
  {
    latchedA = soundQueue[0][0];
    soundQueueACount--;
    
    for(uint8_t i = 0; i < 31; i++)
    {
      soundQueue[0][i] = soundQueue[0][i+1];
    }

    soundQueue[0][31] = 0;
  }
}

void SoundManager::DequeueB()
{
  if (soundQueueBCount > 0)
  {
    latchedB = soundQueue[1][0];
    soundQueueBCount--;
        
    for(uint8_t i = 0; i < 31; i++)
    {
      soundQueue[1][i] = soundQueue[1][i+1];
    }

    soundQueue[1][31] = 0;
  }
}

void SoundManager::EnqueueDSoundSample(uint8_t channel, uint8_t sample)
{
  if(channel == 0 && soundQueueACount < 31)
  {
    soundQueueACount++;
    soundQueue[0][soundQueueACount] = sample;
  }
  else if(channel == 1 && soundQueueBCount < 31)
  {
    soundQueueBCount++;
    soundQueue[0][soundQueueBCount] = sample;
  }
}





