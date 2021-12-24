import 'package:flutter/material.dart';

class Editpage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {},
          )
        ],
      ),
      body: Padding{
        padding: const EdgeInsets.all(17),
        child: Column(
          children: const <Widget>[
            TextField(
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.w300),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              //obscureText: true,
              decoration: InputDecoration(
                //border: OutlineInputBorder(),
                hintText: '제목을 적어주세요',
              ),
            ),
            Padding(padding: EdgeInsets.all(13),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                //obscureText: true,
                decoration: InputDecoration(
                  //border: OutlineInputBorder(),
                  hintText: '내용을 적어주세요',
                ), // InputDecoration
              ), // TextField
            ], // <Widget>[]
          ), // Column
        )},


      Future<void> saveDB() async {

      DBHelper sd = DBHelper();

    var fido = Memo(
    id:0
    title: this.title,
    text: this.text,
    createTime: DateTime.now().toString()
    editTime: DateTime.now().toString()
    ); // Memo

    await sd.insertMemo(fido);

    print(await sd.memos());
    }

    String sha512(String date) {
    import 'dart:convert';
    import 'package:convert/convert.dart';
    import 'package:crypto/crypto.dart';
    }
    import 'package:flutter/material.dart';
    import 'package:memomemo/database/memo.dart';
    import 'package:memomemo/database/db.dart';

    class EditPage extends StatefulWidget {
    EditPage({Key key, this.id}) : super(key: key);
    final String id;


    @override
    _EditPageState createState() => _EditPageState();
    }

    class _EditPageState extends State<EditPage> {
    BuildContext _context;

    String title = '';
    String text = '';
    String createTime = '';

    @override
    Widget build(BuildContext context) {body: Padding(
    padding: EdgeInsets.all(20),
    child: Column(
    children: <Widget>[
    TextField(
    maxLines: 2,
    onChanged: (String title){ this.title = title;}, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
//obscureText: true,
    decoration: InputDecoration(
//border: 0utlineInputBorder(),
    hintText: '메모의 제목을 적어주세요. ' ,
    ), // InputDecoration
    ), // TextField
    Padding( padding: EdgeInsets.all(10)), TextField(
    maxLines: 8,
    onChanged: (String text){ this.text = text;},
//obscureText: true,
    decoration: InputDecoration(
//border: OutlineInputBorder(),
    hintText: '메모의 내용을 적어주세요. ' ,
    ), // InputDecoration
    ),; // TextField
