package  {
	import flash.events.Event;
	
	public class AktiviteEvent extends Event {


		public static const AKTIVITE_TAMAMLANDI:String = "aktiviteTamamlandi";
		public static const AKTIVITE_BASARISIZ:String = "aktiviteBasarisiz";
		
		public var Puan:Number;
 
		public function AktiviteEvent(_type:String, puan:Number = -1, _bubbles:Boolean = false, _cancelable:Boolean = false):void
		{
			super(_type, _bubbles, _cancelable);
			this.Puan = puan;
		}
 
		public override function clone():Event
		{
			return new AktiviteEvent(type, Puan, bubbles, cancelable);
		}
		
	}
	
}
