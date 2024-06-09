

import 'package:cource_php_app/components/messages.dart';

validInput (String value , int min , int max){

   if (value.isEmpty){
  return "Can't be empty";
 }
  else if (value.length < min) {
    return '$messageInputMin $min';
  }
 
  else if (value.length > max) {
    return "$messageInputMax $max";
  }
  else {

  }
 
}