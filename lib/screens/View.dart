// ignore: file_names
import 'package:daily_diary/database/db.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:daily_diary/database/memo.dart';


class ViewPage extends StatelessWidget {
  const ViewPage({required Key key, required this.id}) : super(key: key);

  final String id;
  //findMemo(id)[0]

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
            icon: const Icon(Icons.edit),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: Loadbuilder()
    ));
  }

  future: loadMemo(id)
  builder: (BuildContext context, AsyncSnapshot<List<Memo>> snapshot)  {
  if (snapshot.data.isEmpty) {
  return Container(child: Text("데이터를 불러올 수 없습니다. "));
  } else {
  Memo memo = snapshot.data[0];
  return Column(
  crossAxisAlignment: CrossAxisAligrment.stretch,
  children: <Widget>[
  Container(height: 100,
  child: SingleChildScrollView(
  child: Text(memo.title,
  style: TextStyle(fontSize: 30, fontWeight: FontWeight,w500),
  ), // Text
  ), // SingleChildScrollView
  ), // Container
  Text(memo.title,
  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
  ), 11 Text
  Text(
  "메모 만든 시간: "+ memo.createTime.split(' . ')[0],
  style: TextStyle(fontSize: 11),
  textAlign: TextAlign.end,
  ), = Text
  Text(
  "메모 수정 시간: + memo.editTime.split(' . ')[0], style: TextStyle(fontSize: 11),
  textAlign: TextAlign.end,
  ), // Text
  Padding(padding: EdgeInsets.all(10)), Expanded(
  child: SingleChildScrollView (child: Text(memo.text),),
  ], // <Widget>[]
  ); // Column