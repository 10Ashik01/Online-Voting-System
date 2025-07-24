import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../widgets/section_title.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      backgroundColor: const Color(0xFF121212),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle("Live Vote Insights"),
            Row(
              children: [
                _statCard("Total Users", "1200", Colors.blue),
                const SizedBox(width: 16),
                _statCard("Total Votes", "982", Colors.green),
              ],
            ),
            const SizedBox(height: 30),
            const SectionTitle("Candidate Performance"),
            Expanded(
              child: BarChart(
                BarChartData(
                  borderData: FlBorderData(show: false),
                  gridData: FlGridData(show: true, getDrawingHorizontalLine: (_) => FlLine(color: Colors.grey.shade800, strokeWidth: 0.5)),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true, getTitlesWidget: (value, _) => Text("${value.toInt()}", style: const TextStyle(color: Colors.white54))),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, _) {
                          switch (value.toInt()) {
                            case 0:
                              return const Text("Alice", style: TextStyle(color: Colors.white));
                            case 1:
                              return const Text("Bob", style: TextStyle(color: Colors.white));
                            case 2:
                              return const Text("Charlie", style: TextStyle(color: Colors.white));
                          }
                          return const Text('');
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 420, color: Colors.blueAccent)]),
                    BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 300, color: Colors.orange)]),
                    BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 260, color: Colors.redAccent)]),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/vote'),
                  icon: const Icon(Icons.how_to_vote),
                  label: const Text("Vote Now"),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/results'),
                  icon: const Icon(Icons.bar_chart),
                  label: const Text("View Results"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _statCard(String title, String value, Color color) {
    return Expanded(
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value, style: TextStyle(color: color, fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(title, style: const TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}
