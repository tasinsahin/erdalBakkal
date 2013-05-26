package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Point;

	
	public class DURANUNLAR extends MovieClip {
		
		var currentObject:MovieClip = new MovieClip();
		var First_X:Number=0;
		var First_Y:Number=0;
		public function DURANUNLAR(urunSayisi:Number) {
			// constructor code
			for(var i :Number=0;i<urunSayisi;i++){
				var urun:DURANUN=new DURANUN();
				urun.x=((i*120)+5)+130;
				urun.y=250;
				urun.name="urun"+i.toString();
				trace(urun.name);
				addChild(urun);
				//urun.addEventListener(MouseEvent.MOUSE_DOWN,startDragHandler);
			}
		}
		/*public function startDragHandler(e:MouseEvent):void{
			currentObject = e.currentTarget as MovieClip;
			currentObject.startDrag(); 
			First_X=currentObject.x;
			First_Y=currentObject.y;
			stage.addEventListener(MouseEvent.MOUSE_UP, stopDragHandler);
			currentObject.removeEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);			
		}
		function stopDragHandler(e:MouseEvent):void{
			stopDrag();			
			var object:MovieClip = currentObject as MovieClip;
			stage.removeEventListener(MouseEvent.MOUSE_UP, stopDragHandler);
			currentObject.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);			
			
			var m:MovieClip = stage.getChildByName("drag_Take_2_mc") as MovieClip;
			if (object.hitTestObject(m)) {
					
					if (object.etiketlendi) {
						trace("etiketli degdi");
						m.addChild(object);						
						var po:Point=m.globalToLocal(new Point(object.x,object.y));
						object.x=po.x;
						object.y=po.y;
					}
					else{
						object.x=First_X;
						object.y=First_Y;						
					}
				}
				else {
					object.x=First_X;
					object.y=First_Y;
				}
		 }
		 */
	}
	
}
