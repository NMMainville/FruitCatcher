package
{
	import org.flixel.*;
 
	public class CameraObject extends FlxSprite
	{	
		//------------------------------------------DECLARATIONS---------------------------------------------

		//----------------------------------------CREATE FUNCTION--------------------------------------------
		public function CameraObject(X: int, Y: int):void //X and Y define starting position of the player
		{
			super(X, Y); //x and y position of the player
		}
		
		override public function update():void //update function
		{
			//------------------------------------------ANIMATIONS-----------------------------------------------
			//-------------------------------------------MOVEMENT------------------------------------------------
			super.update();
		}
	}
}