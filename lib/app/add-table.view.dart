import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class AddTable extends StatefulWidget {
  @override
  _AddTableState createState() => _AddTableState();
}

class _AddTableState extends State<AddTable> {
  List<Map<String, dynamic>> data = [
    {"name": "name 1", "data": "1"},
    {
      "name": "name 2",
      "data": "2",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Add Table"))),
      body: Container(child: _getBodyWidget()),
    );
  }

  Widget _getBodyWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: HorizontalDataTable(
                leftHandSideColumnWidth: 5,
                rightHandSideColumnWidth: 1000,
                isFixedHeader: true,
                headerWidgets: _getTitleWidget(),
                leftSideItemBuilder: _generateFirstColumnRow,
                rightSideItemBuilder: _generateRightHandSideColumnRow,
                itemCount: data.length,
                rowSeparatorWidget: const Divider(color: Colors.black, height: 0, thickness: 0.5),
                leftHandSideColBackgroundColor: Colors.white,
                rightHandSideColBackgroundColor: Colors.white),
          ),
        ],
      ),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      SizedBox(),
      _getTitleItemWidget('Trade-in Value', 100),
      _getTitleItemWidget('Incentive', 100),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12),
        textAlign: TextAlign.center,
      ),
      color: Colors.red,
      width: width,
      height: 5,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) => SizedBox();

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return FlatButton(
      onPressed: () {},
      child: Slidable(
        actionPane: SlidableStrechActionPane(),
        secondaryActions: <Widget>[
          IconSlideAction(
            color: Colors.redAccent,
            icon: Icons.delete,
            onTap: () {},
          ),
        ],
        child: Row(
          children: [
            Container(
              width: 50,
              height: 5,
              alignment: Alignment.centerLeft,
              child: Text("${data[index]['name']}"),
            ),
            Container(
              width: 45,
              height: 5,
              alignment: Alignment.center,
              child: Text("${data[index]['data']}"),
            ),
          ],
        ),
      ),
    );
  }
}
