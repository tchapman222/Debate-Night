﻿package agent.states {

	import agent.Agent;
	import flash.events.KeyboardEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;

	public class FlipFlopState extends MovieClip implements IAgentState {

		public var score: Number = 0;

		public function FlipFlopState() {}

		public function update(a: Agent): void {
			trace("update");
			if (!a.numCycles) {
				a._score += score;
				trace(a._score);
			}
		}

		public function enter(a: Agent): void {
			//a.say("got here");
			trace("keydowns");
			a.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);

		}


		public function keyDownHandler(evt: KeyboardEvent): void {
			if (evt.keyCode == 37) {
				trace("test1");
				score += 1;
				a._score += 1;
			}
			if (evt.keyCode == 39) {
				trace("test2");
				a._score += 1;
			}
		}

		public function exit(a: Agent): void {

		}
	}
}