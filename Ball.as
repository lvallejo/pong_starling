package
{
	import flash.geom.Rectangle;
	
	import starling.core.Starling;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Ball extends GameObject
	{
		private var mQuad:Quad;
		private var angle:Number = 10;
		
		
		public var speed:Number = 3;
		/** Velocity in the X direction */
		public var vX:Number = 0;
		
		/** Velocity in the Y direction */
		public var vY:Number = 0;
		
		/** Bouncers the ball collides with (type: Bouncer) */
		public var bouncers:Array;
		
		public function Ball()
		{
			mQuad = new Quad(10,10,0x00ff00);
			this.x = Game.width / 2;;
			this.y = Game.height / 2;
			addChild(mQuad);
			addEventListener(Event.ADDED_TO_STAGE, update);
		}
		
		/**
		 * Update the movement of the ball
		 * @return -1 if no player has won,
		 *         0 if the player has won,
		 *         1 if the AI has won
		 */
		public function update():Number
		{
			// Update based on velocity
			this.x += vX;
			this.y += vY;
			
			// Check if we've gone off the left side (AI wins)
			if (this.x < 0)
			{
				return 1;
			}
			
			// Check if we've gone off the right side (player wins)
			if (this.x >= Game.width)
			{
				return 0;
			}
			
			// Check if we hit any of the bouncers. If we did, have it bounce us.
			for (var it:String in this.bouncers)
			{
				var bouncer:GameObject = this.bouncers[it];
				
				// Check if we hit the current bouncer
				if (hitTestObject(bouncer))
				{
					// Bounce off the current bouncer and stop checking
					bouncer.bounce(this);
					break;
				}
			}
			
			return -1;
		}
		
		
		public function hitTestObject(o:GameObject):Boolean
		{
			var bounds:Rectangle = mQuad.bounds;
			var oBounds:Rectangle = o.bounds;
			if(bounds.intersects(oBounds))
			{
				return true;
			}
			return false;
		}
	}
}