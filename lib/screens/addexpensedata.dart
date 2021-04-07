import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:offline/database/dbconn.dart';
import 'package:offline/models/trans.dart';

enum TransType { expense }

class AddExpenseData extends StatefulWidget {
  AddExpenseData();
  @override
  _AddExpenseDataState createState() => _AddExpenseDataState();
}

class _AddExpenseDataState extends State<AddExpenseData> {
  _AddExpenseDataState();

  DbConn dbconn = DbConn();
  final _addFormKey = GlobalKey<FormState>();
  final format = DateFormat("dd-MM-yyyy");
  final _transDateController = TextEditingController();
  final _transNameController = TextEditingController();
  final _transPersonNameController = TextEditingController();
  String transType = 'expense';

  final _amountController = TextEditingController();
  TransType _transType = TransType.expense;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Data'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Card(
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: 440,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Transaction Date'),
                              DateTimeField(
                                format: format,
                                controller: _transDateController,
                                onShowPicker: (context, currentValue) {
                                  return showDatePicker(
                                      context: context,
                                      firstDate: DateTime(1900),
                                      initialDate:
                                          currentValue ?? DateTime.now(),
                                      lastDate: DateTime(2100));
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Transaction Name'),
                              TextFormField(
                                controller: _transNameController,
                                decoration: const InputDecoration(
                                  hintText: 'Transaction Name',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter transaction name';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Whose Money'),
                              TextFormField(
                                controller: _transPersonNameController,
                                decoration: const InputDecoration(
                                  hintText: 'Whose Money ',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter person name';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Transaction Type'),
                              ListTile(
                                title: const Text('Expense'),
                                leading: Radio(
                                  value: TransType.expense,
                                  groupValue: _transType,
                                  onChanged: (TransType value) {
                                    setState(() {
                                      _transType = value;
                                      transType = 'expense';
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Amount'),
                              TextFormField(
                                controller: _amountController,
                                decoration: const InputDecoration(
                                  hintText: 'Amount',
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter amount';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              RaisedButton(
                                splashColor: Colors.red,
                                onPressed: () {
                                  if (_addFormKey.currentState.validate()) {
                                    _addFormKey.currentState.save();
                                    final initDB = dbconn.initDB();
                                    initDB.then((db) async {
                                      await dbconn.insertTrans(Trans(
                                          transDate: _transDateController.text,
                                          transName: _transNameController.text,
                                          transPersonName:
                                              _transPersonNameController.text,
                                          transType: transType,
                                          amount: int.parse(
                                              _amountController.text)));
                                    });
                                    Fluttertoast.showToast(
                                        msg: "Successfully data saved !!",
                                        toastLength: Toast.LENGTH_SHORT,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text('Save',
                                    style: TextStyle(color: Colors.white)),
                                color: Colors.blue,
                              )
                            ],
                          ),
                        ),
                      ],
                    ))),
          ),
        ),
      ),
    );
  }

//   ListTile _radioStatus(int status) {
//     if (status == 1) {
//       return ListTile(
//         title: const Text('Earning'),
//         leading: Radio(
//           value: TransType.earning,
//           groupValue: _transType,
//           onChanged: (TransType value) {
//             setState(() {
//               _transType = value;
//               transType = 'earning';
//             });
//           },
//         ),
//       );
//     } else {
//       return ListTile(
//         title: const Text('Expense'),
//         leading: Radio(
//           value: TransType.expense,
//           groupValue: _transType1,
//           onChanged: (TransType value) {
//             setState(() {
//               _transType1 = value;
//               transType = 'expense';
//             });
//           },
//         ),
//       );
//     }
//   }
// }
}
