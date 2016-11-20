package  agent.states{
	
	import agent.Agent;
	
	public class DriveHomeState implements IAgentState {

		public function DriveHomeState() {}
		
		public function update(a:Agent):void
		{
			
		}
		
		public function enter(a:Agent):void
		{
			trace("DriveHome");
		}
		
		public function exit(a:Agent):void
		{
			
		}

	}
	
}
