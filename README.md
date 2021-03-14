# Godot-floating-origin
 A floating origin system example for godot 3.X and up


This project serves as an example for how to create a floating origin system for large worlds in Godot engine. It eliminates floating point precision errors.

## Usage in your own project
 Make sure all your 3D spatial elements are under a single parent spatial node and attach the ```floatingOrigin.gd``` script and set the threshold value. (about 1000 is fine)

 If you aren't sure about what that means, have a look at the example project first.

## How does it work?
 The 3D world is all parented under a single root spatial node. When the main viewport camera moves a certain distance away from the world origin the root spatial node is shifted to the camera's position.

 This keeps the visible world centered around the camera, allowing for high floating point precision.


## Known issues
I haven't found any yet so let me know if you try it out and find something.

This system isn't perfect and is more of a proof of concept at the moment but should work as intended.
