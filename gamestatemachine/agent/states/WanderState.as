package agent.states 
{
	import agent.Agent;
	public class WanderState implements IAgentState
	{
		
		public function update(a:Agent):void
		{
			a.say("Wandering...");
			a.velocity.x += Math.random() * 0.2 - 0.1;
			a.velocity.y += Math.random() * 0.2 - 0.1;
			if (a.numCycles > 120) {
				a.setState(Agent.IDLE);
			}
			if (!a.canSeeMouse) return;
			if (a.distanceToMouse < a.fleeRadius) {
				a.setState(Agent.FLEE);
			}else if (a.distanceToMouse < a.chaseRadius) {
				a.setState(Agent.CHASE);
			}
		}
		
		public function enter(a:Agent):void
		{
			a.speed = 1;
		}
		
		public function exit(a:Agent):void
		{
			
		}
	}
}