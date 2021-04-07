import 'package:flutter/material.dart';
import 'package:offline/database/dbconn.dart';
import 'package:offline/models/trans.dart';

class GetTotal extends StatefulWidget {
  @override
  _GetTotalState createState() => _GetTotalState();
}

class _GetTotalState extends State<GetTotal> {
  DbConn dbconn = DbConn();
  List<Trans> transList;
  int totalCount = 0;
  int totalIncome = 0;
  int totalExpense = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "View Details",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Note:- View total details of your sharing. ",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
                color: Colors.indigo),
          ),
          SizedBox(
            height: 90.0,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Card(
                  elevation: 8.0,
                  color: Colors.lightGreen,
                  margin:
                      EdgeInsets.only(left: 20.0, bottom: 60.0, right: 20.0),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 40.0,
                      bottom: 40.0,
                    ),
                    child: FutureBuilder(
                      future: loadIncomeTotal(),
                      builder: (context, snapshot) {
                        return Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              'Income\n\n  $totalIncome',
                              style: TextStyle(
                                fontSize: 21.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ));
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  elevation: 2.0,
                  color: Colors.lightGreen,
                  margin:
                      EdgeInsets.only(right: 20.0, left: 20.0, bottom: 60.0),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 40.0,
                      bottom: 40.0,
                    ),
                    child: FutureBuilder(
                      future: loadExpenseTotal(),
                      builder: (context, snapshot) {
                        return Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Expenses\n\n $totalExpense',
                            style: TextStyle(
                              fontSize: 21.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Card(
            elevation: 2.0,
            color: Colors.lightGreen,
            margin: EdgeInsets.only(left: 20.0, bottom: 20.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, bottom: 20.0, left: 40.0, right: 50.0),
              child: FutureBuilder(
                future: loadTotal(),
                builder: (context, snapshot) {
                  return Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Total\n\n  $totalCount',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 100.0,
          ),
          Text(
            "#kiranSinghKatuwal",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
              color: Colors.indigo,
            ),
          ),
        ],
      ),
    );
  }

  Future loadTotal() {
    final Future futureDB = dbconn.initDB();
    return futureDB.then((db) {
      Future<int> futureTotal = dbconn.countTotal();
      futureTotal.then((ft) {
        setState(() {
          this.totalCount = ft;
        });
      });
    });
  }

  Future loadIncomeTotal() {
    final Future futureDB = dbconn.initDB();
    return futureDB.then((db) {
      Future<int> futureTotal = dbconn.countIncomeTotal();
      futureTotal.then((ft) {
        setState(() {
          this.totalIncome = ft;
        });
      });
    });
  }

  Future loadExpenseTotal() {
    final Future futureDB = dbconn.initDB();
    return futureDB.then((db) {
      Future<int> futureTotal = dbconn.countExpenseTotal();
      futureTotal.then((ft) {
        setState(() {
          this.totalExpense = ft;
        });
      });
    });
  }
}
