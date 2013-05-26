package  { // yapilacaklar, etiket uretme, etiketi urune ekleme, o urun oldugunu kontrol etme, feedbackleri duzenleme 
			// feedbackleri duzenleme, bittigini kontrol edip, rafa git feedbacki verme
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	public class aktivite4 extends MovieClip {
		
		
		var currentObject:MovieClip = new MovieClip();
		var currentObjectName:String;
		var urunMakinada:Boolean = false;
		var A_etiketUretildi:Boolean=false;
		var B_etiketUretildi:Boolean=false;
		var A_Ok:Boolean = false;
		var B_Ok:Boolean = false;
		
		var firstX:Number = 0; 
		var firstY:Number = 0;
		// birinci urun 
		var A_Money:Number = 30;
		var A_Increase:Number = 10;
		var A_Denominator:Number = 100;
		// ikinci urun
		var B_Money:Number = 40; 
		var B_Increase:Number = 10;
		var B_Denominator:Number = 100;
		
		var feed_2_mc:Feed_2 = new Feed_2();
		var feed_3_mc:Feed_3 = new Feed_3();
		var feed_4_mc:Feed_4 = new Feed_4();
		var feed_5_mc:Feed_5 = new Feed_5();

		public function aktivite4() {
			// constructor 			
			
			
			var ruler:Ruler=new Ruler(1,1);
			ruler.x=265;
			ruler.y=508; 
			ruler.name="ruler";
			addChild(ruler);
			
			
			meyve_suyu_mc.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
			meyve_suyu_2_mc.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
			etiketUret_btn.addEventListener(MouseEvent.CLICK, startPorducing);
		}
		public function kaldir(e:MouseEvent):void
		{
			var m:MovieClip = e.currentTarget.parent as MovieClip;
			if	(m is Feed_2) 
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
			firstX=currentObject.x;
			firstY=currentObject.y;
			stage.addEventListener(MouseEvent.MOUSE_UP, stopDragHandler);
			currentObject.removeEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
		}
		public function stopDragHandler(e:MouseEvent):void 
		{
			stopDrag();	
			var object:MovieClip = currentObject as MovieClip;
			
			var ruler2:Ruler= getChildByName("ruler") as Ruler;
			
			if(object is Etiket_Fiyati){
				
				if(object.etiket_Urun=="A"){
					
					var urunA:MovieClip=getChildByName("meyve_suyu_mc") as MovieClip;
					
					if(object.hitTestObject(urunA.drag_Take_2_mc)){
					   object.x=0;
					   object.y=0;
					   urunA.addChild(object);
					   A_Ok = true;
					   object.removeEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
					}
					else{
						object.x=firstX;
						object.y=firstY;
					}
				}
				else if (object.etiket_Urun=="B"){
					
					var urunB:MovieClip=getChildByName("meyve_suyu_2_mc") as MovieClip;
					
					if(object.hitTestObject(urunB.drag_Take_3_mc)){
					   object.x=0;
					   object.y=0;
					   urunB.addChild(object);
					   B_Ok = true;
					   object.removeEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
					
					}
					else{
						object.x=firstX;
						object.y=firstY;						   
					 }
				}
			}
			if (object is meyve_suyu_urun)
			{
				
				if (object.hitTestObject(drag_Take_1_mc)) 
				{ 
						urunMakinada = true;
						currentObjectName = "A";
						ruler2.animalWeight_txt.text = A_Money.toString();
						fiyat_Olcer_txt.text=A_Money.toString();
						eskiFiyat_txt.text=A_Money.toString();
				}
				else if(object.hitTestObject(drag_Take_2_mc)){// yerine donuyor
					if(urunMakinada){
						urunMakinada=false;
						if (A_Ok && B_Ok) {
							feed_5_mc.x=200;
							feed_5_mc.y=200;
							addChild(feed_5_mc);	
							feed_5_mc.start_btn.addEventListener(MouseEvent.CLICK, aktiviteBitti);			
						}
					}
				}
				else if(object.hitTestObject(drag_Take_3_mc)){// yerine donuyor
 					if(urunMakinada){
						urunMakinada=false;
						if (A_Ok && B_Ok) {
							feed_5_mc.x=200;
							feed_5_mc.y=200;
							addChild(feed_5_mc);	
							feed_5_mc.start_btn.addEventListener(MouseEvent.CLICK, aktiviteBitti);				
						}						
					}
					
				}
				else 
				{
					meyve_suyu_mc.x =firstX;
					meyve_suyu_mc.y =firstY;
				}
			}
			else if (object is meyve_suyu_2_urun)  
			{				
				if (object.hitTestObject(drag_Take_1_mc)) 
				{ 
						urunMakinada = true;
						currentObjectName = "B";					
						ruler2.animalWeight_txt.text = B_Money.toString();
						fiyat_Olcer_txt.text=B_Money.toString();
						eskiFiyat_txt.text=B_Money.toString();
				}			
				else if(object.hitTestObject(drag_Take_2_mc)){ // yerine donuyor
 					urunMakinada=false;
					
					if(urunMakinada){						
						if (A_Ok && B_Ok ) 
						{
							feed_5_mc.x=200;
							feed_5_mc.y=200;
							addChild(feed_5_mc);	
							feed_5_mc.start_btn.addEventListener(MouseEvent.CLICK, aktiviteBitti);					
						}
					}
				}
				else if(object.hitTestObject(drag_Take_3_mc)){ // yerine donuyor
 					urunMakinada=false;
					if(urunMakinada){
						if (A_Ok && B_Ok) 
						{
							feed_5_mc.x=200;
							feed_5_mc.y=200;
							addChild(feed_5_mc);	
							feed_5_mc.start_btn.addEventListener(MouseEvent.CLICK, aktiviteBitti);								
						}
					}
				}
				else 
				{
					meyve_suyu_2_mc.x = firstX;
					meyve_suyu_2_mc.y = firstY;
				}
			}
			object.removeEventListener(MouseEvent.MOUSE_UP, stopDragHandler);
			currentObject.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);			
		}		
		public function startPorducing(e:MouseEvent)
		{
			if(urunMakinada){
				if (currentObjectName == "A")
				{	
					if (Number(zamFiyat_txt.text)==Number((A_Money/A_Denominator)*A_Increase)) //zam dogruysa
					{	
						if (Number(yeniFiyat_txt.text)==A_Money+Number(zamFiyat_txt.text)	) // zamlı dogruysa
						{ 
							if(!A_etiketUretildi){ 
								A_etiketUretildi=true;		
								var etiketA:Etiket_Fiyati=new Etiket_Fiyati();
								etiketA.fiyat.text=yeniFiyat_txt.text.toString()
								etiketA.etiket_Urun="A";
								etiketA.x=300;
								etiketA.y=300;
								addChild(etiketA);
								etiketA.addEventListener(MouseEvent.MOUSE_DOWN,startDragHandler);
								textboxTemixle();	
							}
							else{ // etiket zaten uretildi
								
							}
						}
						else 
						{
							feed_3_mc.x=200;
							feed_3_mc.y=200;
							addChild(feed_3_mc); // feedback vericek
							feed_3_mc.tamamPaket_btn.addEventListener(MouseEvent.CLICK, kaldir);
							 
						}
					}			
					else 
					{		feed_4_mc.x=200;
							feed_4_mc.y=200;
							addChild(feed_4_mc); // feedback vericek
							feed_4_mc.tamam_etiket_btn.addEventListener(MouseEvent.CLICK, kaldir);
					}
				}	
				if (currentObjectName == "B")
				{	
					if (Number(zamFiyat_txt.text)==Number((B_Money/B_Denominator)*B_Increase)) //zam dogruysa
					{	
						if (Number(yeniFiyat_txt.text)==B_Money+Number(zamFiyat_txt.text)	) // zamlı dogruysa
						{				
							if(!B_etiketUretildi){	
								B_etiketUretildi=true;							
								var etiketB:Etiket_Fiyati=new Etiket_Fiyati();
								etiketB.fiyat.text=yeniFiyat_txt.text.toString();
								etiketB.etiket_Urun="B";
								etiketB.x=300;
								etiketB.y=300;
								addChild(etiketB);
								etiketB.addEventListener(MouseEvent.MOUSE_DOWN,startDragHandler);
								textboxTemixle();	
							}
							else{ // etiket zaten uretildi
								
							}
						}
						else 
						{	
							feed_3_mc.x=200;
							feed_3_mc.y=200;
							addChild(feed_3_mc); // feedback vericek 
							feed_3_mc.tamamPaket_btn.addEventListener(MouseEvent.CLICK, kaldir);
						}
					}			
					else 
					{	
							feed_4_mc.x=200;
							feed_4_mc.y=200;
							addChild(feed_4_mc);// feedback vericek
							feed_4_mc.tamam_etiket_btn.addEventListener(MouseEvent.CLICK, kaldir);
					}
				}	
			}
		else if(!urunMakinada){
				feed_2_mc.x=200;
				feed_2_mc.y=200;
				addChild(feed_2_mc);// feedback vericek
				feed_2_mc.tamam_etiket_btn.addEventListener(MouseEvent.CLICK, kaldir);
			
		}		
		}
		public function textboxTemixle():void{
			yeniFiyat_txt.text="";
			zamFiyat_txt.text="";
			eskiFiyat_txt.text="";
		} 
		public function aktiviteBitti(e:MouseEvent):void{
			removeChild(feed_5_mc);
			trace("ok");
			// tüm ürünler reyona suruklendi, aktivite bitti///////////////
			// tüm ürünler reyona suruklendi, aktivite bitti///////////////
			// tüm ürünler reyona suruklendi, aktivite bitti///////////////
			// tüm ürünler reyona suruklendi, aktivite bitti///////////////			
		}
		
	}
	
}
