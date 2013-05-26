
package
{
    import flash.display.Graphics;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    public class dragCircle extends Sprite
    {
        // UI container
        private var dial:Sprite;
        // Draggable object. Can be anything. I chose arrow.
        private var arrow:Sprite;
        // circle radius - play with changing this value
        private var radius:Number = 100;
        // convert to radians - do it once to save on processing power
        private var angleConvert:Number = 180 / Math.PI;
        // calculated angle
        private var angle:Number = 0;
        /**
         * Constructor.
         */
        public function dragCircle() 
        {
            if (stage) init();
            else addEventListener(Event.ADDED_TO_STAGE, init);
        }
        /**
         * Initializes UI
         * @param   e
         */
        private function init(e:Event = null):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, init);
            makeDial();
            makeArrow();
        }
        /**
         * MouseEvent.MOUSE_MOVE handler.
         * @param   e
         */
        private function onMove(e:MouseEvent):void
        {
            // calculate angle between mouse position and the center of dial
            angle = Math.atan2(mouseY - dial.y, mouseX - dial.x);
            // reposition arrow according to angle
            arrow.x = radius * Math.cos(angle);
            arrow.y = radius * Math.sin(angle);
            // rotate arrow so that it always point outward
            arrow.rotation = angleConvert * angle + 90;
        }
        /**
         * MouseEvent.MOUSE_DOWN handler
         * @param   e
         */
        private function onArrowDown(e:MouseEvent):void
        {
            /**
             * MouseEvents listeners are added to STAGE - not arrow.
             * This way event if Mouse is not over arrow - interaction is preserved.
             */
            stage.addEventListener(MouseEvent.MOUSE_MOVE, onMove);
            stage.addEventListener(MouseEvent.MOUSE_UP, onStageUp);
        }
        /**
         * MouseEvent.MOUSE_UP handler
         * @param   e
         */
        private function onStageUp(e:MouseEvent):void
        {
            // by removing listeners we stop interaction.
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMove);
            stage.removeEventListener(MouseEvent.MOUSE_UP, onStageUp);
        }
        /**
         * Instantiates dial container and draws circle inside it.
         */
        private function makeDial():void {
            dial = new Sprite();
            var g:Graphics = dial.graphics;
			g.beginFill(0x000000,1);
            g.lineStyle(1, 0x000000);
            g.drawCircle(0, 0, radius);
			g.endFill();
            dial.x = dial.y = radius + 50;
            addChild(dial);
        }
        /**
         * Instantiates arrow, draws triangle and adds arrow to dial display list.
         */
        private function makeArrow():void {
            arrow = new Sprite();
            // draw triangle
            var g:Graphics = arrow.graphics;
            g.beginFill(0xFFFFFF);
            g.moveTo(0, 0);
            g.lineTo(0, 40);
            g.lineTo( 7, 40);
            g.lineTo( 7, 0);
            g.lineTo( 0, 0);
            g.endFill();
            // position arrow on the top of circle
            arrow.y = -radius;
            dial.addChild(arrow);
            // make arrow interactive
            arrow.buttonMode = arrow.useHandCursor = true;
            arrow.addEventListener(MouseEvent.MOUSE_DOWN, onArrowDown);
        }
    }
}