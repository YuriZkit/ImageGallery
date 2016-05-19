/**
 * Created by YuriZkit-Adm on 5/17/2016.
 */
package viewer.events {
import flash.events.Event;

public class UIEvent extends Event {
    public static const ACTION_BROWSE:String = "action_browse";
    public function UIEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, bubbles, cancelable);
    }
}
}
