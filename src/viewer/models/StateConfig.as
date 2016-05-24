/**
 * Created by YuriZkit-Adm on 5/22/2016.
 */
package viewer.models {
public class StateConfig {
    public static const WELCOME_STATE:String = "state/welcomeState";
    public static const LOADING_STATE:String = "state/loadingState";
    public static const GALLERY_STATE:String = "state/galleryState";

    public static const DISPLAY_WELCOME:String = "event/displayWelcome";
    public static const DISPLAY_LOADER:String  = "event/displayLoader";
    public static const DISPLAY_GALLERY:String = "event/displayGallery";

    public static const LOADING_STARTED:String   = "action/loadingStarted";
    public static const LOADING_COMPLETED:String = "action/loadingCompleted";

    public static const FSM:XML =
            <fsm initial={WELCOME_STATE}>
                <state name={WELCOME_STATE} changed={DISPLAY_WELCOME}>
                    <transition action={LOADING_STARTED}
                                target={LOADING_STATE}/>
                </state>
                <state name={LOADING_STATE} changed={DISPLAY_LOADER}>
                    <transition action={LOADING_COMPLETED}
                                target={GALLERY_STATE}/>
                </state>
                <state name={GALLERY_STATE} changed={DISPLAY_GALLERY}>
                    <transition action={LOADING_STARTED}
                                target={LOADING_STATE}/>
                </state>
            </fsm>;
}
}
