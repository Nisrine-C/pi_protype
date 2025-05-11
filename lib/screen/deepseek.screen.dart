import 'package:flutter/material.dart';

void main() {
  runApp(const GearStatusApp());
}

class GearStatusApp extends StatelessWidget {
  const GearStatusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gear Status',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const GearStatusScreen(),
    );
  }
}

class GearStatusScreen extends StatelessWidget {
  const GearStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gears'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Legend
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StatusIndicator(label: 'OK', status: GearStatus.ok),
                  StatusIndicator(label: 'Warning', status: GearStatus.warning),
                  StatusIndicator(label: 'Failure', status: GearStatus.failure),
                ],
              ),
            ),

            const Divider(thickness: 2),

            // Gear Cards
            GearCard(
              gearId: 101,
              condition: 'No fault',
              remainingLife: '9000 hours',
              recommendedAction: 'Schedule inspection within 72 hours',
              status: GearStatus.ok,
            ),

            const SizedBox(height: 16),

            GearCard(
              gearId: 102,
              condition: 'Missing tooth',
              remainingLife: '800 hours',
              recommendedAction: 'Replacement within 48 hours',
              status: GearStatus.warning,
            ),
          ],
        ),
      ),
    );
  }
}

enum GearStatus { ok, warning, failure }

class StatusIndicator extends StatelessWidget {
  final String label;
  final GearStatus status;

  const StatusIndicator({
    super.key,
    required this.label,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color indicatorColor;
    switch (status) {
      case GearStatus.ok:
        indicatorColor = Colors.green;
      case GearStatus.warning:
        indicatorColor = Colors.orange;
      case GearStatus.failure:
        indicatorColor = Colors.red;
    }

    return Column(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: indicatorColor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}

class GearCard extends StatelessWidget {
  final int gearId;
  final String condition;
  final String remainingLife;
  final String recommendedAction;
  final GearStatus status;

  const GearCard({
    super.key,
    required this.gearId,
    required this.condition,
    required this.remainingLife,
    required this.recommendedAction,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    switch (status) {
      case GearStatus.ok:
        statusColor = Colors.green;
      case GearStatus.warning:
        statusColor = Colors.orange;
      case GearStatus.failure:
        statusColor = Colors.red;
    }

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gear Header
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: statusColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Gear #$gearId',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Condition
            _buildInfoRow('Condition', condition),

            const SizedBox(height: 12),

            // Remaining Life
            _buildInfoRow('Remaining life', remainingLife),

            const SizedBox(height: 12),

            // Recommended Action
            _buildInfoRow('Recommended Action', recommendedAction),

            const SizedBox(height: 16),

            // Schedule Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle schedule maintenance
                },
                child: const Text('Schedule maintenance'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}