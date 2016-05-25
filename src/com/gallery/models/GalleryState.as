/**
 * Created by YuriZkit-Adm on 5/22/2016.
 */
package com.gallery.models {
public class GalleryState {
    public static const STATE_WELCOME:String = "state/welcomeState";
    public static const STATE_LOADING:String = "state/loadingState";
    public static const STATE_GALLERY:String = "state/galleryState";

    public static const DISPLAY_WELCOME:String = "event/displayWelcome";
    public static const DISPLAY_LOADER:String = "event/displayLoader";
    public static const DISPLAY_GALLERY:String = "event/displayGallery";

    public static const LOADING_STARTED:String = "action/loadingStarted";
    public static const LOADING_COMPLETED:String = "action/loadingCompleted";

    public static const FSM:XML =
            <fsm initial={STATE_WELCOME}>
                <state name={STATE_WELCOME} changed={DISPLAY_WELCOME}>
                    <transition action={LOADING_STARTED}
                                target={STATE_LOADING}/>
                </state>
                <state name={STATE_LOADING} changed={DISPLAY_LOADER}>
                    <transition action={LOADING_COMPLETED}
                                target={STATE_GALLERY}/>
                </state>
                <state name={STATE_GALLERY} changed={DISPLAY_GALLERY}>
                    <transition action={LOADING_STARTED}
                                target={STATE_LOADING}/>
                </state>
            </fsm>;
}
}
