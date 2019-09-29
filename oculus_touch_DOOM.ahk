#include auto_oculus_touch.ahk
#CommentFlag //

SendMode Input
InitOculus()

ResetFacing(0)
ResetFacing(1)
lastRightYaw :=0
lastRightRoll:=0
swingingFrames:=0
m:= 0
weapon_switch_cooldown := 0

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
	if (leftHandTrigger > 0.5)
		Send, {Ctrl down}
	else
		Send, {Ctrl up}
	
	//For Left index Trigger, 
	//see weapon wheel.
	
	if(RightHandTrigger > 0.5)
		Send, {p down}
	else
		Send, {p up}
	
	//Left Thumbstick Positions
	
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
//WEAPON WHEEL
		if (leftIndexTrigger > 0.4)
		{
			//Assign slope, take care of undefined cases
			if (rightThumbX != 0)
				m:=rightThumbY/rightThumbX
			else
			{
				if(rightThumbY >0.4)
					Send, 2
				else if (rightThumbY < -0.4)
					Send, 7
			}
			//Check if within 0.4u range, then map based on slope of line
			if(rightThumbX*rightThumbX + rightThumbY*rightThumbY > 0.16)
			{
				if rightThumbY>=0
				{
					if(m<-2.077 || m>2.077)
						Send, 2
					else if(m > 0.228)
						Send, 4
					else if(m > 0)
						Send, 6
					else if( m < -0.228)
						Send, 9
					else
						Send, 8
				}
				else
				{
					if(m<-0.797)
						Send, 5
					else if(m<0)
						Send, 6
					else if(m>0.797)
						Send, 7
					else
						Send, 8
				}
				weapon_switch_cooldown:= 20
			}
			else if weapon_switch_cooldown == 0		
				Send, r
		}
		else if (down & ovrRThumb)
			Send, 3
		else if(weapon_switch_cooldown < 10)
		{
			//Right Thumbstick Positions
	
			if(rightThumbX > 0.8)
				Send, {x down}
			else
				Send, {x up}
			if(rightThumbX < -0.8)
				Send, {z down}
			else
				Send, {z up}
			if(rightThumbY > 0.8)
				Send, {F1 down}
			else
				Send, {F1 up}
			if(rightThumbY < -0.8)
				Send, {F2 down}
			else
				Send, {F2 up}
		}
	}

	//ABXY
	if down & ovrA
		Send, {1 down}
	else
		Send, {1 up}
	if down & ovrB
		Send, {f down}
	else
		Send, {f up}
	if down & ovrX
	{
		Send, {TAB}
		Sleep, 200
	}
	else
		Send, {TAB up}
	if down & ovrY
		Send, {e down}
	else
		Send, {e up}
	

	//Motion Controls Section
	
	//Pitch: aiming up is positive
	//Roll: tilting clockwise is positive
	//Yaw: Clockwise is positive
	//All given in degrees
	
	rightRoll:=GetRoll(1)
	rightPitch:= GetPitch(1)
	leftRoll:=GetRoll(0)
	leftPitch:= GetPitch(0)
		

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
	
	
	
	
	if (weapon_switch_cooldown > 0)
		weapon_switch_cooldown--
	Sleep, 10	
}
