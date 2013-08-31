package
{
	import flash.utils.getTimer;
	
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Paddle extends GameObject
	{
		private var quad:Quad;
		
		/** Top bound of movement */
		public var topBound:Number;
		
		/** Bottom bound of movement */
		public var bottomBound:Number;
		
		/** Maximum amount the ball can bounce off in the Y direction */
		private static var maxBounceVYSkew:Number = 12;
		
		
		public function Paddle()
		{
			addEventListener(Event.ADDED_TO_STAGE,activate);
		}
		
		
		public function requestMove(y:Number):void
		{
			this.y = Math.max(this.topBound, Math.min(this.bottomBound, y));
		}
		
		public function activate(e:Event):void
		{
			quad = new Quad(16,64);
			quad.color = 0x00ff00;
			quad.x = 0;
			quad.y = 0;
			addChild(quad);	
			
		}
		
		/**
		 * Bounce a ball off of the paddle.
		 * @param ball Ball to bounce
		 */
		public override function bounce(ball:Ball):void
		{
			// Reverse X direction and bounce horizontally
			ball.vX = -ball.vX;
			ball.x += ball.vX;
			
			// Calculate the relative position where the ball hit from the paddle's center
			var hitPos:Number = ball.y - (this.y+(this.height/2)-ball.height);
			
			// Calculate the percentage from the paddle's center that the ball hit
			var percentFromCenter:Number = hitPos/this.height/2;
			
			// Compute the amount to perturb the ball's VY
			var vyAdjust:Number = percentFromCenter * Paddle.maxBounceVYSkew;
			
			// Perturb VY based on the hit
			ball.vY += vyAdjust
		}
		
	}
}