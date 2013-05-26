package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class aktivite11 extends MovieClip {
		
		var currentObject:MovieClip = new MovieClip();
		var firstX:Number = 0; 
		var firstY:Number = 0;
		
		var bir_Ok:Boolean=false;
		var iki_Ok:Boolean=false;
		var uc_Ok:Boolean=false;
		var dort_Ok:Boolean=false;
		var bes_Ok:Boolean=false;
		var alti_Ok:Boolean=false;
		var yedi_Ok:Boolean=false;
		var sekiz_Ok:Boolean=false;
		var dokuz_Ok:Boolean=false;
		var on_Ok:Boolean=false;
		var onbir_Ok:Boolean=false;
		var oniki_Ok:Boolean=false;
		var onuc_Ok:Boolean=false;
		var ondort_Ok:Boolean=false;
		var onbes_Ok:Boolean=false;
		
		var feed_1_mc:Feed_1 = new Feed_1();

		public function aktivite11() {
			// constructor code
			isyeriBelge_mc.visible=false;
			
			birr.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
			ikii.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
			ucc.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
			dortt.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
			bess.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
			altii.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
			yedii.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
			sekizz.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
			dokuzz.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
			onn.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
			onbirr.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
			onikii.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
			onucc.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
			ondortt.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
			onbess.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
		}
		public function startDragHandler(e:MouseEvent):void{			
			currentObject = e.currentTarget as MovieClip;
			firstX=currentObject.x;
			firstY=currentObject.y;
			currentObject.startDrag(); 
			
			stage.addEventListener(MouseEvent.MOUSE_UP, stopDragHandler);
			currentObject.removeEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
		}
		public function stopDragHandler(e:MouseEvent):void 
		{			
			var m:MovieClip = currentObject as MovieClip;
			stopDrag();
			
			
			if(m is bir){
				
				if(birr.hitTestObject(bir_)){
					bir_Ok=true;
					m.x=bir_.x+15;
					m.y=bir_.y+15;
					kontrol();
					
				}else{
					m.x=firstX;
					m.y=firstY;
				}				
			}
			
			
			
			else if(m is iki){
				
				if(ikii.hitTestObject(iki_)){
					iki_Ok=true;
					m.x=iki_.x+15;
					m.y=iki_.y+15;
					kontrol();
					
				}else{
					m.x=firstX;
					m.y=firstY;
				}					
			} 
			
			
			
			else if(m is uc){
				
				if(ucc.hitTestObject(uc_)){
					uc_Ok=true;
					m.x=uc_.x+15;
					m.y=uc_.y+15;
					kontrol();
					
				}else{
					m.x=firstX;
					m.y=firstY;
				}					
			} 
			
			
			
			else if(m is dort){
				
				if(dortt.hitTestObject(dort_)){
					dort_Ok=true;
					m.x=dort_.x+15;
					m.y=dort_.y+15;
					kontrol();
					
				}else{
					m.x=firstX;
					m.y=firstY;
				}					
			} 
			
			
			
			else if(m is bes){
				
				if(bess.hitTestObject(bes_)){
					bes_Ok=true;
					m.x=bes_.x+15;
					m.y=bes_.y+15;
					kontrol();
					
				}else{
					m.x=firstX;
					m.y=firstY;
				}					
			} 
			
			
			
			else if(m is alti){
				
				if(altii.hitTestObject(alti_)){
					alti_Ok=true;
					m.x=alti_.x+15;
					m.y=alti_.y+15;
					kontrol();
					
				}else{
					m.x=firstX;
					m.y=firstY;
				}					
			} 
			
			
			
			else if(m is yedi){
				
				if(yedii.hitTestObject(yedi_)){
					yedi_Ok=true;
					m.x=yedi_.x+15;
					m.y=yedi_.y+15;
					kontrol();
					
				}else{
					m.x=firstX;
					m.y=firstY;
				}					
			} 
			
			
			
			else if(m is sekiz){
				
				if(sekizz.hitTestObject(sekiz_)){
					sekiz_Ok=true;
					m.x=sekiz_.x+15;
					m.y=sekiz_.y+15;
					kontrol();
					
				}else{
					m.x=firstX;
					m.y=firstY;
				}					
			} 
			
			
			
			else if(m is dokuz){
				
				if(dokuzz.hitTestObject(dokuz_)){
					dokuz_Ok=true;
					m.x=dokuz_.x+15;
					m.y=dokuz_.y+15;
					kontrol();
					
				}else{
					m.x=firstX;
					m.y=firstY;
				}					
			} 
			
			
			
			else if(m is onN){
				
				if(onn.hitTestObject(on_)){
					on_Ok=true;
					m.x=on_.x+15;
					m.y=on_.y+15;
					kontrol();
					
				}else{
					m.x=firstX;
					m.y=firstY;
				}					
			} 
			
			
			
			else if(m is onbir){
				
				if(onbirr.hitTestObject(onbir_)){
					onbir_Ok=true;
					m.x=onbir_.x+15;
					m.y=onbir_.y+15;
					kontrol();
					
				}else{
					m.x=firstX;
					m.y=firstY;
				}					
			} 
			
			
			
			else if(m is oniki){
				
				if(onikii.hitTestObject(oniki_)){
					oniki_Ok=true;
					m.x=oniki_.x+15;
					m.y=oniki_.y+15;
					kontrol();
					
				}else{
					m.x=firstX;
					m.y=firstY;
				}					
			} 
			
			
			
			else if(m is onuc){
				
				if(onucc.hitTestObject(onuc_)){
					onuc_Ok=true;
					m.x=onuc_.x+15;
					m.y=onuc_.y+15;
					kontrol();
					
				}else{
					m.x=firstX;
					m.y=firstY;
				}					
			} 
			
			
			
			else if(m is ondort){
				
				if(ondortt.hitTestObject(ondort_)){
					ondort_Ok=true;
					m.x=ondort_.x+15;
					m.y=ondort_.y+15;
					kontrol();
					
				}else{
					ondortt.x=firstX;
					ondortt.y=firstY;
				}					
			} 
			
			
			else if(m is onbes){
				
				if(onbess.hitTestObject(onbes_)){
					onbes_Ok=true;
					m.x=onbes_.x+15;
					m.y=onbes_.y+15;
					kontrol();
					
				}else{
					m.x=firstX;
					m.y=firstY;
				}					
			}
			currentObject.removeEventListener(MouseEvent.MOUSE_UP, stopDragHandler);
			currentObject.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);					
		}
		
		public function kontrol():void{
			if(bir_Ok && iki_Ok && uc_Ok && dort_Ok && bes_Ok && alti_Ok && yedi_Ok && sekiz_Ok && dokuz_Ok && on_Ok && onbir_Ok && oniki_Ok && onuc_Ok && ondort_Ok && onbes_Ok){
				trace("ok");
				feed_1_mc.x=200;
				feed_1_mc.y=200;
				addChild(feed_1_mc);
				feed_1_mc.tamam_etiket_btn.addEventListener(MouseEvent.CLICK, kaldir);
			
			}
		}
		public function belgeCagir():void{
			birr.visible=false;
			ikii.visible=false;
			ucc.visible=false;
			dortt.visible=false;
			bess.visible=false;
			altii.visible=false;
			yedii.visible=false;
			sekizz.visible=false;
			dokuzz.visible=false;
			onn.visible=false;
			onbirr.visible=false;
			onikii.visible=false;
			onucc.visible=false;
			ondortt.visible=false;
			onbess.visible=false;
			
			arka_mc.visible=false;
			
			bir_.visible=false;
			iki_.visible=false;
			uc_.visible=false;
			dort_.visible=false;
			bes_.visible=false;
			alti_.visible=false;
			yedi_.visible=false;
			sekiz_.visible=false;
			dokuz_.visible=false;
			on_.visible=false;
			onbir_.visible=false;
			oniki_.visible=false;
			onuc_.visible=false;
			ondort_.visible=false;
			onbes_.visible=false;
			
			isyeriBelge_mc.visible=true;
		}
		public function kaldir(e:MouseEvent):void
		{ 
			belgeCagir();
			removeChild(feed_1_mc);
			feed_1_mc.tamam_etiket_btn.removeEventListener(MouseEvent.CLICK, kaldir);

		}
		
	}
	
}
