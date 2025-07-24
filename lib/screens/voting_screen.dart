import 'package:flutter/material.dart';

class VotingScreen extends StatelessWidget {
  const VotingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> candidates = [
      {"name": "Alice", "party": "Party A", "color": Colors.blue},
      {"name": "Bob", "party": "Party B", "color": Colors.orange},
      {"name": "Charlie", "party": "Party C", "color": Colors.red},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Cast Your Vote")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: candidates.length,
          separatorBuilder: (_, __) => const SizedBox(height: 20),
          itemBuilder: (context, index) {
            final candidate = candidates[index];
            return AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              decoration: BoxDecoration(
                color: candidate["color"].withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: candidate["color"],
                    child: Text(candidate["name"][0],
                        style: const TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(candidate["name"],
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(candidate["party"],
                            style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text('You voted for ${candidate["name"]}!'),
                        backgroundColor: candidate["color"],
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: candidate["color"],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("Vote"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
