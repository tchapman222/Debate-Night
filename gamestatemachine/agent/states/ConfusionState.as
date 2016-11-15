package agent.states 
{
	import agent.Agent;
	public class ConfusionState implements IAgentState
	{
		public function ConfusionState() 
		{
			
		}
		
		/* INTERFACE agent.states.IAgentState */
		
		public function update(a:Agent):void
		{
			if (++a.numCycles % 10 == 0) {
				a.randomDirection();
				if (a.canSeeMouse && a.distanceToMouse < a.chaseRadius) {
					if(a.previousState==Agent.FLEE) a.setState(Agent.FLEE);
					if(a.previousState==Agent.CHASE) a.setState(Agent.CHASE);
				}
			}
			if (a.numCycles > 60) a.setState(Agent.IDLE);
		}
		
		public function enter(a:Agent):void
		{
			a.say("???");
			a.speed = 0;
		}
		
		public function exit(a:Agent):void
		{
			
		}
		
	}

}