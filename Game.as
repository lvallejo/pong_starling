package
{
	import flash.ui.Keyboard;
	import flash.utils.getTimer;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	
	public class Game extends Sprite
	{
		
		private var CpuPaddle:AIPaddle;
		private var lastTime:int;
		private var movingDown:Boolean;
		
		public static var width:Number;
		public static var height:Number;
		
		private var ball:Ball;
		
		public function Game()
		{
			addEventListener(Event.ADDED_TO_STAGE,onAdded);
			width = Starling.current.stage.stageWidth;
			height = Starling.current.stage.stageHeight;
			
		}
		
		private function onAdded(e:Event):void
		{
			
			ball = new Ball();
			addChild(ball);
			
			
			CpuPaddle = new AIPaddle();
			
			
			
			
			
			addEventListener(Event.ENTER_FRAME,onFrame);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		private function onKeyUp(e:KeyboardEvent):void
		{
			if(Keyboard.S == e.keyCode)
			{
				movingDown = false;
			}
		}
		
		private function onKeyDown(e:KeyboardEvent):void
		{
			if(Keyboard.S == e.keyCode)
			{
				movingDown = true;
			}
			
		}
		
		private function onFrame(e:Event):void
		{
			var timeDiff:int = getTimer() - lastTime;
			lastTime += timeDiff;
			
			
			
		}
	}
}