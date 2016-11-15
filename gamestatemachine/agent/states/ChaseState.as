package agent.states 
{
	import agent.Agent;
	public class ChaseState implements IAgentState
	{
		
		/* INTERFACE agent.states.IAgentState */
		
		public function update(a:Agent):void
		{
			var dx:Number = a.stage.mouseX - a.x;
			var dy:Number = a.stage.mouseY - a.y;
			var rad:Number = Math.atan2(dy, dx);
			a.velocity.x = Math.cos(rad);
			a.velocity.y = Math.sin(rad);
			if (a.numCycles < 40) return;
			a.say("Chasing!");
			a.speed = 2;
			if (a.distanceToMouse > a.chaseRadius) {
				a.setState(Agent.CONFUSED);
			}
			if (a.distanceToMouse < a.fleeRadius) {
				a.setState(Agent.FLEE);
			}
		}
		
		public function enter(a:Agent):void
		{
			var dx:Number = a.stage.mouseX - a.x;
			var dy:Number = a.stage.mouseY - a.y;
			var rad:Number = Math.atan2(dy, dx);
			a.velocity.x = Math.cos(rad);
			a.velocity.y = Math.sin(rad);
			a.say("Oh wow! Something to chase!");
			a.speed = 0;
		}
		
		public function exit(a:Agent):void
		{
			
		}
		
	}

}