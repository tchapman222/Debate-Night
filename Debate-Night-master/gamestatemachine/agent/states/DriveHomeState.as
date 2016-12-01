package agent.states{
	
	import agent.Agent;
	import flash.events.KeyboardEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;
	
	public class DriveHomeState extends MovieClip implements IAgentState {
		
		public function DriveHomeState() {}
		
		public function update(a:Agent):void {
			if (a.numCycles) {
				//trace(Agent._score);
			}
		}
		
		public function enter(a:Agent):void
		{
			//trace("keydowns");
			a.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
		}
		
		public function keyDownHandler(evt: KeyboardEvent): void {
			if (evt.keyCode == 38) {
				//trace("up");
				Agent._score += 1;
				trace(Agent._score);
			}
			if (evt.keyCode == 87) {
				//trace("up");
				Agent._score -= 1;
				trace(Agent._score);
			}
		}
		
		public function exit(a:Agent):void
		{
			a.stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
		}

	}
	
}
