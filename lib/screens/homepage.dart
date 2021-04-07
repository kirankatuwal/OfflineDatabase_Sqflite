import 'package:flutter/material.dart';
import 'package:offline/screens/about_us.dart';
import 'package:offline/screens/adddatawidget.dart';
import 'package:offline/screens/addexpensedata.dart';
import 'package:offline/screens/getList.dart';
import 'package:offline/screens/total.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Note:- Please Tab on the box !!",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
                color: Colors.indigo),
          ),
          SizedBox(
            height: 90.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  print("Touched !!");
                  // _navigateToAddScreen(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddDataWidget()),
                  );
                },
                child: Card(
                  color: Colors.lightGreen,
                  elevation: 8.0,
                  margin: EdgeInsets.only(left: 20.0, bottom: 20.0),
                  child: Padding(
                      padding: const EdgeInsets.only(
                          top: 40.0, bottom: 40.0, left: 30.0, right: 20.0),
                      child: Text(
                        "Income",
                        style: TextStyle(fontSize: 24.0, color: Colors.white),
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("Second Touched !!");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddExpenseData()));
                },
                child: Card(
                  color: Colors.deepPurpleAccent,
                  elevation: 8.0,
                  margin: EdgeInsets.only(right: 20.0, bottom: 20.0),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 40.0, bottom: 40.0, left: 20.0, right: 20.0),
                    child: Text(
                      "Expenses",
                      style: TextStyle(fontSize: 24.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              print("Third Touched !!");
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) =>
              //             MyHomePage(title: 'Transactions Home Page')));
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => GetTotal()));
            },
            child: Card(
              color: Colors.blueGrey,
              elevation: 8.0,
              margin: EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Text(
                  "Get Total",
                  style: TextStyle(fontSize: 24.0, color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              print("fourth Touched !!");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MyHomePage(title: 'Transactions Home Page')));
            },
            child: Card(
              color: Colors.blueGrey,
              elevation: 8.0,
              margin: EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Text(
                  "View List",
                  style: TextStyle(fontSize: 24.0, color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60.0,
          ),
          Text(
            "#kiranSinghKatuwal",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ],
      ),
      appBar: appBarWidget(),
      drawer: drawerWidget(context),
    );
  }

  AppBar appBarWidget() {
    return AppBar(
      centerTitle: true,
      title: Text(
        "HOME PAGE",
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Drawer drawerWidget(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 45.0,
                  child: Image.asset("assets/logo.png"),
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Kiran Singh Katuwal',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Income',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  leading: Icon(
                    Icons.attach_money,
                    color: Colors.white,
                  ),
                  tileColor: Colors.grey,
                  hoverColor: Colors.blueGrey,
                  trailing: Icon(
                    Icons.done_all,
                    color: Colors.white,
                  ),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddDataWidget()));
                  },
                ),
                ListTile(
                  title: Text(
                    'Expense',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  leading: Icon(
                    Icons.money_off_sharp,
                    color: Colors.white,
                  ),
                  tileColor: Colors.blueGrey,
                  hoverColor: Colors.blueGrey,
                  trailing: Icon(
                    Icons.done_all,
                    color: Colors.white,
                  ),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddExpenseData()));
                  },
                ),
                ListTile(
                  title: Text(
                    'Get Total',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  leading: Icon(
                    Icons.traffic_outlined,
                    color: Colors.white,
                  ),
                  tileColor: Colors.lightBlueAccent,
                  hoverColor: Colors.blueGrey,
                  trailing: Icon(
                    Icons.done_all,
                    color: Colors.white,
                  ),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GetTotal()));
                  },
                ),
                ListTile(
                  title: Text(
                    'View List',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  leading: Icon(
                    Icons.view_agenda,
                    color: Colors.white,
                  ),
                  tileColor: Colors.lightBlue,
                  hoverColor: Colors.blueGrey,
                  trailing: Icon(
                    Icons.done_all,
                    color: Colors.white,
                  ),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                    print("pressed");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MyHomePage(title: "View List")));
                  },
                ),
                ListTile(
                  title: Text(
                    'About Us',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  leading: Icon(
                    Icons.contact_page,
                    color: Colors.white,
                  ),
                  tileColor: Colors.blue,
                  hoverColor: Colors.blueGrey,
                  trailing: Icon(
                    Icons.done_all,
                    color: Colors.white,
                  ),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutUs()));
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
