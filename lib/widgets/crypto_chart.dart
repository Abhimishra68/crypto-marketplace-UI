// import 'package:flutter/material.dart';

// import '../theme/app_theme.dart';

// class CryptoChart extends StatefulWidget {
//   final double padding;

//   const CryptoChart({
//     Key? key,
//     required this.padding,
//   }) : super(key: key);

//   @override
//   State<CryptoChart> createState() => _CryptoChartState();
// }

// class _CryptoChartState extends State<CryptoChart> {
//   int? touchedIndex;
//   late List<FlSpot> lineSpots;
//   late List<BarChartGroupData> barGroups;

//   @override
//   void initState() {
//     super.initState();
//     // Starts above baseline -> sharp drop -> valley -> recovery -> spike -> pullback -> ends higher
//     lineSpots = [
//       FlSpot(0, 7),      // Start high
//       FlSpot(1, 3),      // Sharp drop to loss zone
//       FlSpot(2, 2.5),    // Valley
//       FlSpot(3, 4),      // Recovery begins
//       FlSpot(4, 5),      // Continuing recovery
//       FlSpot(5, 8.5),    // Strong upward spike
//       FlSpot(6, 7.5),    // Minor pullback
//     ];

//     // Bar chart data to complement the line chart
//     barGroups = [
//       BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 3, color: AppTheme.accentGreen)]),
//       BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 2, color: AppTheme.accentRed)]),
//       BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 2.5, color: AppTheme.accentRed)]),
//       BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 4, color: AppTheme.accentGreen)]),
//       BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 5, color: AppTheme.accentGreen)]),
//       BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 8, color: AppTheme.accentGreen)]),
//       BarChartGroupData(x: 6, barRods: [BarChartRodData(toY: 7, color: AppTheme.accentGreen)]),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isMobile = MediaQuery.of(context).size.width < 600;
//     final chartHeight = isMobile ? 320.0 : 380.0;

//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: widget.padding),
//       child: Container(
//         height: chartHeight,
//         decoration: BoxDecoration(
//           color: AppTheme.cardBackground,
//           borderRadius: BorderRadius.circular(20),
//           border: Border.all(
//             color: Colors.white.withOpacity(0.1),
//             width: 1,
//           ),
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(20),
//           child: BackdropFilter(
//             filter: ColorFilter.mode(
//               Colors.black.withOpacity(0.3),
//               BlendMode.darken,
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Chart Overview',
//                     style: Theme.of(context).textTheme.displayMedium?.copyWith(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                   ),
//                   SizedBox(height: 16),
//                   Expanded(
//                     child: _buildCompositeChart(),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCompositeChart() {
//     return LineChart(
//       LineChartData(
//         gridData: FlGridData(
//           show: true,
//           drawVerticalLine: true,
//           getDrawingHorizontalLine: (value) {
//             return FlLine(
//               color: AppTheme.gridLineColor,
//               strokeWidth: 0.5,
//             );
//           },
//           getDrawingVerticalLine: (value) {
//             return FlLine(
//               color: AppTheme.gridLineColor,
//               strokeWidth: 0.5,
//             );
//           },
//         ),
//         titlesData: FlTitlesData(
//           rightTitles: AxisTitles(
//             sideTitles: SideTitles(
//               showTitles: true,
//               getTitlesWidget: (value, meta) {
//                 if (value % 2 == 0) {
//                   return Text(
//                     '\$${value.toInt()}00',
//                     style: TextStyle(
//                       color: AppTheme.textSecondary,
//                       fontSize: 12,
//                     ),
//                   );
//                 }
//                 return const SizedBox();
//               },
//               interval: 2,
//               reservedSize: 50,
//             ),
//           ),
//           topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//           leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//           bottomTitles: AxisTitles(
//             sideTitles: SideTitles(
//               showTitles: true,
//               getTitlesWidget: (value, meta) {
//                 const labels = ['03', '06', '09', '12', '15', '18', '21'];
//                 if (value.toInt() < labels.length) {
//                   return Text(
//                     labels[value.toInt()],
//                     style: TextStyle(
//                       color: AppTheme.textSecondary,
//                       fontSize: 12,
//                     ),
//                   );
//                 }
//                 return const SizedBox();
//               },
//               interval: 1,
//               reservedSize: 30,
//             ),
//           ),
//         ),
//         borderData: FlBorderData(show: false),
//         lineBarsData: [
//           LineChartBarData(
//             spots: lineSpots,
//             isCurved: true,
//             curveSmoothness: 0.35,
//             color: AppTheme.accentTeal,
//             barWidth: 3,
//             isStrokeCapRound: true,
//             dotData: FlDotData(
//               show: true,
//               getDotPainter: (spot, percent, barData, index) {
//                 final isActive = touchedIndex == index;
//                 return FlDotCirclePainter(
//                   radius: isActive ? 8 : 5,
//                   color: AppTheme.textPrimary,
//                   strokeWidth: 2,
//                   strokeColor: isActive ? AppTheme.accentTeal : Colors.transparent,
//                 );
//               },
//             ),
//             belowBarData: BarAreaData(
//               show: true,
//               gradient: LinearGradient(
//                 colors: [
//                   AppTheme.accentTeal.withOpacity(0.4),
//                   AppTheme.accentTeal.withOpacity(0.1),
//                   AppTheme.accentTeal.withOpacity(0.0),
//                 ],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//             ),
//           ),
//         ],
//         lineTouchData: LineTouchData(
//           enabled: true,
//           handleBuiltInTouches: true,
//           touchCallback: (FlTouchEvent event, LineTouchResponse? response) {
//             if (event is FlTapUpEvent) {
//               setState(() {
//                 if (response != null && response.lineBarSpots != null && response.lineBarSpots!.isNotEmpty) {
//                   touchedIndex = response.lineBarSpots![0].spotIndex;
//                 } else {
//                   touchedIndex = null;
//                 }
//               });
//             } else if (event is FlPointerExitEvent) {
//               setState(() => touchedIndex = null);
//             }
//           },
//           getTouchLineStart: (data, index) => 0,
//           getTouchLineEnd: (data, index) => 50,
//           touchTooltipData: LineTouchTooltipData(
//             tooltipBgColor: AppTheme.primaryBackground.withOpacity(0.9),
//             tooltipBorder: Border.all(
//               color: AppTheme.accentTeal.withOpacity(0.5),
//               width: 1,
//             ),
//             tooltipRoundedRadius: 12,
//             fitInsideHorizontally: true,
//             fitInsideVertically: true,
//             getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
//               return touchedBarSpots.map((barSpot) {
//                 return LineTooltipItem(
//                   '\$${(barSpot.y * 100).toStringAsFixed(0)}\n${const ['03', '06', '09', '12', '15', '18', '21'][barSpot.x.toInt()]}:00',
//                   TextStyle(
//                     color: AppTheme.accentTeal,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 12,
//                   ),
//                 );
//               }).toList();
//             },
//           ),
//         ),
//         minX: 0,
//         maxX: 6,
//         minY: 0,
//         maxY: 9,
//       ),
//     );
//   }
// }
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../theme/app_theme.dart';

class CryptoChart extends StatefulWidget {
  final double padding;

  const CryptoChart({super.key, required this.padding});

  @override
  State<CryptoChart> createState() => _CryptoChartState();
}

class _CryptoChartState extends State<CryptoChart> {
  int? touchedIndex;

  final List<FlSpot> spots = const [
    FlSpot(0, 7),
    FlSpot(1, 3),
    FlSpot(2, 2.5),
    FlSpot(3, 4),
    FlSpot(4, 5),
    FlSpot(5, 8.5),
    FlSpot(6, 7.5),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.padding),
      child: Container(
        height: 360,
        decoration: BoxDecoration(
          color: AppTheme.cardBackground.withOpacity(0.6),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white.withOpacity(0.08)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Stack(
                children: [
                  _buildBars(),
                  _buildLine(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// ================= LINE CHART =================
  Widget _buildLine() {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 6,
        minY: 0,
        maxY: 9,
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (v) => FlLine(
            color: Colors.white.withOpacity(0.06),
            strokeWidth: 1,
            dashArray: [4, 6],
          ),
        ),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          _gainLine(),
          _lossLine(),
        ],
        lineTouchData: _touchData(),
      ),
    );
  }

  LineChartBarData _gainLine() {
    return LineChartBarData(
      spots: spots.where((s) => s.y >= 4).toList(),
      isCurved: true,
      color: AppTheme.gainGreen,
      barWidth: 3,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          colors: [
            AppTheme.gainGreen.withOpacity(0.35),
            Colors.transparent,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  LineChartBarData _lossLine() {
    return LineChartBarData(
      spots: spots.where((s) => s.y < 4).toList(),
      isCurved: true,
      color: AppTheme.lossRed,
      barWidth: 3,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          colors: [
            AppTheme.lossRed.withOpacity(0.35),
            Colors.transparent,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  /// ================= BAR CHART =================
  Widget _buildBars() {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceBetween,
        barGroups: List.generate(
          spots.length,
          (i) => BarChartGroupData(
            x: i,
            barRods: [
              BarChartRodData(
                toY: spots[i].y,
                width: 8,
                color: spots[i].y >= 4
                    ? AppTheme.gainTeal
                    : AppTheme.lossRed,
                borderRadius: BorderRadius.circular(4),
              ),
            ],
          ),
        ),
        titlesData: FlTitlesData(show: false),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
      ),
    );
  }

  /// ================= TOUCH =================
  LineTouchData _touchData() {
    return LineTouchData(
      handleBuiltInTouches: true,
      touchTooltipData: LineTouchTooltipData(
        tooltipBgColor: AppTheme.darkBackground,
        tooltipRoundedRadius: 12,
        getTooltipItems: (items) => items.map(
          (e) => LineTooltipItem(
            '\$${(e.y * 100).toInt()}',
            const TextStyle(color: Colors.white),
          ),
        ).toList(),
      ),
    );
  }
}
