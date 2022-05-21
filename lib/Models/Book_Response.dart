
import 'package:bookappapi/Models/Book.dart';

class BookResponse{

  int? totalItems;
  late List<Book>?items;
  BookResponse({this.totalItems, this.items});
  factory BookResponse.fromJson(Map<String,dynamic>JsonData){
    var bookResponse=BookResponse();
    bookResponse.totalItems=JsonData['totalItems'];
    bookResponse.items=[];
    for(var bookJson in(JsonData['items']as List<dynamic>)){
      var bookMap=bookJson as Map<String,dynamic>;
      bookResponse.items?.add(Book.fromJson(bookMap));

    }

    return bookResponse;

  }
}