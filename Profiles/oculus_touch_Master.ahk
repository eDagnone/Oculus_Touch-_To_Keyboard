#include auto_oculus_touch.ahk

SendMode Input
; Start the Oculus sdk.
InitOculus()
motion:= 1
DllCall("auto_oculus_touch\poll")
ResetFacing(0)
ResetFacing(1)

; Main polling loop.

Loop {
    Poll()
	
	;Analogue values
	
	leftIndexTrigger  := GetTrigger(LeftHand,  IndexTrigger)
    leftHandTrigger   := GetTrigger(LeftHand,  HandTrigger)
    rightIndexTrigger := GetTrigger(RightHand, IndexTrigger)
    rightHandTrigger  := GetTrigger(RightHand, HandTrigger)
    leftThumbX        := GetThumbStick(LeftHand, XAxis)
    leftThumbY        := GetThumbStick(LeftHand, YAxis)
    rightThumbX       := GetThumbStick(RightHand, XAxis)
    rightThumbY       := GetThumbStick(RightHand, YAxis)

	;Digital Values
	
    down     := GetButtonsDown()
    ;pressed  := GetButtonsPressed()
    ;released := GetButtonsReleased()
	
	
	;Bind Oculus touch inputs to physical keys
	
	if (rightIndexTrigger > 0.5)
        Send, {q down}
	else
		Send, {q up}
	if (leftIndexTrigger > 0.5)
		Send, {w down}
	else
		Send, {w up}
	if(leftHandTrigger > 0.5)
		Send, {e down}
	else
		Send, {e up}
	if(RightHandTrigger > 0.5)
		Send, {r down}
	else
		Send, {r up}
	
	if(leftThumbX > 0.4)
		Send, {u down}
	else
		Send, {u up}
	if(leftThumbX < -0.4)
		Send, {i down}
	else
		Send, {i up}
	if(leftThumbY > 0.4)
		Send, {o down}
	else
		Send, {o up}
	if(leftThumbY < -0.4)
		Send, {p down}
	else
		Send, {p up}
	
	if(rightThumbX > 0.4)
		Send, {h down}
	else
		Send, {h up}
	if(rightThumbX < -0.4)
		Send, {j down}
	else
		Send, {j up}
	if(rightThumbY > 0.4)
		Send, {k down}
	else
		Send, {k up}
	if(rightThumbY < -0.4)
		Send, {l down}
	else
		Send, {l up}
	
	if down & ovrA
		Send, {a down}
	else
		Send, {a up}
	if down & ovrB
		Send, {b down}
	else
		Send, {b up}
	if down & ovrX
		Send, {x down}
	else
		Send, {x up}
	if down & ovrY
		Send, {y down}
	else
		Send, {y up}

	if down & ovrLThumb
		Send, {n down}
	else
		Send, {n up}
	if down & ovrRThumb
		Send, {m down}
	else
		Send, {m up}
	
	;Pitch: aiming up is positive
	;Roll: tilting clockwise is positive
	;Yaw sucks
	
	if(motion = 1)
	{
		rightRoll:=GetRoll(1)
		rightPitch:= GetPitch(1)
		leftRoll:=GetRoll(0)
		leftPitch:= GetPitch(0)
		
		if leftRoll<-90
			Send, {1 down}
		else
			Send, {1 up}
		if leftRoll>70
			Send, {2 down}
		else
			Send, {2 up}
		if rightRoll<-40
			Send, {3 down}
		else
			Send, {3 up}
		if rightRoll>40
			Send, {4 down}
		else
			Send, {4 up}
		
		if leftPitch>30
		{
			if rightPitch>30
				Send, {9 down}
			else 
			{
				if leftPitch>50
					Send, {5 down}
			}
			
		}
		else
		{
			Send, {5 up}
			Send, {9 up}
		}
		
		if leftPitch>50
			Send, {5 down}
		else
			Send, {5 up}
		if leftPitch<-50
			Send, {6 down}
		else
			Send, {6 up}
		if rightPitch>30
			Send, {7 down}
		else
			Send, {7 up}
		if rightPitch<-30
			Send, {8 down}
		else
			Send, {8 up}
	}
	
	Sleep, 10
	
}
