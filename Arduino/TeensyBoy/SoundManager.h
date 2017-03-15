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

#ifndef SoundManager_h
#define SoundManager_h

#include <inttypes.h>

class SoundManager
{
  public:
    //Variables
    uint8_t soundQueue[2][32];
    uint8_t soundQueueACount = 0;
    uint8_t soundQueueBCount = 0;
    uint8_t latchedA;
    uint8_t latchedB;
    int32_t Frequency;
    int32_t cyclesPerSample;
    int32_t leftover = 0;

    int16_t soundBuffer[4000];
    int32_t soundBufferPos = 0;
    int32_t lastSoundBufferPos = 0;

    //Methods
    SoundManager();
    void StartSM(int32_t Frequency, class Processor *par);
    int32_t GetFrequency();
    void SetFrequency(int32_t value);
    int32_t QueueSizeA();
    int32_t QueueSizeB();
    void GetSample(int16_t Buffer[], int32_t Length);
    void Mix(int32_t cycles);
    void ResetFifoA();
    void ResetFifoB();
    void IncrementFifoA();
    void IncrementFifoB();
    void DequeueA();
    void DequeueB();
    void EnqueueDSoundSample(uint8_t channel, uint8_t sample);
};

#endif


