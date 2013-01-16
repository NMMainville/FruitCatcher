package
{
	import org.flixel.*;

	public class FruitManager extends FlxGroup
	{

		public function FruitManager()
		{
			super();
			//	There are 20 fruits in our pool
			for (var i:int = 0; i < 20; i++)
			{
				add(new Fruit(FlxG.width / 20 * (i + 1), 1 * 16 + (Math.floor(Math.random() * 5) * 16)));
				this.members[i].kill();
			}
		}
		
		public function spawnFruit(X:int, Y:int):void
		{
			if(getFirstAvailable(Fruit)) Fruit(getFirstAvailable(Fruit)).reset(X, Y);
		}
	}

}