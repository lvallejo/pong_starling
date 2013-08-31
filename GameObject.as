package
{
	import starling.display.Sprite;
	import flash.errors.IllegalOperationError;
	public class GameObject extends Sprite implements Bouncer
	{
		
		
		public function bounce(ball:Ball):void
		{
			throw new IllegalOperationError("Must override Concreate Class"); 
		}
	}
}