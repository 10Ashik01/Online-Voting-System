import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> results = [
      {"name": "Alice", "votes": 450, "color": Colors.blue},
      {"name": "Bob", "votes": 320, "color": Colors.orange},
      {"name": "Charlie", "votes": 280, "color": Colors.red},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Election Results")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: DataTable2(
            columnSpacing: 24,
            horizontalMargin: 20,
            minWidth: 400,
            columns: const [
              DataColumn2(label: Text("Candidate"), size: ColumnSize.L),
              DataColumn2(label: Text("Votes"), size: ColumnSize.S),
            ],
            rows: results.map((result) {
              return DataRow(cells: [
                DataCell(Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: result["color"],
                      child: Text(result["name"][0], style: const TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(width: 12),
                    Text(result["name"], style: const TextStyle(fontWeight: FontWeight.w600)),
                  ],
                )),
                DataCell(Text("${result["votes"]}")),
              ]);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
