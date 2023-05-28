import 'package:flutter/material.dart';
import 'package:ilgohanjul/const/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class ChartScreen extends StatefulWidget {
  @override
  _ChartScreenState createState() => _ChartScreenState();
  }

class _ChartScreenState extends State<ChartScreen>{
  List<_ReadPageData> Monthlydata = [
    _ReadPageData('Jan', 350),
    _ReadPageData('Feb', 280),
    _ReadPageData('Mar', 341),
    _ReadPageData('Apr', 323),
    _ReadPageData('May', 404),
    _ReadPageData('Jun', 232),
    _ReadPageData('Jul', 281),
    _ReadPageData('Aug', 0),
    _ReadPageData('Sep', 0),
    _ReadPageData('Oct', 0),
    _ReadPageData('Nov', 0),
    _ReadPageData('Dec', 0)
  ];

  _ReadPageData maxMonth = _ReadPageData('', 0);
  _ReadPageData minMonth = _ReadPageData('', 0);
   
  FindMonthMax(){
    return maxMonth = Monthlydata.reduce((current, next) => current.pages > next.pages ? current: next);
  }
  FindMonthMin(){
    return minMonth = Monthlydata.reduce((current, next) => current.pages < next.pages ? current: next);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title: const Text('2023년, 당신의 기록들', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,),),
          backgroundColor: PRIMARY_COLOR,

        ),
      body: Column(children: [
          SizedBox(height: 20,),
          SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(minimum: FindMonthMin().pages, maximum: FindMonthMax().pages + 100),
              // Chart title
              // Enable legend
              legend: Legend(isVisible: false),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<_ReadPageData, String>>[
                AreaSeries<_ReadPageData, String>(
                    dataSource: Monthlydata,
                    xValueMapper: (_ReadPageData reads, _) => reads.month,
                    yValueMapper: (_ReadPageData reads, _) => reads.pages,
                    name: '독서량',
                    // Enable data label
                    dataLabelSettings: DataLabelSettings(isVisible: false),
                    color: Color.fromRGBO(0, 0, 0, 0.3))
              ]),
              SizedBox(height: 20,),
        ]));
  }
}
class _ReadPageData {
  _ReadPageData(this.month, this.pages);

  final String month;
  final double pages;
}