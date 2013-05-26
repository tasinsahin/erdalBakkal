package  {//  yapilacaklar, urun uretme, etiket uretme, etiketi urune ekleme, o urun oldugunu kontrol etme, feedbackleri duzenleme 
			// feedbackleri duzenleme, bittigini kontrol edip, rafa git feedbacki verme
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	
	
	public class aktivite1 extends MovieClip {
		var urunArray:Array = new Array(); 
		var urunler:Sutler=new Sutler(5);
		var urunEtiketlendi:Boolean=false;
		var First_X:Number=0;
		var First_Y:Number=0;
		var vurdu:Boolean = true;
		var tamamUrun:Number = 0;
		
		var t:Timer=new Timer(10);
		
		var currentObject:MovieClip = new MovieClip();
		// etiket
		var etiket_X:Number=1000;
		var etiket_Y:Number=150;
		// cuval un
		var A_firstX:Number = 0;
		var A_firstY:Number = 0;
		// paket un
		var B_firstX:Number = 0;
		var B_firstY:Number = 0;
		// prop
		var heavy:Number = 20;
		var wholeMoney:Number = 30;
		var packetHeavy:Number = 4;
		// feedbacks
		var feed_1_mc:Feed_1 = new Feed_1();
		var feed_2_mc:Feed_2 = new Feed_2();
		var feed_3_mc:Feed_3 = new Feed_3();
		var feed_4_mc:Feed_4 = new Feed_4();
		var feed_5_mc:Feed_5 = new Feed_5();
		
		var urunMakinada:Boolean = false;
		var paketlendi:Boolean = false;
		
		public function aktivite1() {
			// constructor code
			A_firstX = un_mc.x;
			A_firstY=un_mc.y;
			un_mc.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
			bol_btn.addEventListener(MouseEvent.CLICK, startDividing);
			produce_btn.addEventListener(MouseEvent.CLICK, startPorducing);
			
		}
		public function kaldir(e:MouseEvent):void
		{
			var m:MovieClip = e.currentTarget.parent as MovieClip;
			if (m is Feed_1) 
			{
				removeChild(feed_1_mc);
			}
			else if	(m is Feed_2) 
			{
				removeChild(feed_2_mc);
			}
			else if (m is Feed_3) 
			{
				removeChild(feed_3_mc);
			}
			else if (m is Feed_4) 
			{
				removeChild(feed_4_mc);
			}
		}
		
		public function startDragHandler(e:MouseEvent):void 
		{
			currentObject = e.currentTarget as MovieClip;
			First_X=currentObject.x;
			First_Y=currentObject.y;
			currentObject.startDrag(); 
			
			stage.addEventListener(MouseEvent.MOUSE_UP, stopDragHandler);
			currentObject.removeEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
		}
		public function stopDragHandler(e:MouseEvent):void 
		{
			stopDrag();	
			var object:MovieClip = currentObject as MovieClip;
			var me:MovieClip=getChildByName("duranunlar") as MovieClip;

			if (object is Etiket_Fiyati) // etiket stop drag
			{	
				for(var i:Number=0;i<5;i++){ 
				
					trace(i);
					var urunMovie:MovieClip=me.getChildByName("urun"+i.toString()) as MovieClip;
					
					if (object.hitTestObject(urunMovie.ic)) {	
						vurdu = true;
						if(!urunMovie.etiketlendi){
							
							object.x = 0;
							object.y = 0;
							urunMovie.addChild(object);	
							//setChildIndex(m, 3);
							//var p:Point=urunMovie.globalToLocal(new Point(object.x,object.y));
							//object.x=p.x;
							//object.y=p.y;
							urunMovie.etiketlendi=true;
							object.removeEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
							trace("vurdu");
							break;
						}
						else {
							vurdu = false;							
						}						
					}
					else {
						trace("salak elsein icinde");
						//vurdu=false;  
						vurdu = false;
					}					
				}
				if(!vurdu){					
					object.x=First_X;
					object.y=First_Y;
				}
			}
			
			
			else if (object is Un_Paket)  // un cuvali stop drag
			{
				
				if (object.hitTestObject(drag_Take_1_mc)) 
				{
					un_mc.visible = false;	
					urunMakinada = true;
				}
				else 
				{
					un_mc.x = A_firstX;
					un_mc.y = A_firstY;
				}
			}
			
			else if (object is DURANUN) // un paketi stop drag
			{
				trace("girdi durana");
				if (object.hitTestObject(drag_Take_2_mc)) {
					
					if (object.etiketlendi) {
						trace("etiketli degdi");
						tamamUrun++;
						 trace(tamamUrun);
						if (tamamUrun == Number(heavy / packetHeavy)) { 
							feed_5_mc.x=200;
							feed_5_mc.y=200;
							addChild(feed_5_mc);	
							feed_5_mc.start_btn.addEventListener(MouseEvent.CLICK, aktiviteBitti);
						}

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
			stage.removeEventListener(MouseEvent.MOUSE_UP, stopDragHandler);
			currentObject.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);			
		}
		public function startDividing(e:MouseEvent)
		{
			if (urunMakinada) // urun makinada ,paket sayisi dogru animasyon baslasin
			{
				if (Number(bol_txt.text)==heavy/packetHeavy	) // paket sayisi dogru bolme islemi baslasin
				{
					urunler.x=300;
					urunler.y=400;
					addChild(urunler);
					setChildIndex(urunler,3);
					t.start();
					paketlendi = true;
					t.addEventListener(TimerEvent.TIMER,urunBittiyseYenile); 
				}
				else  // urun makinada degil feedback ver
				{
					feed_3_mc.x=200;
					feed_3_mc.y=200;
					addChild(feed_3_mc);					
					feed_3_mc.tamamPaket_btn.addEventListener(MouseEvent.CLICK, kaldir);
				}
		}
		else if(!urunMakinada)// paket sayisi dogru degil, feedback ver
		{
			feed_4_mc.x=200;
			feed_4_mc.y=200;
			addChild(feed_4_mc);	
			feed_4_mc.tamam_etiket_btn.addEventListener(MouseEvent.CLICK, kaldir);
		}
		}	
		public function urunBittiyseYenile(e:TimerEvent):void{
			if(urunler.ilkurun.x>630){
				var duranunlar:DURANUNLAR = new DURANUNLAR(5);
				duranunlar.name="duranunlar";
				duranunlar.x=300;	
				duranunlar.y=50;
				removeChild(urunler);
				addChild(duranunlar);	
				setChildIndex(duranunlar,3);
				t.stop(); 
				for(var i:Number=0;i<5;i++){ 
							var me:MovieClip=getChildByName("duranunlar") as MovieClip;

					var urunMovie:MovieClip=me.getChildByName("urun"+i.toString()) as MovieClip;
					urunMovie.addEventListener(MouseEvent.MOUSE_DOWN,startDragHandler);
				}
					
			}
		}
		public function aktiviteBitti(e:MouseEvent):void{
			removeChild(feed_5_mc);
			trace("ok");
			// tüm ürünler reyona suruklendi, aktivite bitti///////////////
			// tüm ürünler reyona suruklendi, aktivite bitti///////////////
			// tüm ürünler reyona suruklendi, aktivite bitti///////////////
			// tüm ürünler reyona suruklendi, aktivite bitti///////////////			
		}
		public function startPorducing(e:MouseEvent)
		{
			trace((wholeMoney * packetHeavy) / heavy);
			if (Number(money_txt.text)==	(wholeMoney*packetHeavy)/heavy) // adet fiyati dogru etiket bas
			{
				if (paketlendi) // urun makinada, paketlenmis ve etiketi basabiliriz 
				{
					for (var i:Number = 0; i < heavy / packetHeavy ; i++ ) {
						var etiket:Etiket_Fiyati = new Etiket_Fiyati;
						etiket.x=etiket_X-40+(i*5);
						etiket.y=etiket_Y+170+(i*5);
						etiket.fiyat.text=((wholeMoney*packetHeavy)/heavy).toString()+" Lira";
						addChild(etiket);						
						etiket.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
					}
				}
				else if (!paketlendi)
				{
					feed_2_mc.x=200;
					feed_2_mc.y=200;
					addChild(feed_2_mc);
					feed_2_mc.tamam_etiket_btn.addEventListener(MouseEvent.CLICK, kaldir);
				}				
			}
			else 
			{
				feed_1_mc.x=200;
				feed_1_mc.y=200;
				addChild(feed_1_mc);
				feed_1_mc.tamam_etiket_btn.addEventListener(MouseEvent.CLICK, kaldir);
			}
		}
	}
	
}
