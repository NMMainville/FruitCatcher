package
{
        import flash.display.Stage;
        import org.flixel.*;

        public class Registry
        {
            public static var level:Level;
			
			public static var hud:HUD;
			
			public static var cameraObject:CameraObject;
			
            public static var player:Player;
            public static var fruits:FruitManager;
			
			public function Registry()
                {
                }
        }
}