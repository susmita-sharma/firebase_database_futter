import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:csv/csv.dart';





class CsvLoadPage extends StatefulWidget {
  const CsvLoadPage({Key? key}) : super(key: key);

  @override
  _CsvLoadPageState createState() => _CsvLoadPageState();
}

class _CsvLoadPageState extends State<CsvLoadPage> {
  List<List<dynamic>> _data = [];

  // This function is triggered when the floating button is pressed
  void _loadCSV() async {
    final _rawData = await rootBundle.loadString("assets/test.csv");
    List<List<dynamic>> _listData =
    const CsvToListConverter().convert(_rawData,eol: "\n");
    setState(() {
      _data = _listData;
    //  print('******printing list 2,1');
    //  print(_listData[0][7]);


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nepal Telecom"),
      ),
      // Display the contents from the CSV file
      body: ListView.builder(
        itemCount: _data.length,


        itemBuilder: (_, index) {
         // print(index);

          return Scrollbar(
            scrollbarOrientation: ScrollbarOrientation.top,
            child: Card(
              margin: const EdgeInsets.all(10),
              color: index == 0 ? Colors.red : Colors.green,
              child: ListTile(
                leading: Text(_data[index][0].toString()),
                title: Text(_data[index][1]),
                trailing: Text(_data[index][2].toString()),
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add), onPressed: _loadCSV),
    );
  }
}