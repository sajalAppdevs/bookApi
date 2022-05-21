import 'package:bookappapi/Models/images.dart';

class ImageLinks{
  late String? thumbnail;
  String? extraLarge;
  ImageLinks({this.thumbnail});

  factory ImageLinks.fromJson(Map<String,dynamic>Json){
    var imageLinks = ImageLinks();
    imageLinks.thumbnail=Json['thumbnail'];
    imageLinks.extraLarge=Json['extraLarge'];

    return imageLinks;
  }


}