import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
 static SharedPreferences? sharedPreferences;
static Future <void> init ()async{
sharedPreferences =await SharedPreferences.getInstance();

}
static Future <void> saveTheme(String value)async{
await sharedPreferences?.setString('theme', value);
}
static getTheme(){
return  sharedPreferences?.getString('theme');
}
}
