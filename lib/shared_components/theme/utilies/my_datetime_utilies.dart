import 'package:intl/intl.dart';

class MyDatetimeUtilies{
  static String formateDate (DateTime dateTime){
    DateFormat formater =DateFormat("m,d,y");
    return formater.format(dateTime);
  }
}