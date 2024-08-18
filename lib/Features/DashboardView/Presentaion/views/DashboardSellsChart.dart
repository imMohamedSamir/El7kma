import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashboardSellsChart extends StatelessWidget {
  const DashboardSellsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('المبيعات', style: AppStyles.styleBold24(context)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 15),
              child: LineChart(getChartData()),
            ),
          ),
        ],
      ),
    );
  }

  LineChartData getChartData() {
    List<SalesData> salesData = [
      SalesData(day: 1, sales: 10),
      SalesData(day: 2, sales: 20),
      SalesData(day: 3, sales: 30),
      SalesData(day: 4, sales: 40),
      SalesData(day: 5, sales: 50),
    ];

    return LineChartData(
      lineBarsData: [
        LineChartBarData(
          spots: salesData
              .map((data) => FlSpot(data.day.toDouble(), data.sales))
              .toList(),
          color: Colors.blue,
          barWidth: 2,
        ),
      ],
    );
  }
}

class SalesData {
  final int day;
  final double sales;

  SalesData({required this.day, required this.sales});
}
