/**
 * Created by YuriZkit-Adm on 5/22/2016.
 */
package viewer.controllers {
import org.robotlegs.mvcs.Command;

import viewer.views.components.WelcomeView;

public class DisplayWelcomeScreenCommand extends Command {
    override public function execute():void {
        super.execute();
        contextView.addChildAt(new WelcomeView(),0);
    }
}
}
