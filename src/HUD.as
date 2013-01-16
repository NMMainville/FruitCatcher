package
{
	import org.flixel.*;
 
	public class HUD extends FlxGroup
	{	
		//------------------------------------------DECLARATIONS---------------------------------------------
		//TODO: Add functions to change data instead of calling from playstate
		private var scoreText:FlxText = new FlxText(5, 15, 64, "0");
		public var score:int = 0;
		//----------------------------------------CREATE FUNCTION--------------------------------------------
		public function HUD():void //X and Y define starting position of the player
		{
			super();
			//Score
			scoreText.scrollFactor.x = scoreText.scrollFactor.y = 0;
			add(scoreText);
		}
		
		override public function update():void //update function
		{
			scoreText.text = String(score);
			super.update();
		}
	}
}