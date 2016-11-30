package agent.states{

	import agent.Agent;
	import flash.events.KeyboardEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;

	public class FlipFlopState extends MovieClip implements IAgentState {
		
		public function FlipFlopState() {}

		public function update(a: Agent): void {
			if (a.numCycles) {
				//trace(Agent._score);
			}
		}

		public function enter(a: Agent): void {
			//trace("keydowns");
			a.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
		}


		public function keyDownHandler(evt: KeyboardEvent): void { //RED: This is the function you'll need to do all your work in. See the comments.
			if (evt.keyCode == 37) { // if the left key is pressed, do this. Each key has a number that corresponds to it. IE, 37 = left
				trace("left"); // traces a line to make sure the button click was registered. This line isn't necessary, but is useful in testing
				Agent._score += 1;
				// Above is the main action. in our Agent class, I defined a Static variable called "_score" that can be read in any class. we call it in the line above ->
				// and set it equal to itself plus one. Because the players are fighting against each other, you'll need to make your WASD buttons subtract from the score.
				trace(Agent._score); //same as the trace statement above. Not necessary.
			}
			if (evt.keyCode == 39) { //39 = right
				trace("right")
				Agent._score += 1; //refer to same code in previous if statement
				trace(Agent._score);
			}
			
			// You can find the keycodes by googling "keycode.info". Put the A & D keys in this class, the W in DriveHomeState, and S in BackOffState.
		}

		public function exit(a: Agent): void {
			a.stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
		}
	}
}