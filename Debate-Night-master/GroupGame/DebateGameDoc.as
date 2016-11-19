package  {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.events.KeyboardEvent;
	import flash.utils.Timer;
	import flash.ui.Keyboard;
	
	public class DebateGameDoc extends MovieClip {
		
		private var scoreBars:ScoreBars;
		private var inputTimer:Timer = new Timer(delay, repeat);
		private var delay:int = 50;
		private var repeat:int = 60;
		private var inputSwitch:Boolean = false;
		private var whatButton:String;
		private var demScore:Number;
		private var repScore:Number;
		
		public function DebateGameDoc() {
			// constructor code
			makeGame();
		}
		private function makeGame() {
			
		demScore = 0;
		repScore = 0;
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
		stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			
		stage.addEventListener(KeyboardEvent.KEY_DOWN, repKeyDownHandler);
		stage.addEventListener(KeyboardEvent.KEY_UP, repKeyUpHandler);
		
		inputTimer.addEventListener(TimerEvent.TIMER, roundTimer);
		inputTimer.addEventListener(TimerEvent.TIMER_COMPLETE, roundOver);
			
		scoreBars = new ScoreBars();
		stage.addChild(scoreBars)
		scoreBars.x = 100;
		scoreBars.y = 100;
		}
		private function keyDownHandler(evt:KeyboardEvent):void {
			if (evt.keyCode == 32) {
				trace("SPACEBAR");
				inputTimer.start();
			}
			//keycodes for left and right DemRightCode = 39'right' 37'left' / RepRightCode = 69'd' 65'a'
			if (evt.keyCode == 39) {
				if (inputSwitch == false) {
					demScore++;
					demScoreUpdate();
				} else if (inputSwitch == true) {
					
				}
			}
			if (evt.keyCode == 37) {
				if (inputSwitch == true) {
					demScore++;
					demScoreUpdate();
				} else if (inputSwitch == false) {
					
				}
			}
		}
		private function keyUpHandler(evt:KeyboardEvent):void {
			
		}
		private function repKeyDownHandler(evt:KeyboardEvent):void {
			
			if (evt.keyCode == 69) {
				if (inputSwitch == false) {
					repScore++;
					repScoreUpdate();
				} else if (inputSwitch == true) {
					
				}
			}
			if (evt.keyCode == 65) {
				if (inputSwitch == true) {
					repScore++;
					repScoreUpdate();
				} else if (inputSwitch == false) {
					
				}
			}			
		}
		private function repKeyUpHandler(evt:KeyboardEvent):void {
			
		}
		private function roundTimer(e:TimerEvent):void {
			trace("TIMER STARTED");
			trace(repeat)
			repeat --;
			
			switch (inputSwitch) {
				
				case true:
					inputSwitch = false;
				break;
				
				case false:
					inputSwitch = true
				break;
			}
			
			trace(inputSwitch);
		}
		private function roundOver(e:TimerEvent):void {
			trace("TIMER THROUGH");
			inputTimer.reset();
			repeat = 60;
		}
		private function demScoreUpdate():void {
			trace(demScore);
			scoreBars.DemBar.width ++;
		}
		private function repScoreUpdate():void {
			trace(repScore);
			scoreBars.RepBar.width ++;
		}
	}
}

/*

		}
		private function roundTimer(e:TimerEvent):void {
			trace("TIMER STARTED");
			
			if (inputSwitch == false) {
				inputSwitch = true;
			} else if (inputSwitch = true) {
				inputSwitch = false;
			}
			
			trace(repeat)
			repeat --;
			
		}
		private function roundOver(e:TimerEvent):void {
			trace("TIMER THROUGH");
			trace(inputSwitch);
			inputTimer.reset();
			repeat = 60;
		}
		
*/
