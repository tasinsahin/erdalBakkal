package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.geom.Rectangle;
		
	
	public class aktivite10 extends MovieClip {
		
     	var OranBir:Number = 56;
		var OranliBir:Number;
     	var OranIkiBir:Number = 50;
     	var OranIkiIki:Number = 10;
		var OranliIkiBir:Number;
		var OranliIkiIki:Number;
		var SonucBir:Number;
		var SonucIkiBir:Number;
		var SonucIkiIki:Number;
     	var Money:Number = 100;
		var denominator:Number=100;

		public function aktivite10() {
			// constructor code
			OranliBir=((Money/denominator)*OranBir);
			SonucBir= (Money-OranliBir);
			
			OranliIkiBir=((Money/denominator)*OranIkiBir);
			SonucIkiBir= (Money-OranliIkiBir);
						
			OranliIkiIki=((SonucIkiBir/100)*OranIkiIki);
			SonucIkiIki=(sonucIkiBir-OranliIkiIki);
			
			var ruler:Ruler=new Ruler(1,1);
			ruler.x=240;
			ruler.y=520;
			ruler.name="ruler";
			addChild(ruler);
			
			BIR.visible=false;
			IKI.visible=false;
			UC.visible=false;
			
			
			
			
			BIR.BIR.addEventListener(MouseEvent.CLICK,bireBasildi);
			IKI.IKI.addEventListener(MouseEvent.CLICK,ikiyeBasildi);
			UC.UC.addEventListener(MouseEvent.CLICK,uceBasildi);
			DORT.BDORTIR.addEventListener(MouseEvent.CLICK,dordeBasildi);
			BES.BES.addEventListener(MouseEvent.CLICK,beseBasildi);
		}
		
		
		
		public function bireBasildi(e:MouseEvent):void{ 
			if(SonucBir<SonucIkiIki){
				
			}
			else{
				
			}
		}
		public function ikiyeBasildi(e:MouseEvent):void{  
			if(SonucBir>SonucIkiIki){
				
			}			
			else{
				
			}
		}
		public function uceBasildi(e:MouseEvent):void{
		var ruler2:Ruler= getChildByName("ruler") as Ruler; 
			if(Number(UC.bir_txt.text)==OranliIkiIki){
				if(Number(UC.iki_text.text)==SonucIkiIki){
					IKI.visible=true;
				}
			}
			
		}
		public function dordeBasildi(e:MouseEvent):void{
		var ruler2:Ruler= getChildByName("ruler") as Ruler; 
			if(Number(DORT.uc_txt.text)==OranliIkiBir){
				if(Number(DORT.dort_txt.text)==SonucIkiBir){
					UC.visible=true;
				}
				
			}
			
		}
		public function beseBasildi(e:MouseEvent):void{
		var ruler2:Ruler= getChildByName("ruler") as Ruler; 
			if(Number(BES.bes_txt.text)==OranliBir){
				if(Number(BES.alti_txt.text==SonucBir){
					BIR.visible=true;
				}
			}
			
		}
		
		
		
		
		public function kaldir(e:MouseEvent):void{
			
		}
	}
	
}
