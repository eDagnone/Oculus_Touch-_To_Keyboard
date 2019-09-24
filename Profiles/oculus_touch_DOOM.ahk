#include auto_oculus_touch.ahk
#CommentFlag //

SendMode Input
// Start the Oculus sdk.
InitOculus()
motion:= 1
DllCall("auto_oculus_touch\poll")
ResetFacing(0)
ResetFacing(1)
lastRightYaw :=0
lastRightRoll:=0
swingingFrames:=0
// Main polling loop.

Loop {
    Poll()
	
	//Analogue values

	leftIndexTrigger  := GetTrigger(LeftHand,  IndexTrigger)
    leftHandTrigger   := GetTrigger(LeftHand,  HandTrigger)
    rightIndexTrigger := GetTrigger(RightHand, IndexTrigger)
    rightHandTrigger  := GetTrigger(RightHand, HandTrigger)
    leftThumbX        := GetThumbStick(LeftHand, XAxis)
    leftThumbY        := GetThumbStick(LeftHand, YAxis)
    rightThumbX       := GetThumbStick(RightHand, XAxis)
    rightThumbY       := GetThumbStick(RightHand, YAxis)

	//Digital Values
	
    down     := GetButtonsDown()
    //pressed  := GetButtonsPressed()
    //released := GetButtonsReleased()
	
	//Bind Oculus touch inputs to physical keys
	
	if (rightIndexTrigger > 0.5)
        Send, {LButton down}
	else
		Send, {LButton up}
	if (leftIndexTrigger > 0.5)
		Send, {e down}
	else
		Send, {e up}
	if(leftHandTrigger > 0.5)
		Send, {Ctrl down}
	else
		Send, {Ctrl up}
	if(RightHandTrigger > 0.5)
		Send, {p down}
	else
		Send, {p up}
	if(leftThumbX > 0.4)
		Send, {d down}
	else
		Send, {d up}
	if(leftThumbX < -0.4)
		Send, {a down}
	else
		Send, {a up}
	if(leftThumbY > 0.4)
		Send, {w down}
	else
		Send, {w up}
	if(leftThumbY < -0.4)
		Send, {s down}
	else
		Send, {s up}
	
	if(rightThumbX > 0.4)
		Send, {x down}
	else
		Send, {x up}
	if(rightThumbX < -0.4)
		Send, {z down}
	else
		Send, {z up}
	if(rightThumbY > 0.4)
		Send, {F1 down}
	else
		Send, {F1 up}
	if(rightThumbY < -0.4)
		Send, {F2 down}
	else
		Send, {F2 up}
	
	if down & ovrA
		Send, {i down}
	else
		Send, {i up}
	if down & ovrB
		Send, {f down}
	else
		Send, {f up}
	if down & ovrX
		Send, {r down}
	else
		Send, {r up}
	if down & ovrY
		Send, {b down}
	else
		Send, {b up}

	if down & ovrLThumb
		Send, {m down}
	else
		Send, {m up}
	if down & ovrRThumb
		Send, {c down}
	else
		Send, {c up}
	
	//Pitch: aiming up is positive
	//Roll: tilting clockwise is positive
	//Yaw: Clockwise is positive
	//All given in degrees
	
	if(motion = 1)
	{
		rightRoll:=GetRoll(1)
		rightPitch:= GetPitch(1)
		leftRoll:=GetRoll(0)
		leftPitch:= GetPitch(0)
		rightYaw:= GetYaw(1)
		

		//Jump
		if rightPitch>30
		{
			if leftPitch>30
				Send, {Space down}
		}
		else
		{
			Send, {Space up}
		}
		
		//Punch
		if(lastRightRoll-rightRoll > 0.9)
		{
			if(rightPitch-lastRightPitch >0.2)
			{
			if((swingingFrames > 7) & (leftPitch < 20)){
				Send, {b down}
				swingingFrames = 0
				}
			else
				swingingFrames++				
			}
		}
		else
		{
			Send, {b up}
			swingingframes := 0
		}
	lastRightRoll := rightRoll
	lastRightPitch := rightPitch
	}
	
	Sleep, 10	
}
