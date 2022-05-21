import 'dart:convert';
import 'package:bookappapi/Models/Book.dart';
import 'package:bookappapi/Models/Book_Response.dart';
import 'package:bookappapi/listbook.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  BookResponse? response;
  bool _isLoading=false;
  TextEditingController textEditingController=TextEditingController();
   String get searchKeyword=> textEditingController.text;


  @override
  // void initState(){
  //   super.initState();
  //   _CallApi();
  // }

  _CallApi()async{
    setState((){
      _isLoading=true;
    });
    try{
      var url=Uri.parse("https://www.googleapis.com/books/v1/volumes?q=$searchKeyword");
      var response=await http.get(url);
      var StringRespne=response.body;
     // var decodeJson=jsonDecode(StringRespne)as Map<String,dynamic>;
      var decodedJson = jsonDecode(StringRespne);
      setState((){
        this.response=BookResponse.fromJson(decodedJson);
      });
    }
        catch(e){
      print(e);
      setState((){
        this.response=null;
      });
        }
        finally{
      setState((){
        _isLoading=false;
      });
    }
  }
  void onSearchButton()=>_CallApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book App"),

      ),
      body:
        Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextField(
                    controller: textEditingController,
                )),
                ElevatedButton(onPressed: onSearchButton, child: Text("Search"))
              ],
            ),
            if(!_isLoading)
            Expanded(
                child:ListView.builder(
                itemCount: response?.items?.length ?? 0,

                itemBuilder: (builder,index)=>
                    ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>
                            BookDetail(bookFromList:(response?.items![index])!)));
                      },
                        title: Text(response?.items![index].volumeInfo?.title ?? ""),
                        subtitle: Text(response?.items?[index]?.volumeInfo?.authors?.first ??""),
                        leading:
                        Image.network(response?.items?[index].volumeInfo?.imageLinks?.thumbnail ??"")
                    )
            )
            ),
            if(_isLoading)
              Center(
                child: CircularProgressIndicator(),
              )
          ],
        )

    );
  }

}

class BookDetail extends StatefulWidget {
  final Book bookFromList;
  BookDetail({required this.bookFromList});

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  late Book book;
  bool isLoading=false;
  @override
  void initState(){
    super.initState();
    book=widget.bookFromList;
    _getBookDetail();

  }
  _getBookDetail()async{
   setState((){
     isLoading=true;
   });

   try{
     var uri=Uri.parse("https://www.googleapis.com/books/v1/volumes/${book.id}");
     var response=await http.get(uri);
     var jsonDecoded=jsonDecode(response.body);
     setState((){
       book=Book.fromJson(jsonDecoded);
     });

   }catch(e){
     print(e);
     setState((){
       book=widget.bookFromList;
     });
   }

   setState((){
     isLoading=false;
   });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book Details"),),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(book.volumeInfo?.title ?? ""),
          Image.network(book.volumeInfo?.imageLinks?.extraLarge ??
              book.volumeInfo?.imageLinks?.thumbnail ?? ""),
            if(isLoading)CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

