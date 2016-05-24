/**
 * Created by YuriZkit-Adm on 5/22/2016.
 */
package com.gallery.controllers {
import com.gallery.views.components.LoadingView;

import org.robotlegs.mvcs.Command;

public class DisplayLoaderCommand extends Command {
    override public function execute():void {
        super.execute();
        contextView.removeChildAt(0);
        contextView.addChildAt(new LoadingView(), 0);
    }
}
}
