package  {  //  yapilacaklar, urun uretme, etiket uretme, etiketi urune ekleme, o urun oldugunu kontrol etme, feedbackleri duzenleme 
			// feedbackleri duzenleme, bittigini kontrol edip, rafa git feedbacki verme
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	
	public class aktivite3 extends MovieClip {
		
		var currentObject:MovieClip = new MovieClip();
		// cuval un
		var firstX:Number = 0;
		var firstY:Number = 0; 
		// Seker_Paket 
		var C_firstX:Number = 0;
		var C_firstY:Number = 0;
		// prop
		var heavy:Number = 20;
		var wholeMoney:Number = 30;
		var packetHeavy:Number = 2;
		var ratioBonibon:Number = 0;
		var ratioSakizli:Number = 0;
		// feedbacks
		var feed_1_mc:Feed_1 = new Feed_1();
		var feed_2_mc:Feed_2 = new Feed_2();
		var feed_3_mc:Feed_3 = new Feed_3();
		var feed_4_mc:Feed_4 = new Feed_4();
		var feed_5_mc:Feed_5 = new Feed_5();
		
		var urunMakinada_1:Boolean = false;
		var urunMakinada_2:Boolean = false;
		var paketlendi:Boolean = false;
		
		
		public function aktivite3() {
			// constructor code		} 
			
			bonibon_mc.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
			sakizli_mc.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
			karistir_btn.addEventListener(MouseEvent.CLICK, startDividing);
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
			currentObject.startDrag(); 
			firstX = currentObject.x;
			firstY = currentObject.y;
			stage.addEventListener(MouseEvent.MOUSE_UP, stopDragHandler);
			currentObject.removeEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
		}
		public function stopDragHandler(e:MouseEvent):void 
		{
			stopDrag();	
			var object:MovieClip = currentObject as MovieClip;
			
			if (object is Etiket_Fiyati) // etiket stop drag
			{
				if (object.hitTestObject(seker_paket_mc)) //etiket urune degiyor 
				{
						object.x = 0;
						object.y = 0;
						seker_paket_mc.addChild(object);		
						object.removeEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
						trace("vurdu");				
				}
				else {
					object.x=firstX;
					object.y=firstY;					
				}
				
			}
			else if ( object is Seker_Paket) {
			if (object.hitTestObject(drag_Take_2_mc)) { 
					feed_5_mc.x=200;
					feed_5_mc.y=200;
					addChild(feed_5_mc);	
					feed_5_mc.start_btn.addEventListener(MouseEvent.CLICK, aktiviteBitti);
				}
			}
			else if (object is Sakizli_Seker)  // un cuvali stop drag
			{
				
				if (object.hitTestObject(drag_Take_1_mc)) 
				{
						sakizli_mc.visible = false;	
						urunMakinada_1 = true;
				}
				else 
				{
					sakizli_mc.x = firstX;
					sakizli_mc.y = firstY;
				}
			}
			else if (object is Bonibon_Seker)  // un cuvali stop drag
			{
				
				if (object.hitTestObject(drag_Take_1_mc)) 
				{
						bonibon_mc.visible = false;	
						urunMakinada_2 = true;
				}
				else 
				{
					bonibon_mc.x = firstX;
					bonibon_mc.y = firstY;
				}
			}
			else if (object is Seker_Paket) // un paketi stop drag
			{
				
			}

			stage.removeEventListener(MouseEvent.MOUSE_UP, stopDragHandler);
			currentObject.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);			
		}
		public function aktiviteBitti(e:MouseEvent):void{
			removeChild(feed_5_mc);
			trace("ok");
			// tüm ürünler reyona suruklendi, aktivite bitti///////////////
			// tüm ürünler reyona suruklendi, aktivite bitti///////////////
			// tüm ürünler reyona suruklendi, aktivite bitti///////////////
			// tüm ürünler reyona suruklendi, aktivite bitti///////////////			
		}
		public function startDividing(e:MouseEvent)
		{
			if (urunMakinada_1 && urunMakinada_2 ) // urun makinada ,paket sayisi dogru animasyon baslasin
			{ 
				var newpacket:Seker_Paket = new Seker_Paket();
				addChild(newpacket);
				newpacket.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);				 
				paketlendi = true;
			}
			else if (!urunMakinada_1 || urunMakinada_2) // urun makinada degil feedback ver
			{
				feed_4_mc.x=200;
				feed_4_mc.y=200;
				addChild(feed_4_mc);
				feed_4_mc.tamam_etiket_btn.addEventListener(MouseEvent.CLICK, kaldir);
			}	
		}		
		public function startPorducing(e:MouseEvent)
		{
			trace((wholeMoney * packetHeavy) / heavy);
			if ((Number(sakizli_txt.text)==	ratioBonibon) && (Number(bonibon_txt.text)==	ratioSakizli )) // oranlar dogruysa etiket bas
			{
				if (paketlendi) // urun makinada, paketlenmis ve etiketi basabiliriz 
				{
					var etiket:Etiket_Fiyati = new Etiket_Fiyati;
					addChild(etiket);						
					etiket.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);					
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
