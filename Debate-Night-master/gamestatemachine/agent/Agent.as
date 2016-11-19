 package agent 
{
	import agent.states.IAgentState;
	import agent.states.IdleState;
	import agent.states.FlipFlopState;
	import agent.states.DriveHomeState;
	import agent.states.BackOffState;
	//import agent.states.SpecialState;

	
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.events.Event;
	
	public class Agent extends Sprite
	{
		
		//New States
		public static const IDLE:IAgentState = new IdleState();
		public static const FLIPFLOP:IAgentState = new FlipFlopState(); //Listen to the A & D, and left and right keys to gains progress
		public static const DRIVEHOME:IAgentState = new DriveHomeState(); //Listen to the up & W key to gain progress
		public static const BACKOFF:IAgentState = new BackOffState(); //Listen to the down key & S to gain progress
		//public static const SPECIAL:IAgentState = new SpecialState(); //Listen to the 1 key and delete key
		
		
		/*public static const CROWDIDLE:IAgentState = new CrowdIdleState(); //When bar is near middle the crowd idles
		public static const CHEERING:IAgentState = new CheeringState(); //Crowd reacts if the bar is very onsided
		public static const STAGEIDLE:IAgentState = new StageIdleState(); //Stage is at idle. No physics affects
		public static const SHAKING:IAgentState = new ShakingState(); //Stage shakes and affects banners (use InverseKinematics here)
		/* Using the banners and inverse kinematics we are going to give an advantage to the player who is behind for a while. Use collision detection
		 * to hit the candidate and lower their progress bar, evening out the game.
		*/
		
		private var _previousState:IAgentState; //The previous executing state
		private var _currentState:IAgentState; //The currently executing state
		
		public var numCycles:int = 0; //Number of updates that have executed for the current state. Timing utility.
		
		public var _score:Number = 0;
		
		public function Agent() 
		{
			//Boring stuff here
			addEventListener(Event.ADDED_TO_STAGE,init);

			
		}
		
		public function init(e:Event){
			trace("Init");
			setState(FLIPFLOP); //Set the initial state
		}
		
		public function update():void {
			if (!_currentState) return; //If there's no behavior, we do nothing
				numCycles++; 
				_currentState.update(this);
			
			}
		
		public function setState(newState:IAgentState):void {
			if (_currentState == newState) return;
			if (_currentState) {
				_currentState.exit(this);
			}
			_previousState = _currentState;
			_currentState = newState;
			_currentState.enter(this);
			numCycles = 0;
		}
		
		public function say(s:String){
			trace(s);
		}
		
		public function set Score(s:Number):void {
			_score += s;
		}
		
		public function get previousState():IAgentState { return _previousState; }
		
		public function get currentState():IAgentState { return _currentState; }
		
	}

}