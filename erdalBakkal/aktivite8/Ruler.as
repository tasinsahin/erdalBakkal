package  {
	
	import flash.display.MovieClip;
	import flash.geom.Rectangle;
	import flash.geom.ColorTransform;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Ruler extends MovieClip {
		
		var rectangles:MovieClip = new MovieClip();
		var oldX:Number = 0;
		var newX:Number = 0;
		var piecesDenumerator:Number = 0;
		var firstpartOfNumerator:Number = 0;
		var firstcolor:uint = 0x93A400;
		var secondcolor:uint = 0xD42C2C;
		
		public function Ruler(numerator:Number,denumerator:Number) {
			// constructor code
			cursor_mc.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
			cursor_mc.foodweight_txt.text = String(Math.round(((Number(animalWeight_txt.text)) / 930) * cursor_mc.x));
			
			firstpartOfNumerator = numerator;
			piecesDenumerator = denumerator;
			
		}
		function startDragHandler(e:MouseEvent):void { 
			cursor_mc.startDrag(true,new Rectangle(0,94,930,0));			
			stage.addEventListener(MouseEvent.MOUSE_UP, stopDragHandler);		
			this.addEventListener(MouseEvent.MOUSE_MOVE,hareket);
		}
		function stopDragHandler(e:MouseEvent):void {
			stopDrag();
			this.removeEventListener(MouseEvent.MOUSE_UP, stopDragHandler);
		}
		function hareket(e:MouseEvent):void{ 	
			cursor_mc.foodweight_txt.text = String(Math.round(((Number(animalWeight_txt.text)) / 930) * cursor_mc.x));
			var width:Number = 0;
			var height:Number = 0;
			var ratio:Number = 0;
			while (rectangles.numChildren)
			{
				rectangles.removeChildAt(0);
			}
			for (var i:int = 0; i < piecesDenumerator; i++) 
			{	
				//////Fishes////////
				if (i<firstpartOfNumerator) 
				{
					Draw(i, firstcolor);
					var fish_mc:Fish = new Fish();
					
					width = (newX - oldX);
					ratio = width / 37;
					height = fish_mc.height * ratio;
					if (height<95) 
					{
						fish_mc.height = height;
						fish_mc.width = width;						
					}
					
					fish_mc.x = ((newX - oldX) / 2) + oldX;
					fish_mc.y = 100;
					rectangles.addChild(fish_mc);
					
					
				}
				///////Fruits////////
				else 
				{
					Draw(i, secondcolor);
					var fruit_mc:Fruit = new Fruit();
					//width = (newX - oldX)
					ratio = width / 85;
					height = fruit_mc.height * ratio;					
					if (height<55) 
					{
						fruit_mc.height = height;
						fruit_mc.width = width;						
						
						
					}
					fruit_mc.x = ((newX - oldX) / 2) + oldX;
					fruit_mc.y = 90
					rectangles.addChild(fruit_mc);
										
					
					
				}
				
				
			}
			addChild(rectangles);
			
			setChildIndex(cursor_mc, numChildren - 1);
			
			
		}
		function Draw(order:Number,c:uint ):void{
			 
			oldX = (cursor_mc.x / piecesDenumerator) * order;
			newX = (cursor_mc.x / piecesDenumerator) * (order + 1);
			//trace("o:" + order + "oldx:" + oldX + "newx:" + newX);
			var shape:MovieClip=new MovieClip();
			shape.graphics.beginFill(0x000000, 0.25);			
			shape.graphics.lineStyle(4, 0x000000);
			shape.graphics.moveTo((oldX),45)
			shape.graphics.lineTo(( oldX), 143);			
			shape.graphics.lineTo(newX,143);
			shape.graphics.lineTo(newX, 45);			
			shape.graphics.lineTo(oldX,45);
			shape.graphics.endFill();
			RenkDegistir(shape, c);
			rectangles.addChild(shape);
			
			
		}
		function RenkDegistir(m:MovieClip, c:uint):void {
			
			var color:ColorTransform =new ColorTransform();
			color.color=c;
			m.transform.colorTransform=color;
		}

	}
	
}
