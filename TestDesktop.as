package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	
	import starling.core.Starling;
	[SWF(width="800",height="600",frameRate="60",backgroundColor="#00000")]
	public class TestDesktop extends Sprite
	{
		private var _starling:Starling;
		private var mRectangle:Rectangle;
		public function TestDesktop()
		{
			StageAlign.TOP_LEFT;
			StageScaleMode.NO_SCALE;
			mRectangle = new Rectangle();
			
			mRectangle.width = stage.stageWidth;
			mRectangle.height = stage.stageHeight;
			
			_starling = new Starling(Game,stage,mRectangle);
			_starling.showStats = true;
			_starling.antiAliasing = 1;
			_starling.start();
		}
	}
}