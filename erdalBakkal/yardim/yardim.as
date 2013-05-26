package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class yardim extends MovieClip {
		
		
		public function yardim() {
			// constructor code			
			program_btn.addEventListener(MouseEvent.CLICK, programBaslat);
			konu_btn.addEventListener(MouseEvent.CLICK, konuBaslat);
			konuYardim_mc.konu_kapat_btn.addEventListener(MouseEvent.CLICK, konuKapat);
			programYardim_mc.program_kapat_btn.addEventListener(MouseEvent.CLICK, programKapat);			
			
			programYardim_mc.birr.addEventListener(MouseEvent.CLICK,birClicked);
			programYardim_mc.ikii.addEventListener(MouseEvent.CLICK,ikiClicked);
			programYardim_mc.ucc.addEventListener(MouseEvent.CLICK,ucClicked);
			programYardim_mc.dortt.addEventListener(MouseEvent.CLICK,dortClicked);
			programYardim_mc.bess.addEventListener(MouseEvent.CLICK,besClicked);
			
			
			konuYardim_mc.sekizz.addEventListener(MouseEvent.CLICK,sekizClicked);
			konuYardim_mc.dokuzz.addEventListener(MouseEvent.CLICK,dokuzClicked);
			konuYardim_mc.onn.addEventListener(MouseEvent.CLICK,onClicked);
			konuYardim_mc.onbirr.addEventListener(MouseEvent.CLICK,onbirClicked);
			konuYardim_mc.onikii.addEventListener(MouseEvent.CLICK,onikiClicked);
		}
		public function ufala():void{
			
			programYardim_mc.birr.height=73.05;
			programYardim_mc.birr.width=133.75;
			programYardim_mc.ikii.height=73.05;
			programYardim_mc.ikii.width=133.75;
			programYardim_mc.ucc.height=73.05;
			programYardim_mc.ucc.width=133.75;
			programYardim_mc.dortt.height=73.05;
			programYardim_mc.dortt.width=133.75;
			programYardim_mc.bess.height=73.05;
			programYardim_mc.bess.width=133.75;  
			
			
			konuYardim_mc.sekizz.height=73.05; 
			konuYardim_mc.sekizz.width=133.75;
			konuYardim_mc.dokuzz.height=73.05; 
			konuYardim_mc.dokuzz.width=133.75;
			konuYardim_mc.onn.height=73.05; 
			konuYardim_mc.onn.width=133.75;
			konuYardim_mc.onbirr.height=73.05; 
			konuYardim_mc.onbirr.width=133.75;
			konuYardim_mc.onikii.height=73.05; 
			konuYardim_mc.onikii.width=133.75; 
			
		}
		public function ufala_2():void{
			yardim_bir_mc.x=800;
			yardim_bir_mc.y=800;			
			yardim_iki_mc.x=800;
			yardim_iki_mc.y=800;			
			yardim_uc_mc.x=800;
			yardim_uc_mc.y=800;			
			yardim_dort_mc.x=800;
			yardim_dort_mc.y=800;			
			yardim_bes_mc.x=800;
			yardim_bes_mc.y=800;	
			
			yardim_sekiz_mc.x=800;			
			yardim_sekiz_mc.y=800;
			yardim_dokuz_mc.x=800;			
			yardim_dokuz_mc.y=800;
			yardim_on_mc.x=800;			
			yardim_on_mc.y=800;
			yardim_onbir_mc.x=800;			
			yardim_onbir_mc.y=800;
			yardim_oniki_mc.x=800;			
			yardim_oniki_mc.y=800;
		} 
		public function birClicked(e:MouseEvent):void{
			ufala();
			programYardim_mc.birr.height=90;
			programYardim_mc.birr.width=150;	
			ufala_2();
			yardim_bir_mc.x=225;
			yardim_bir_mc.y=200;
		}
		public function ikiClicked(e:MouseEvent):void{
			ufala();
			programYardim_mc.ikii.height=90;
			programYardim_mc.ikii.width=150;	
			ufala_2();
			yardim_iki_mc.x=225;
			yardim_iki_mc.y=200;
		}
		public function ucClicked(e:MouseEvent):void{
			ufala();
			programYardim_mc.ucc.height=90;
			programYardim_mc.ucc.width=150;			
			ufala_2();
			yardim_uc_mc.x=225;
			yardim_dort_mc.y=200;	
		}
		public function dortClicked(e:MouseEvent):void{
			ufala();
			programYardim_mc.dortt.height=90;
			programYardim_mc.dortt.width=150;	
			ufala_2();
			yardim_dort_mc.x=225;
			yardim_dort_mc.y=200;	
			
		}
		public function besClicked(e:MouseEvent):void{
			ufala();
			programYardim_mc.bess.height=90;
			programYardim_mc.bess.width=150;		
			ufala_2();
			yardim_bes_mc.x=225;
			yardim_bes_mc.y=200;
			
		}
		
		
		
		
		
		public function sekizClicked(e:MouseEvent):void{
			ufala();
			konuYardim_mc.sekizz.height=90;
			konuYardim_mc.sekizz.width=150;	
			ufala_2();
			yardim_sekiz_mc.x=225;
			yardim_sekiz_mc.y=200;
			
		}
		public function dokuzClicked(e:MouseEvent):void{
			ufala();
			konuYardim_mc.dokuzz.height=90;
			konuYardim_mc.dokuzz.width=150;	
			ufala_2();
			yardim_dokuz_mc.x=225;
			yardim_dokuz_mc.y=200;
			
		}
		public function onClicked(e:MouseEvent):void{
			ufala();
			konuYardim_mc.onn.height=90;
			konuYardim_mc.onn.width=150;	
			ufala_2();
			yardim_on_mc.x=225;
			yardim_on_mc.y=200;
			
		}
		public function onbirClicked(e:MouseEvent):void{
			ufala();
			konuYardim_mc.onbirr.height=90;
			konuYardim_mc.onbirr.width=150;	
			ufala_2();
			yardim_onbir_mc.x=225;
			yardim_onbir_mc.y=200;
			
		}
		public function onikiClicked(e:MouseEvent):void{
			ufala();
			konuYardim_mc.onikii.height=90;
			konuYardim_mc.onikii.width=150;	
			//setChildIndex(arka_oniki_mc,numChildren-1);
			ufala_2();
			yardim_oniki_mc.x=225;
			yardim_oniki_mc.y=200;
			
		}
		
		
		
		
		
		
		public function programBaslat(e:MouseEvent):void{
			ufala();
			ufala_2();
			programYardim_mc.x=200;
			programYardim_mc.y=100;
			yardim_bir_mc.x=225;
			yardim_bir_mc.y=200;
		}
		public function konuBaslat(e:MouseEvent):void{
			ufala();
			ufala_2();
			konuYardim_mc.x=200;
			konuYardim_mc.y=100;
			yardim_sekiz_mc.x=225;
			yardim_sekiz_mc.y=200;
		}		
		public function programKapat(e:MouseEvent):void{
			ufala();
			ufala_2();
			programYardim_mc.x=800;
			programYardim_mc.y=800;
		}
		public function konuKapat(e:MouseEvent):void{
			ufala();
			ufala_2();
			konuYardim_mc.x=800;
			konuYardim_mc.y=800;
		}
	}
	
}
