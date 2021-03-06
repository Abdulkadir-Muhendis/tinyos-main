/*
 * Copyright (c) 2007, Vanderbilt University
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * - Redistributions of source code must retain the above copyright
 *   notice, this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in the
 *   documentation and/or other materials provided with the
 *   distribution.
 * - Neither the name of the copyright holder nor the names of
 *   its contributors may be used to endorse or promote products derived
 *   from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL
 * THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * Author: Miklos Maroti
 */

#include <RadioConfig.h>

#ifdef TFRAMES_ENABLED
#error "You cannot use Ieee154MessageC with TFRAMES_ENABLED defined"
#endif

configuration RF230Ieee154MessageC
{
	provides 
	{
		interface SplitControl;

		interface Ieee154Send;
		interface Receive as Ieee154Receive;
		interface SendNotifier;

		interface Ieee154Packet;
		interface Packet;
		interface Resource as SendResource[uint8_t clint];

		interface PacketAcknowledgements;
		interface LowPowerListening;
		interface PacketLink;

		interface RadioChannel;

		interface PacketField<uint8_t> as PacketLinkQuality;
		interface PacketField<uint8_t> as PacketTransmitPower;
		interface PacketField<uint8_t> as PacketRSSI;

		interface LocalTime<TRadio> as LocalTimeRadio;
		interface PacketTimeStamp<TRadio, uint32_t> as PacketTimeStampRadio;
		interface PacketTimeStamp<TMilli, uint32_t> as PacketTimeStampMilli;
	}
}

implementation
{
	components RF230RadioC;

	SplitControl = RF230RadioC;

	Ieee154Send = RF230RadioC.Ieee154Send;
	Ieee154Receive = RF230RadioC.Ieee154Receive;
	SendNotifier = RF230RadioC.Ieee154Notifier;

	Packet = RF230RadioC.PacketForIeee154Message;
	Ieee154Packet = RF230RadioC;
	SendResource = RF230RadioC;

	PacketAcknowledgements = RF230RadioC;
	LowPowerListening = RF230RadioC;
	PacketLink = RF230RadioC;

	RadioChannel = RF230RadioC;

	PacketLinkQuality = RF230RadioC.PacketLinkQuality;
	PacketTransmitPower = RF230RadioC.PacketTransmitPower;
	PacketRSSI = RF230RadioC.PacketRSSI;

	LocalTimeRadio = RF230RadioC;
	PacketTimeStampMilli = RF230RadioC;
	PacketTimeStampRadio = RF230RadioC;
}
