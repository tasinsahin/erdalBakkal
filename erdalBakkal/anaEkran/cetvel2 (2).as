package  {
	
	import flash.display.MovieClip;
	import flash.geom.Rectangle;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import fl.motion.easing.Circular;
	
	
	public class cetvel2 extends MovieClip {
		
		
	
		public var gelenFiyat:Number=0;
		var firstCizim:MovieClip=new MovieClip();
		var secondCizim:MovieClip=new MovieClip();
		
		public function cetvel2() {
			// constructor code
			imlec1.addEventListener(MouseEvent.MOUSE_DOWN, firstStartDragHandler);
			//KdvliFiyat.visible=false;
			//KdvliFiyat_txt.visible=false;
		}		
		//, );
	
		
		
		function firstStartDragHandler(e:MouseEvent):void {
			//KdvliFiyat.visible=true;
			//KdvliFiyat_txt.visible=true;
			imlec1.startDrag(true,new Rectangle(0,94,1000,0));	
			this.addEventListener(MouseEvent.MOUSE_MOVE,firstHareket);		
			this.addEventListener(MouseEvent.MOUSE_UP, stopDragHandler);		
			
		}
		
		function secondStartDragHandler(e:MouseEvent):void { 
			imlec1.startDrag(true,new Rectangle(0,94,1000,0));	
			this.addEventListener(MouseEvent.MOUSE_MOVE,secondHareket);		
			this.addEventListener(MouseEvent.MOUSE_UP, stopDragHandler);		
		}
		
		function stopDragHandler(e:MouseEvent):void {
			stopDrag(); 
			KdvliFiyat_txt.addEventListener(Event.CHANGE,textChanged);
		}
		function textChanged(e:Event):void{
			
			imlec1.removeEventListener(MouseEvent.MOUSE_DOWN, firstStartDragHandler);
			this.removeEventListener(MouseEvent.MOUSE_MOVE,firstHareket);		
			setChildIndex(firstCizim,numChildren-2);
			
			imlec1.addEventListener(MouseEvent.MOUSE_DOWN, secondStartDragHandler);
			
		}
		function firstHareket(e:MouseEvent):void{ 
			
			gelenFiyat=Number(gelenFiyat_txt.text);			
			imlec1.fiyat.text=String(Math.round((gelenFiyat/1000)*imlec1.x));
			firstCiz();
		}
		function secondHareket(e:MouseEvent):void{ 
			gelenFiyat=Number(KdvliFiyat_txt.text);			
			imlec1.fiyat.text=String(Math.round((gelenFiyat/1000)*imlec1.x));
			secondCiz();
			setChildIndex(firstCizim,numChildren-2);
		}
		function firstCiz():void{
			 
			firstCizim.graphics.clear();			
			firstCizim.graphics.beginFill(0x000000,0.9);
			firstCizim.graphics.lineTo(0,188);
			firstCizim.graphics.lineTo(imlec1.x,188);
			firstCizim.graphics.lineTo(imlec1.x,0);
			firstCizim.graphics.lineTo(0,0);
			firstCizim.graphics.endFill();
			addChild(firstCizim);
		}		
		function secondCiz():void{
			 
			secondCizim.graphics.clear();			
			secondCizim.graphics.beginFill(0x0CC000,0.5);
			secondCizim.graphics.lineTo(0,188);
			secondCizim.graphics.lineTo(imlec1.x,188);
			secondCizim.graphics.lineTo(imlec1.x,0);
			secondCizim.graphics.lineTo(0,0);
			secondCizim.graphics.endFill();
			addChild(secondCizim); 
		}

	}
	
}
