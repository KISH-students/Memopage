import 'package:daily_diary/database/db.dart';
import 'package:daily_diary/database/memo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'edit.dart';
import 'package:daily_diary/screens/View.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String deleteId = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
            child: Container(
              child: Text('daily_diary',
                  style: TextStyle(
                      fontSize: 35, color: Colors.deepOrangeAccent)), //Text
              alignment: Alignment.centerLeft,
            ), //Container
          ), //padding
          Expanded(child: memobuilder(context))
        ], //<widjet>[]
      ), //Column
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => Editpage()));
          },
          tooltip: '일기를 추가하려면 클릭하세요',
          label: Text('일기 추가')
          icon: const Icon(Icons.add),
    ), // This trailing comma makes auto-formatting nicer for build methods.
    ); //scaffold
  }

  List<widget> LoadMemo() {
    List<widget> memoList = [];
    memoList.add(Container(
      color: Colors.purpleAccent,
      height: 100,
    ));
    memoList.add(Container(
      color: Colors.redAccent,
      height: 100,
    ));

    return memoList;
  }

  Future <List<Memo>> loadMemo() async {
    DBHelper sd = DBHelper();
    return await sd.memos();
  }

  Future<void> deleteMemo(String id) async {
    DBHelper sd = DBHelper();
     await sd.deleteMemo(id);
  }

  void showAlertDialog(BuildContext context) async {
    String result = await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('삭제 경고'),
          content: Text("정말 삭제하시겠습니까?\n삭제된 메모는 복구되지 않습니다."),
          actions: <Widget>[
            FlatButton(
              child: Text('삭제'),
              onPressed: () {
                Navigator.pop(context, "삭제");
                setState(() {
                  deleteMemo(deleteId);
                });
                deleteId = '';
              },
            ), //FlatButton
            FlatButton(
              child: Text('취소'),
              onPressed: () {
                deleteId = '';
                Navigator.pop(context, "취소");
              },
            ), //FlatButton
          ], // <widget>{}
        ); // AlterDialog
      },
    );
  }

  Widget memobuilder(BuildContext parentContext) {
    return FutureBuilder(
      builder: (context, Snap) {
        if (Snap.data!.isEmpty) {
          return Container(
            alignment: Alignment.center,
            child: Text(
                '일기를 추가해보세요!',style: TextStyle(fontSize: 20, color: Colors.brown),
              textAlign: TextAlign.center,
            ), //Text
          ); //Container
      }
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(20),
          itemCount: Snap.data.length,
          itemBuilder: (context, index) {
            Memo memo = Snap.data[index];
            return InkWell(
                onTap: (){
                  Navigator.push(
                    parentContext, CupertinoPageRoute()
                  )
                },
                onLongPress: () {
                  deleteId = memo.id;
                  showAlertDialog(parentContext);
                });
              },

            children: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(15),
            alignment: Alignment.center,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      memo.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ), // TextStyle
                      overflow: TextOverflow.ellipsis,
                    ), // Text
                    Text(
                      memo.text,
                      style: TextStyle(fonSize: 15),
                      overflow: TextOverflow.ellipsis,
                    ), // Text
                  ], // <Widget>[]
                    ), // Column
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "최종 수정 시간: " + memo.editTime.split( ' . ' )[0],
                          style: TextStyle(fontSize: 11),
                          textAlign: TextAlign.end,
                        ), // Text
                      ], // <Widget>[]
                        ),
                     ],
                   ),
                  decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.deepOrange,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                )),
              ],
              );
          },
        );
      },
      future: loadMemo(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('projectList'),
      ),
      body: projectWidget,
      );
  }
  }




