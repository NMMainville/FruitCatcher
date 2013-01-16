package
{
	import flash.display.StageScaleMode;
	
	import org.flixel.*;
 
	public class PlayState extends FlxState
	{	
		//---------------------------------------CURRENT OBJECTIVES------------------------------------------
		//------------------------------------------DECLARATIONS---------------------------------------------
		private static var TIME_CONSTANT:Number = 1;
		private var fruitTimer:Number = TIME_CONSTANT;
		//----------------------------------------CREATE FUNCTION--------------------------------------------
		override public function create():void
		{
			FlxG.stage.scaleMode = StageScaleMode.SHOW_ALL; // Scale the stage to the window size, but preserve aspect ratio.
			FlxG.stage.align = ""; // Align the stage to the absolute center.
			
			FlxG.bgColor = 0x000000ff; //change bgcolour
			
			Registry.hud = new HUD();
			Registry.cameraObject = new CameraObject((FlxG.width/2) + 8, (FlxG.height/2) + 8);
			Registry.level = new Level(); //initiate level as a Level (the class)
			Registry.player = new Player(2 * 16, 10 * 16);//initiate player as a Player (the class)
			Registry.fruits = new FruitManager();
			
			add(Registry.cameraObject);
			add(Registry.level); //adds the tilemap
			add(Registry.player); //adds the player
			add(Registry.fruits);
			add(Registry.hud);
			
			//set up camera
			FlxG.camera.follow(Registry.cameraObject);
			//FlxG.follow(player,2.5);
			//FlxG.followAdjust(0.5,0.0);
			Registry.level.follow();	//Set the followBounds to the map dimensions
			
			fruitTimer = 5;
		}
		
		override public function update():void //update function
		{
			super.update();
			
			fruitTimer = fruitTimer - FlxG.elapsed;
			
			if (fruitTimer <= 0)
			{
				Registry.fruits.spawnFruit((Math.floor(Math.random() * 20) + 1) * 16, 1 * 16);
				fruitTimer = TIME_CONSTANT;
			}
			
			FlxG.overlap(Registry.player, Registry.fruits, playerCollect);
			//FlxG.overlap(Registry.player, Registry.fruits, Registry.player.killPlayer); //player death callback
			
			FlxG.collide(Registry.level, Registry.player);
			FlxG.collide(Registry.level, Registry.fruits);
			
			if (FlxG.keys.justPressed("B")) FlxG.visualDebug = !FlxG.visualDebug; //bounding box debug
		}
		
		public function playerCollect(player:FlxObject, fruit:FlxObject):void
		{
			fruit.kill();
			Registry.hud.score++;
		}
		
		public function killPlayer(player:FlxObject, fruit:FlxObject):void
		{
			//Registry.fruits.exists = false;
			Registry.player.kill();
		}
	}
}