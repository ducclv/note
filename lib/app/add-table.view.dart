import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

import '../utils/screen_config.dart';

class AddTable extends StatefulWidget {
  @override
  _AddTableState createState() => _AddTableState();
}

class _AddTableState extends State<AddTable> {
  List<Map<String, dynamic>> data = [
    {"name": "name 1", "data": 1},
    {"name": "name 2", "data": 2},
    {"name": "name 3", "data": 3},
    {"name": "name 4", "data": 4}
  ];
  HDTRefreshController _hdtRefreshController = HDTRefreshController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Add Table"))),
      body: _getBodyWidget(),
    );
  }

  Widget _getBodyWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: HorizontalDataTable(
              leftHandSideColumnWidth: 0,
              rightHandSideColumnWidth: SizeConfig.blockSizeHorizontal * 100,
              isFixedHeader: true,
              headerWidgets: _getTitleWidget(),
              leftSideItemBuilder: _generateFirstColumnRow,
              rightSideItemBuilder: _generateRightHandSideColumnRow,
              itemCount: data.length,
              rowSeparatorWidget: const Divider(color: Colors.black54, height: 1.0, thickness: 0.0),
              leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
              rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
              enablePullToRefresh: false,
              // refreshIndicator: const WaterDropHeader(),
              // refreshIndicatorHeight: 60,
              // onRefresh: () async {
              //   print('refresh');
              //   await Future.delayed(const Duration(milliseconds: 500));
              //   _hdtRefreshController.refreshCompleted();
              // },
              // htdRefreshController: _hdtRefreshController,
            ),
            height: data.isNotEmpty
                ? SizeConfig.blockSizeVertical * data.length * 5 + SizeConfig.blockSizeVertical * 5
                : 0,
          ),
          data.isNotEmpty ? Divider(color: Colors.black, height: 1) : SizedBox(),
        ],
      ),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      SizedBox(),
      _getTitleItemWidget('STT', SizeConfig.safeBlockHorizontal * 10),
      _getTitleItemWidget('Tên', SizeConfig.safeBlockHorizontal * 50),
      _getTitleItemWidget('Số lượng', SizeConfig.safeBlockHorizontal * 40),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: SizeConfig.blockSizeVertical * 5,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container();
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          child: Text("${index + 1}"),
          width: SizeConfig.safeBlockHorizontal * 10,
          height: SizeConfig.blockSizeVertical * 5,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
        Container(
          child: Text("${data[index]['name']}"),
          width: SizeConfig.safeBlockHorizontal * 50,
          height: SizeConfig.blockSizeVertical * 5,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  child: Icon(Icons.arrow_left),
                  onTap: () {
                    setState(() {
                      data[index]['data']--;
                    });
                  }),
              Container(child: Text("${data[index]['data']}")),
              GestureDetector(
                child: Icon(Icons.arrow_right),
                onTap: () {
                  setState(() {
                    data[index]['data']++;
                  });
                },
              ),
            ],
          ),
          width: SizeConfig.safeBlockHorizontal * 40,
          height: SizeConfig.blockSizeVertical * 5,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
      ],
    );
  }
}
