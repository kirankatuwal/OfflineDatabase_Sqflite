import 'package:flutter/material.dart';
import 'package:offline/database/dbconn.dart';
import 'package:offline/models/trans.dart';
import 'package:offline/screens/translist.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DbConn dbconn = DbConn();
  List<Trans> transList;
  int totalCount = 0;

  @override
  Widget build(BuildContext context) {
    if (transList == null) {
      transList = [];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "View List",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: new Container(
        child: new Center(
            child: new FutureBuilder(
          future: loadList(),
          builder: (context, snapshot) {
            return transList.length > 0
                ? new TransList(trans: transList)
                : new Center(
                    child: new Text('No data found !!',
                        style: Theme.of(context).textTheme.headline6));
          },
        )),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // _navigateToAddScreen(context);
      //     Navigator.push(
      //         context, MaterialPageRoute(builder: (context) => Second()));
      //   },
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
      // bottomNavigationBar: BottomAppBar(
      //   child: new FutureBuilder(
      //     future: loadTotal(),
      //     builder: (context, snapshot) {
      //       return Padding(
      //         padding: EdgeInsets.all(16.0),
      //         child: Text('Total: $totalCount',
      //             style: Theme.of(context).textTheme.headline6),
      //       );
      //     },
      //   ),
      //   color: Colors.cyanAccent,
      // ),
    );
  }

  Future loadList() {
    final Future futureDB = dbconn.initDB();
    return futureDB.then((db) {
      Future<List<Trans>> futureTrans = dbconn.trans();
      futureTrans.then((transList) {
        setState(() {
          this.transList = transList;
        });
      });
    });
  }
}
