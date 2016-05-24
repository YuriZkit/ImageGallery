/**
 * Created by YuriZkit-Adm on 5/22/2016.
 */
package com.gallery.controllers {
import com.gallery.views.components.WelcomeView;

import org.robotlegs.mvcs.Command;

public class DisplayWelcomeScreenCommand extends Command {
    override public function execute():void {
        super.execute();
        contextView.addChildAt(new WelcomeView(), 0);
    }
}
}
