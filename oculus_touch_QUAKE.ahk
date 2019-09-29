#include auto_oculus_touch.ahk
#CommentFlag //

SendMode Input
InitOculus()

ResetFacing(0)
ResetFacing(1)
lastRightYaw :=0
lastRightRoll:=0
swingingFrames:=0

DllCall("auto_oculus_touch\poll")


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
	
	//Triggers
	if (rightIndexTrigger > 0.5)
        Send, {LButton down}
	else
		Send, {LButton up}
	if (leftIndexTrigger > 0.5)
		Send, {1 down}
	else
		Send, {1 up}
	if(leftHandTrigger > 0.5)
		Send, {e down}
	else
		Send, {e up}
	if(RightHandTrigger > 0.5)
		Send, {p down}
	else
		Send, {p up}
	
	//Left Thumbstick Positions
	
	if(leftThumbX > 0.1)
		Send, {d down}
	else
		Send, {d up}
	if(leftThumbX < -0.1)
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
	
	//Right Thumbstick Positions
	
	if(rightThumbX > 0.4)
		Send, {3 down}
	else
		Send, {3 up}
	if(rightThumbX < -0.4)
		Send, {5 down}
	else
		Send, {5 up}
	if(rightThumbY > 0.4)
		Send, {2 down}
	else
		Send, {2 up}
	if(rightThumbY < -0.4)
		Send, {4 down}
	else
		Send, {4 up}
	
	//ABXY
	if down & ovrA
		Send, {Space down}
	else
		Send, {Space up}
	if down & ovrB
		Send, {q down}
	else
		Send, {q up}
	if down & ovrX
		Send, {f down}
	else
		Send, {f up}
	if down & ovrY
		Send, {f down}
	else
		Send, {f up}
	
	//Thumbstick buttons
	if (down & ovrLThumb){
		if (down & ovrRThumb)
		{
			Sendlevel 1
			Send {Esc}
			Sleep, 200
			Sendlevel 0
		}
		else
			Send, {c down}
	}
	else{

		Send, {c up}
			
		if down & ovrRThumb
			Send, {r down}
		else
			Send, {r up}
	}
	
	//Motion Controls Section
	
	//Pitch: aiming up is positive
	//Roll: tilting clockwise is positive
	//Yaw: Clockwise is positive
	//All given in degrees
	
	rightRoll:=GetRoll(1)
	rightPitch:= GetPitch(1)
	leftRoll:=GetRoll(0)
	leftPitch:= GetPitch(0)
	rightYaw:= GetYaw(1)
		

	//Jump
	if rightPitch>50
	{
		if leftPitch>50
			Send, {Tab down}
		}
	else
	{
		Send, {Tab up}
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
	
	Sleep, 10	
}
