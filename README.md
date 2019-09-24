# Oculus_Touch_To_Keyboard
*Disclaimer: This is very unpolished at the moment.
========================================================
Making it work:
--------------------------------------------------------
Maps imputs from Oculus Touch controllers to keyboard/mouse inputs.
This only works for oculus touch controllers

These scripts require the use of another project, auto_oculus_touch.
https://github.com/rajetic/auto_oculus_touch

After downloading and unzipping Auto_Oculus_touch, simply cut/paste my files into 
.../auto_oculus_touch/bin/
If you're unsure, there should be a bunch of other .ahk files in that folder.

=======================================================
Different Profiles:
------------------------------------------------------
The Master Profile is just used to get all inputs and is recommended ONLY for experimentation. 
You can adapt it as you need to assign basically any button/trigger/joystick axis to any keyboard key or mouse motion.
It could theoretically be used if you were OK setting up nonscencical keybinds.

The Doom profile is meant for playing Doom 2016 in VR with the oculus Touch Controllers. In order to have the game in your headset though, you'll probably need vorpX (https://www.vorpx.com/)
Unique Motion Controls: 
    -Raising both controllers up = spacebar (Assign spacebar to jump)
        i.e. for jumping in game, make a jumping motion with your hands)
    -Punching with controller in hand = b (assign b to melee)
        In order for the punches to be detected as punches, they need to be done a specific way. 
        With your right hand, imagine punching the side of a ball at head-height so that it would move left after you punch it. This is the arc your hand needs to follow.
        Also make sure as you punch that the back of your hand rotates towards you.
        
        While there is a bit of tolerance built in, if you don't punch this way, it won't reliably be detected.


In the immediate future, if you want the keybinds, look at the code using notepad. Later, I will make a list of what buttons, triggers, and gyroscope motions correspond to what keys. 
