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
		private var paddle1:Paddle;
		private var paddle2:Paddle;
		private var lastTime:int;
		private var movingDown:Boolean;
		
		private var ball:Ball;
		
		public function Game()
		{
			addEventListener(Event.ADDED_TO_STAGE,onAdded);
			
		}
		
		private function onAdded(e:Event):void
		{
			
			ball = new Ball();
			addChild(ball);
			
			paddle1 = new Paddle(16,64);
			paddle2 = new Paddle(16,64);
			
			paddle1.x = 0;
			paddle1.y = 300;
			paddle2.x = 784
			addChild(paddle1);
			addChild(paddle2);
			
			
			
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
			
			
			
			
			
			if(movingDown)
			{
				paddle1.y += 4
			}
			
			
		}
	}
}