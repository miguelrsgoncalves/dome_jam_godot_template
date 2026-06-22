QUICK GUIDE

	A template scene can be found inside the template folder.

1. SETTING UP A SCENE

	To setup any scene, just copy and paste the Camera3D and its children (Camera360 and SubViewport) into your new scene.
	
	Nodes:
	
		- Camera3D: The node that will control where you are looking. The script can be replace by any other. The template script will let you control this camera as a flying camera for testing.
		
		- Camera360: This is the camera that will render the game view into a 180º dome view. The only settings you should change are the Clip Near and Clip Far, all the rest should be left as they are.
		
		- SubViewport: This is the viewport the 180º dome view will be rendered to.
	
	For testing purposes, the Camera360 can be hidden from the node tree using the Editor Inspector, which will enable the view of the normal Camera3D.
	
	The Cullmask Layer 20 needs to be left solely for the Camera360.


The Camera360 repo can be found at https://github.com/Cykyrios/Godot360 for full documentation on the plugin.
