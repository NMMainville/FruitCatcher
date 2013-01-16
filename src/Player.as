package
{
	import org.flixel.*;
 
	public class Player extends FlxSprite
	{	
		//------------------------------------------DECLARATIONS---------------------------------------------
		[Embed(source = "../data/sprites.png")] public var playerSprites:Class; //player sprites
		private var zHeld:Boolean = false;

		//----------------------------------------CREATE FUNCTION--------------------------------------------
		public function Player(X: int, Y: int):void //X and Y define starting position of the player
		{
			super(X, Y); //x and y position of the player
			//Create player
			loadGraphic(playerSprites, true, true, 16, 16, false);
			
			//Adjust size
			//offset.x = 11;
			//offset.y = 7;
			//width = 20;
			//height = 45;
			
			//origin.x = 10;
			//origin.y = 45;
			
			maxVelocity.x = 40; //maximum speed in the x direction
			maxVelocity.y = 40; //maximum speed in the y direction
			acceleration.y = 50; //player gravity
			
			//Animations
			addAnimation("idle", [14]);
			play("idle");
		}
		
		override public function update():void //update function
		{
			//------------------------------------------ANIMATIONS-----------------------------------------------
			//-------------------------------------------MOVEMENT------------------------------------------------
			if (isTouching(FlxObject.FLOOR)) velocity.x = 0;
			if (FlxG.keys.LEFT && isTouching(FlxObject.FLOOR)){
				facing = LEFT;
				velocity.x = -maxVelocity.x;
			}
			if(FlxG.keys.RIGHT && isTouching(FlxObject.FLOOR)){
				facing = RIGHT;
				velocity.x = maxVelocity.y;
			}
			if (FlxG.keys.Z && isTouching(FlxObject.FLOOR) && !zHeld)
			{
				zHeld = true;
				velocity.y = -maxVelocity.y;
			}
			if (!FlxG.keys.Z && zHeld)
				zHeld = false;
				
			super.update();
		}
		
		/*override public function kill():void //custom death function
		{
			alive = false;
			exists = false;
		}*/
	}
}