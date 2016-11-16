package agent.states 
{
	import agent.Agent;
	import flash.text.*;
	public class IdleState implements IAgentState
	{
		public var moderatorText:TextField = new TextField;
		
		public function update(a:Agent):void
		{
			var x:Number = Math.random()*2;
			if (a.numCycles > 100) {
				if (x = 0){
					trace("tyler sucks");
					a.setState(Agent.FLIPFLOP);
				}
				if (x = 1){
					trace ("red sucks");
					a.setState(Agent.DRIVEHOME);
				}
				if (x = 2){
					trace ("mike sucks");
					a.setState(Agent.BACKOFF);
				}
			}			
		}
		
		public function enter(a:Agent):void
		{
			a.say("...");
		}
		
		public function exit(a:Agent):void
		{
			
		}
		
	}

}