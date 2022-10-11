class Data {
  Data({
    required this.id ,
    required this.Date ,
    required this.Clock_In,
    required this.Clock_Out,
    required this.Break_Time,
    required this.Late_By,
    required this.Early_By,
    required this.Working_Hours,
    required this.isSelected,
  });
  int   id ;
  String  Date ;
  int Clock_In;
  String Clock_Out;
  String Late_By;
  String Early_By;
  String Break_Time;
  String Working_Hours;
  bool isSelected;
}