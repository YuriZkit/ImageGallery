/**
 * Created by YuriZkit-Adm on 5/16/2016.
 */
package viewer {

import flash.utils.getDefinitionByName;

public class Assets {
   assets.basebutton;
   public static function getAssetType(str:String):Class {
      return getDefinitionByName(str) as Class
   }
}
}
