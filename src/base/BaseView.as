/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package base {
import flash.display.Sprite;
import flash.events.Event;
[Event(name="complete", type="flash.events.Event")]
public class BaseView extends Sprite {
    public function BaseView() {
        super();
    }

    public function createChildren():void {
        dispatchEvent(new Event(Event.COMPLETE));
    }

    public function destroy():void {
        while (numChildren){
            removeChildAt(0);
        }
    }
}
}
