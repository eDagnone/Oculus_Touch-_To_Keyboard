# Oculus_Touch_To_Keyboard
*Disclaimer: This is very unpolished at the moment.

__Making it work:__

These scripts help map imputs from Oculus Touch VR controllers to keyboard/mouse inputs.
They were made for gaming, but can be used in desktop viewers, for random hotkeys, or for whatever else your heart desires.
Please note that these specific scripts will only work for oculus touch controllers.

These scripts require the use of another project, auto_oculus_touch.
https://github.com/rajetic/auto_oculus_touch

After downloading and unzipping Auto_Oculus_touch, simply cut/paste my files into 
...wherever you unzipped the file to.../auto_oculus_touch/bin/
If you're unsure, there should be a bunch of other .ahk files in that folder.

Once my scripts are there, they can be run. 

Just make sure to have your Oculus rift plugged in and the Oculus app open when you run any .ahk script. Otherwise, the script will do nothing.

__Different Profiles:__

The Master Profile is just used to get all inputs and is recommended ONLY for development and experimentation. 
By simply changing the variables, you can use it as a template to create your own profiles. It can be used to assign basically any button/trigger/joystick axis to any keyboard key or mouse motion.
As is though, the keybinds are mostly nonscencical.

The Doom profile is meant for playing Doom 2016 in VR with the oculus Touch Controllers. In order to have the game in your headset though, you'll probably need vorpX (https://www.vorpx.com/)
Unique Controls:

- Raising both controllers up = spacebar (Assign spacebar to jump)
     - i.e. for jumping in game, make a jumping motion with your hands
- Punching with controller in hand = b (assign b to melee)
     - In order for the punches to be detected as punches, they need to be done a specific way. 
     - With your right hand, punch at a slightly upward angle.
     - As you punch, make sure your palm rotates downward, and the back of your hand faces up towards the ceiling.
     - While there is a bit of tolerance built in, if you don't punch this way, it won't reliably be detected.
     
- Weapon switching can be handled by holding down the left index trigger while simultaneously moving the right thumbstick to certian "zones". 
     - Ex. Left Index Trigger + \[thumbstick up\] = 2.       Left Index Trigger + Thumbstick \[up, right 51 degrees\] = 4. 
     - The "zones" for seperate keys are about 51 degrees apart.
 

The Quake Profile is for Quake Champions. It is very similar to the Doom profile, but lacks the punch control. Weapon switching is similar in the regard that the thumbstick needs to be moved to certian zones, but different in the fact that you do not need to hold down the right index trigger, and each weapon's "zone" is 90 degrees apart.

In the immediate future, if you want the keybinds, look at the code using notepad. Later, I will make a list of what buttons, triggers, and gyroscope motions correspond to what keys. 
