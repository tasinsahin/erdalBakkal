package  {
	
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.events.MouseEvent;
	
	
	public class anaEkran extends MovieClip {
				
		var Akviteler:Array=new Array("~aktivite1\aktivite1.swf","~aktivite2\aktivite2.swf","~aktivite3\aktivite3.swf","~kalfa\kalfa.swf","~aktivite4\aktivite4.swf","~aktivite5\aktivite5.swf","~aktivite6\aktivite6.swf","~aktivite7\aktivite7.swf","~aktivite8\aktivite8.swf","~aktivite9\aktivite9.swf","~aktivite10\aktivite10.swf","~usta\usta.swf");
		var index=0;
		
		var yuklenen:MovieClip;
		
		public function anaEkran() {
			// constructor code			
			preloader.visible=false;
			sonraki.visible=true;
			init();
		}
		
		function init():void {
			trace("init");
			
			sonraki.addEventListener(MouseEvent.CLICK, sonrakiniYukle);
			yukle();
			
		}
		
		
		function yukle ():void {
			preloader.visible=true;
			var yukleyici:Loader=new Loader();			
			yukleyici.contentLoaderInfo.addEventListener(Event.INIT, yuklemeBitti);
			yukleyici.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, yukleniyor)
			yukleyici.load(new URLRequest(Akviteler[index]));
			
		}
		function yukleniyor(e:ProgressEvent) {			
			trace(e.bytesTotal + "/"+ e.bytesLoaded);
			preloader.yuzde.text=String(Math.round((e.bytesLoaded/e.bytesTotal * 100)));
		}
		
		function yuklemeBitti(e:Event) {
			if(yuklenen!=null) {
				removeChild(yuklenen);
			}
			yuklenen= MovieClip(e.currentTarget.content)
			preloader.visible=false;
			addChild( yuklenen);
			index++;
			yuklenen.addEventListener(AktiviteEvent.AKTIVITE_TAMAMLANDI, aktiviteTamam);
			//yuklenen.play();
		}
		
		
		function sonrakiniYukle(e:MouseEvent):void {
			yukle();
		}
		
		function aktiviteTamam(e:AktiviteEvent) {
			trace(e.Puan);
			sonraki.visible=true;
		}
	}
	
}
