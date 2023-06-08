import 'package:intl/intl.dart';

class MyDatetimeUtilies{
  static String formateDate (DateTime dateTime){
    DateFormat formater =DateFormat("dd/MMM/yyyy");
    return formater.format(dateTime);
  }
}