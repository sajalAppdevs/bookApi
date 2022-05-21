import 'package:bookappapi/Models/images.dart';

class VolumeInfo{
  late String? title;
  late List<String>?authors;
  late ImageLinks? imageLinks;

  VolumeInfo({this.title, this.authors, this.imageLinks});

  factory VolumeInfo.fromJson(Map<String,dynamic>json){
    var volumeInfoParsed =VolumeInfo();
    volumeInfoParsed.title=json["title"];
    volumeInfoParsed.authors=[];
    for(var authorStr in json["authors"]){
      volumeInfoParsed.authors?.add(authorStr as String);
    }
    volumeInfoParsed.imageLinks=ImageLinks.fromJson(json['imageLinks']);
    return volumeInfoParsed ;
  }







}