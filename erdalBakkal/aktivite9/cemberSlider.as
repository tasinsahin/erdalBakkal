package  {
	
	import flash.display.MovieClip; 
	import fl.events.SliderEvent;
	import flash.events.MouseEvent;
	import flash.events.Event; 
	import flash.display.Sprite;
	import flash.display.Shape;
	import fl.motion.MotionEvent;
	
	public class cemberSlider extends MovieClip {
		
			var degree:Number = 0; // Initial angle
			var degChange:Number = 1; // Amount angle will change on each click			
			var circleR:Number = 100; // Circle radius (in pixels)
			var circleX:Number = 180; // Screen coordinates of center of circle
			var circleY:Number = 180;
			var angleR:Number = circleR/4; // Radius of circular arc for the angle
			
			var spBoard:Sprite = new Sprite();
			var shCircle:Shape = new Shape();
			var shFill:Shape = new Shape();
			var shAngle:Shape = new Shape();			
			var shArrow:Shape = new Shape();
				
			var currentObject:MovieClip = new MovieClip();
			var m:MovieClip = new MovieClip();
  		public function cemberSlider() {
				
			 
			
			
						// constructor code
						/*
			ActionScript 3 How-Tos and Tips
			http://www.flashandmath.com/
			Last modified February 6, 2010.
			*/
			
			/*
			This is an improvement on the example CircleFillSprite.fla that accompanies the book, 'Flash and Math Applets: Learn by Example' by Doug Ensley and Barbara Kaskosz, published by www.flashandmath.com.  It extends the "how to" entitled, 
			*/
			

			/*
			We make a Sprite called spBoard on which to place the other elements. 
			This way, changing the x and y properties of spBoard will reposition 
			it along with all of its children. 
			*/
			spBoard.x = circleX;
			spBoard.y = circleY;
			addChild(spBoard);
			
			/*
			We create all of the Shapes that we will use, draw in them, and then
			add them as children to spBoard in the same order that we want them layered. 
			The shCircle Shape is self-explanatory - it contains the perimeter of the circle - the Shape shFill will eventually be our circular sector, and shAngle 
			will be the circular arc that sweeps out the angle. Like spBoard, 
			the Shape object shArrow (the little cursor that looks like an arrow) 
			is only drawn once -- we will see below that by drawing it relative to the (0,0) 
			point on spBoard, then simple change of the shArrow rotation property will 
			easily accomplish the desired effect.
			*/
			shCircle.graphics.lineStyle(2,0x000000);
			shCircle.graphics.drawCircle(0,0,circleR);
			shCircle.x = 0;
			shCircle.y = 0;
			
			shFill.graphics.lineStyle(1,0x000000);
			shFill.graphics.moveTo(0,0);
			shFill.graphics.lineTo(circleR,0);
			shFill.x = 180;
			shFill.y = 180;
			
			shArrow.graphics.lineStyle();
			shArrow.graphics.beginFill(0x000000);
			shArrow.graphics.moveTo(angleR,1);
			shArrow.graphics.lineTo(angleR-5,8);
			shArrow.graphics.lineTo(angleR+5,8);
			shArrow.graphics.lineTo(angleR,1);
			shArrow.graphics.endFill();
			
			/*
			We add all objects as children of spBoard. The order in which we add them
			will determine which object will apear on top of which.
			*/
			
			spBoard.addChild(shCircle);
			spBoard.addChild(shFill);
			spBoard.addChild(shAngle);
			spBoard.addChild(shArrow);
			
						/*
			The following block of code replaces the action of the buttons and the keyboard in the previous example.
			*/
			slAngle.minimum = 0;
			slAngle.maximum = 360;
			slAngle.value = 0;
			slAngle.liveDragging = true;
			
			slAngle.addEventListener(Event.CHANGE,sliderChanged);
			//updatePicture(degree);
		}
		
		
		
		/*
		The heart of the program is the function updatePicture to do more than 
		just rotate the radial line. At each step we clear all the graphics from 
		shFill and then redraw an entirely new picture composed of an appropriate 
		number of sides of a 360-sided polygon inscribed in our circle. 
		This will give the appearance of filling the circular region. 
		Similarly, we draw the "circular" arc shAngle as part of a smaller 360-sided polygon.
		*/
		public function drag(shape:Shape ):void{
			m.addChild(shape);
			m.name = "ic";
			m.addEventListener(MouseEvent.MOUSE_DOWN,startDragHandler);
			addChild(m);
		}
		public function startDragHandler(e:MouseEvent):void {
			currentObject = e.currentTarget as MovieClip;
			m.startDrag(true);
			//m.addEventListener(MouseEvent.MOUSE_UP,stopDrapHandler);
		}
		public function stopDrapHandler(e:MouseEvent):void {
			var object:MovieClip = currentObject as MovieClip;
			stopDrag();
			trace(m.toString());
			
			if (object.hitTestObject(etiket_mc))
			{
				trace("girdii");
			}
		
		}
		public function updatePicture(t:Number):void {	
			var radianAngle:Number = t*Math.PI/180.0; 
			var i:int;
			
			shFill.graphics.clear();
			shAngle.graphics.clear();
			
			shFill.graphics.lineStyle(1,0x000000);
			shAngle.graphics.lineStyle(1,0x000000);
			
			shFill.graphics.moveTo(0,0);
			shAngle.graphics.moveTo(angleR,0);
		
			shFill.graphics.beginFill(0xFF00FF,0.7);
			
			// The loop draws tiny lines between points on the circle one separated from each other by one degree.
			for (i=0; i<=t; i++) {
				shFill.graphics.lineTo(circleR*Math.cos(i*Math.PI/180), -circleR*Math.sin(i*Math.PI/180));
				shAngle.graphics.lineTo(angleR*Math.cos(i*Math.PI/180), -angleR*Math.sin(i*Math.PI/180));
			}
			//The final lineTo takes the "pen" back to its starting point.
			shFill.graphics.lineTo(0,0);
			shFill.graphics.endFill();
			
			/*
			We rotate the arrow head appropriately -- this is much easier than doing the trig to figure out how to redraw it dynamically.
			*/
			shArrow.rotation = -t;
			
			/*
			The remaining lines position the txtCoords textbox, create a string showing the coordinates to two decimal places to put this into this textbox, and put the current radian value of t and the area of the shaded region into the appropriate textboxes.
			*/
			txtCoords.x =circleX + (40+circleR)*Math.cos(radianAngle) - 40;
			txtCoords.y =  circleY - (20+circleR)*Math.sin(radianAngle) -  10;
		
			txtCoords.text = Math.round((degree / (36 / 10))).toString();
		
			drag(shFill);
		}
		
		
		
		public function sliderChanged(e:Event):void {
			degree = slAngle.value;
			updatePicture(degree);
		}
		
		/*
		We call the updatePicture function initially by placing the following line at the end of our script. This will ensure that all graphics objects are drawn, the txtCoords textbox is placed in the correct position, and other textboxes initially contain correct information. 
		*/

	}
}
	





