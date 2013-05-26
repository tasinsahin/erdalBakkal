package  {
	
	import flash.display.MovieClip;
	import flash.geom.Rectangle;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import fl.motion.easing.Circular;
	
	
	public class cetvel extends MovieClip {
		
		
	
		public var gelenFiyat:Number=0;
		var cizim:MovieClip=new MovieClip();
		
		public function cetvel() {
			// constructor code
			imlec1.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler); 
		}		
		//, );
	
		
		
		function startDragHandler(e:MouseEvent):void { 
			imlec1.startDrag(true,new Rectangle(0,94,1000,0));			
			stage.addEventListener(MouseEvent.MOUSE_UP, stopDragHandler);		
			this.addEventListener(MouseEvent.MOUSE_MOVE,hareket);
		}
		function stopDragHandler(e:MouseEvent):void {
			stopDrag();
			this.removeEventListener(MouseEvent.MOUSE_UP, stopDragHandler);
		}
		function hareket(e:MouseEvent):void{ 
			
			gelenFiyat=Number(gelenFiyat_txt.text);			
			imlec1.fiyat.text=String(Math.round((gelenFiyat/1000)*imlec1.x));
			ciz();
			setChildIndex(cizim,1);
		}
		function ciz():void{
			 
			cizim.graphics.clear();			
			cizim.graphics.beginFill(0x000000,0.5);
			cizim.graphics.lineTo(0,188);
			cizim.graphics.lineTo(imlec1.x,188);
			cizim.graphics.lineTo(imlec1.x,0);
			cizim.graphics.lineTo(0,0);
			cizim.graphics.endFill();
			addChild(cizim);
		}

	}
	
}
