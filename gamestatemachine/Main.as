package 
{
	import agent.Agent;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	public class Main extends Sprite 
	{
		private var agents:Vector.<Agent>;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			// entry point
			graphics.beginFill(0xeeeeee);
			graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			addEventListener(Event.ENTER_FRAME, gameloop);
		}
		
		private function gameloop(e:Event):void 
		{

		}
		
	}
	
}