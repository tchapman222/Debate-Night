package agent.states 
{
	import agent.Agent;
	public class IdleState implements IAgentState
	{
		
		/* INTERFACE agent.states.IAgentState */
		
		public function update(a:Agent):void
		{
			if (a.numCycles > 30) {
				a.setState(Agent.WANDER);
			}
		}
		
		public function enter(a:Agent):void
		{
			a.say("Idling...");
			a.speed = 0;
		}
		
		public function exit(a:Agent):void
		{
			a.randomDirection();
		}
		
	}

}