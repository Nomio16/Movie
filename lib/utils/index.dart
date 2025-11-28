class Utils{
  static String integerMinToStrin(int ?min){
    if(min ==null) return "-";
    return "${(min/60).floor()} цаг ${min%60} мин";

  }
}