package
{
	import org.flixel.*;
 
	public class Level extends FlxTilemap
	{	
		//------------------------------------------DECLARATIONS---------------------------------------------
		[Embed(source = "../data/map.txt", mimeType = "application/octet-stream")] private var TxtMap1:Class; //map layout 1
		[Embed(source = "../data/sprites.png")] private var BG1:Class; //map graphics 1
		
		private const LVL1:String = new TxtMap1;
		//----------------------------------------CREATE FUNCTION--------------------------------------------
		public function Level():void
		{
			loadMap(LVL1, BG1, 16, 16, OFF, 0, 0, 12);
		}
	}
}