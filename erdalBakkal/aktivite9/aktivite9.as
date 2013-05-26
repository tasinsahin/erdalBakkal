package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	
	public class aktivite9 extends MovieClip {
		
		
		var currentObject:MovieClip = new MovieClip();
		var currentObjectName:String;
		var urunMakinada:Boolean = false;
		var A_etiketUretildi:Boolean=false;
		var B_etiketUretildi:Boolean=false;
		var A_Ok = false;
		var B_Ok = false;
		
		var hesap:Boolean=false;
				
		var rulerDenominator:Number;
		
		var firstX:Number = 0; 
		var firstY:Number = 0;
		// birinci urun 
		var A_Money:Number = 100;
		var A_Increase:Number = 10;
		var A_Increase2:Number = 10;
		var A_Increased:Number = 0;
		var A_Denominator:Number = 100;
		// ikinci urun
		var B_Money:Number = 100; 
		var B_Increase:Number = 10;
		var B_Increase2:Number = 10;
		var B_Increased:Number = 0;
		var B_Denominator:Number = 100;
		
		var feed_1_mc:Feed_1 = new Feed_1();
		var feed_2_mc:Feed_2 = new Feed_2();
		var feed_3_mc:Feed_3 = new Feed_3();
		var feed_4_mc:Feed_4 = new Feed_4();
		
		
		public function aktivite9() {
			// constructor code
			
			hesapMc_iki_mc.x=380;
			hesapMc_iki_mc.y=430;
			hesapMc_bir_mc.x=380;
			hesapMc_bir_mc.y=430;
			hesapMc_iki_mc.visible=false;
			
			var ruler:Ruler=new Ruler(1,1);
			ruler.x=240;
			ruler.y=520;
			ruler.name="ruler";
			addChild(ruler);
			
			
			trace("geliyoz");
			meyve_suyu_mc.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
			meyve_suyu_2_mc.addEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
			hesapMc_iki_mc.etiketUret_btn.addEventListener(MouseEvent.CLICK, startPorducing);
			hesapMc_bir_mc.hesapla_btn.addEventListener(MouseEvent.CLICK,hesapla)
		}
		public function hesapla(e:MouseEvent):void{
			
			var ruler2:Ruler= getChildByName("ruler") as Ruler;

			if (currentObjectName == "A"){
				if(hesapMc_bir_mc.indirimFiyat_txt.text==(A_Money/A_Denominator)*A_Increase){
					if(hesapMc_bir_mc.indirimliFiyat_txt.text==(A_Money-((A_Money/A_Denominator)*A_Increase))){
						hesapMc_iki_mc.indirimliFiyat_txt.text=A_Money-((A_Money/A_Denominator)*A_Increase);
						A_Increased=A_Money-((A_Money/A_Denominator)*A_Increase);
						rulerDenominator=A_Money-((A_Money/A_Denominator)*A_Increase);
						ruler2.animalWeight_txt.text = rulerDenominator.toString();

						hesapMc_bir_mc.visible=false;
						hesapMc_iki_mc.visible=true;
						
						hesap=true;
					}
					else {
						trace("indirimlii yanlis")
					}
				}
				else{
					trace("indirim yanlis");					
				}
			}
			else if (currentObjectName == "B"){
				if(hesapMc_bir_mc.indirimFiyat_txt.text==(B_Money/B_Denominator)*B_Increase){
					if(hesapMc_bir_mc.indirimliFiyat_txt.text==(B_Money-((B_Money/B_Denominator)*B_Increase))){
						hesapMc_iki_mc.indirimliFiyat_txt.text=(B_Money-((B_Money/B_Denominator)*B_Increase));
						B_Increased=B_Money-((B_Money/B_Denominator)*B_Increase);
						rulerDenominator=B_Money-((B_Money/B_Denominator)*B_Increase);
						ruler2.animalWeight_txt.text = rulerDenominator.toString();

						hesapMc_bir_mc.visible=false;
						hesapMc_iki_mc.visible=true;
						
						hesap=true;
					}
					else {
						trace("indirimlii yanlis")
					}
				}
				else{
					trace("indirim yanlis");					
				}
			}
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
			trace("adasda");
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
					
					if(object.hitTestObject(urunA.drag_Take_3_mc)){
					   object.x=0;
					   object.y=0;
					   urunA.addChild(object);
					   object.removeEventListener(MouseEvent.MOUSE_DOWN, startDragHandler);
					}
					else{
						object.x=firstX;
						object.y=firstY;
					}
				}
				else if (object.etiket_Urun=="B"){
					
					var urunB:MovieClip=getChildByName("meyve_suyu_2_mc") as MovieClip;
					
					if(object.hitTestObject(urunB.drag_Take_2_mc)){
					   object.x=0;
					   object.y=0;
					   urunB.addChild(object);
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
					if(!hesap){
						urunMakinada = true;
						currentObjectName = "A";
						rulerDenominator=A_Money;
						ruler2.animalWeight_txt.text = rulerDenominator.toString();
						fiyat_Olcer_txt.text= A_Money.toString();
						hesapMc_bir_mc.eskiFiyat_txt.text=A_Money.toString();
					}
				}
				else if(object.hitTestObject(drag_Take_2_mc)){
					A_Ok = true;
					if (A_Ok && B_Ok) 
					{
						aktiviteOK();
					}	
				}
				else if(object.hitTestObject(drag_Take_3_mc)){
					A_Ok = true;
					if (A_Ok && B_Ok) 
					{
						aktiviteOK();
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
					if(!hesap){
						urunMakinada = true;
						currentObjectName = "B";	
						rulerDenominator=B_Money;
						ruler2.animalWeight_txt.text = rulerDenominator.toString();
						fiyat_Olcer_txt.text= B_Money.toString();
						hesapMc_bir_mc.eskiFiyat_txt.text=B_Money.toString();
					}
				}			
				else if(object.hitTestObject(drag_Take_2_mc)){
					B_Ok = true;
					if (A_Ok && B_Ok) 
					{
						aktiviteOK();
					}
				}
				else if(object.hitTestObject(drag_Take_3_mc)){
					B_Ok = true;
					if (A_Ok && B_Ok) 
					{
						aktiviteOK();
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
			if (currentObjectName == "A")
			{	
				if (Number(hesapMc_iki_mc.KdvFiyat_txt.text)==Number(A_Increased/A_Denominator)*A_Increase2) //zam dogruysa
				{	
					if (Number(hesapMc_iki_mc.KdvliFiyat_txt.text)==A_Increased-(Number(A_Increased/A_Denominator)*A_Increase2))// zamlı dogruysa
					{ 
						if(!A_etiketUretildi){ 
							A_etiketUretildi=true;		
							var etiketA:Etiket_Fiyati=new Etiket_Fiyati();
							etiketA.fiyat.text=(A_Increased-(Number(A_Increased/A_Denominator)*A_Increase2)).toString();
							etiketA.etiket_Urun="A";
							etiketA.x=300;
							etiketA.y=300;
							addChild(etiketA);
							etiketA.addEventListener(MouseEvent.MOUSE_DOWN,startDragHandler);
							
							hesap=false;
							
							hesapMc_iki_mc.visible=false;
							hesapMc_bir_mc.visible=true;
							hesapMc_bir_mc.eskiFiyat_txt.text="";
							hesapMc_bir_mc.indirimFiyat_txt.text="";
							hesapMc_bir_mc.indirimliFiyat_txt.text=""; 
							
							hesapMc_iki_mc.indirimliFiyat_txt.text=""; 
							hesapMc_iki_mc.KdvFiyat_txt.text=""; 
							hesapMc_iki_mc.KdvliFiyat_txt.text=""; 
						}
						else{ // etiket zaten uretildi
							
						}
					}
					else 
					{
						addChild(feed_1_mc); // feedback vericek
						feed_1_mc.tamam_etiket_btn.addEventListener(MouseEvent.CLICK, kaldir);
						 
					}
				}			
				else 
				{		
						addChild(feed_2_mc); // feedback vericek
						feed_2_mc.tamam_etiket_btn.addEventListener(MouseEvent.CLICK, kaldir);
 				}
			}	
			if (currentObjectName == "B")
			{	
				if (Number(hesapMc_iki_mc.KdvFiyat_txt.text)==(Number(B_Increased/B_Denominator)*B_Increase2)) //zam dogruysa
				{	
					if (Number(hesapMc_iki_mc.KdvliFiyat_txt.text)==Number(B_Increased-(Number(B_Increased/B_Denominator)*B_Increase2))) // zamlı dogruysa
					{				
						if(!B_etiketUretildi){	
							B_etiketUretildi=true;							
							var etiketB:Etiket_Fiyati=new Etiket_Fiyati();
							etiketB.fiyat.text=((Number(B_Increased)-(Number(B_Increased/B_Denominator)*B_Increase2))).toString();
							etiketB.etiket_Urun="B";
							etiketB.x=300;
							etiketB.y=300;
							addChild(etiketB);
							etiketB.addEventListener(MouseEvent.MOUSE_DOWN,startDragHandler);
							
							hesap=false;
							
							hesapMc_iki_mc.visible=false;
							hesapMc_bir_mc.visible=true;
							hesapMc_bir_mc.eskiFiyat_txt.text="";
							hesapMc_bir_mc.indirimFiyat_txt.text="";
							hesapMc_bir_mc.indirimliFiyat_txt.text=""; 
							
							hesapMc_iki_mc.indirimliFiyat_txt.text=""; 
							hesapMc_iki_mc.KdvFiyat_txt.text=""; 
							hesapMc_iki_mc.KdvliFiyat_txt.text=""; 
						}
						else{ // etiket zaten uretildi
							
						}
					}
					else 
					{	
						addChild(feed_3_mc); // feedback vericek 
						feed_1_mc.tamam_etiket_btn.addEventListener(MouseEvent.CLICK, kaldir);
 					}
				}			
				else 
				{	
						 addChild(feed_4_mc);// feedback vericek
						feed_2_mc.tamam_etiket_btn.addEventListener(MouseEvent.CLICK, kaldir);
 				}
			}	
		}  	
		public function aktiviteOK():void {
			trace("aktivite 8 Ok");
					/////////////////////// aktivite bitti///////////////////////
					/////////////////////// aktivite bitti///////////////////////
					/////////////////////// aktivite bitti///////////////////////
					/////////////////////// aktivite bitti///////////////////////
					/////////////////////// aktivite bitti///////////////////////				
		}	
	}
	
}
