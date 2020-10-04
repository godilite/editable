import 'package:editable/editable.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Editable example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        accentColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Editable example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List cols = [
    {"title": 'Name', 'index': 1, 'key': 'name'},
    {"title": 'Date', 'index': 2, 'key': 'date'},
    {"title": 'Month', 'index': 3, 'key': 'month'},
    {"title": 'Status', 'index': 4, 'key': 'status'},
  ];

  List rows = [
    {
      "name": 'James',
      "date": '23/09/2020',
      "month": 'June',
      "status": 'completed'
    },
    {
      "name": 'Daniel',
      "date": '12/4/2020',
      "month": 'March',
      "status": 'new',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Editable(
        columns: cols,
        rows: rows,
        borderColor: Colors.blueGrey,
        showSaveIcon: true,
        saveIconColor: Colors.black,
        showCreateButton: true,
        createButtonLabel: Text(
          'New',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
