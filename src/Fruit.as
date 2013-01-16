package
{
	import org.flixel.*;
 
	public class Fruit extends FlxSprite
	{	
		//------------------------------------------DECLARATIONS---------------------------------------------
		[Embed(source = "../data/sprites.png")] public var fruitSprites:Class; //player sprites
		private var groundCounter:Number = 0;
		private var isSpawning:Boolean = true;
		//----------------------------------------CREATE FUNCTION--------------------------------------------
		public function Fruit(X: int, Y: int):void //X and Y define starting position of the player
		{
			super(X, Y); //x and y position of the player
			//Create player
			loadGraphic(fruitSprites, true, true, 16, 16, false);
			
			//Adjust size
			//offset.x = 11;
			//offset.y = 7;
			//width = 20;
			//height = 45;
			
			//origin.x = 10;
			//origin.y = 45;
			
			maxVelocity.x = 40; //maximum speed in the x direction
			maxVelocity.y = 40; //maximum speed in the y direction
			acceleration.y = 0; //player gravity
			
			velocity.y = maxVelocity.y;
			
			//Animations
			addAnimation("idle", [15]);
			addAnimation("spawn", [17, 16, 15], 1, false);
			play("spawn");
			groundCounter = 0;
			
			addAnimationCallback(animationCallback);
		}
		
		override public function update():void //update function
		{
			//------------------------------------------ANIMATIONS-----------------------------------------------
			//-------------------------------------------MOVEMENT------------------------------------------------
			if (isSpawning)
			{
				play("spawn");
				isSpawning = false;
			}
			
			if (isTouching(FlxObject.FLOOR))
			{
				groundCounter = groundCounter + FlxG.elapsed;
			}
			
			if (groundCounter > 3 && !flickering)
			{
				flicker(1);
			}
			else if (groundCounter > 4)
			{
				kill();
			}
			
			super.update();
		}
		
		private function animationCallback(aniName:String, curFrame:uint, curAniFrame:uint):void
		{
			if (aniName == "spawn" && finished)
			{
				play("idle");
				acceleration.y = 50;
			}
		}
		
		override public function kill():void //custom death function
		{
			flicker(0);
			groundCounter = 0;
			isSpawning = true;
			acceleration.y = 0;
			play("spawn");
			alive = false;
			exists = false;
		}
	}
}