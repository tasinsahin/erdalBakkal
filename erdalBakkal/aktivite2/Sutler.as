package  {
	
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	
	public class Sutler extends MovieClip {
		
		var OncekiUrunX:Number = 0;
		var UrunSayisi:Number = 0;
		var ilkurun:UN = new UN();
		var t:Timer = new Timer(500);
		var urunNumarasi:Number=0;
		public function Sutler(urunSayisi:Number) {
			// constructor code
			//SimdikiUrun.x = 0;
			UrunSayisi = urunSayisi;
			//var urun:UN = new UN();	
			//urun.y = 0;
			//urun.x = 0;
			//urun.name = "urun1";
			//addChild(urun);
			//UrunSayisi++;
			t.addEventListener(TimerEvent.TIMER, Urunekle);
			t.start();
			
			
		}
		function Urunekle(e:TimerEvent) {
			OncekiUrunX++;
			var temp2:Number=OncekiUrunX%10;
			if (temp2==1 && urunNumarasi<UrunSayisi) 
			{
				//trace(OncekiUrun.x);
				
				urunNumarasi++;
				trace(UrunSayisi);
				var urun:UN = new UN();	
				urun.y = 0;
				urun.x --;
				urun.name = "urun" + UrunSayisi.toString();
				addChild(urun);
				if(urunNumarasi==0){
					ilkurun=urun;
				}
				trace(ilkurun.x);				
			}
			
			//OncekiUrun = getChildByName("urun" + (UrunSayisi - 1).toString()) as MovieClip ;
			//SimdikiUrun= getChildByName("urun" + (UrunSayisi).toString()) as MovieClip;
			//var ilkUrun:UN = getChildIndex("urun0") as UN;
			//if (ilkUrun.x>2000) 
			//{
				//t.stop();
			//}
			
			
		}
	}
	
}
