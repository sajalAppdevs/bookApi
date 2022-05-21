import 'package:bookappapi/Models/Volume_info.dart';

class Book{
 String? id;
 VolumeInfo? volumeInfo;

Book({this.volumeInfo});
factory Book.fromJson(Map<String,dynamic>json){
 var bookPars=Book();
 bookPars.id = json['id'];
 bookPars.volumeInfo=VolumeInfo.fromJson(json["volumeInfo"]);


 return bookPars;

}


}