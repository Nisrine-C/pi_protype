import 'package:flutter/material.dart';
import 'package:pi_prototype/constants/colors.dart';
import 'package:pi_prototype/widget/progress_bar.widget.dart';

class GearItem extends StatelessWidget {
  const GearItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: bgGrey,
      margin: EdgeInsets.symmetric(vertical:10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const Text(
              'Gear #101',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            // Condition
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Condition',
                      style: TextStyle(
                        color: textGrey,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: tdGreen,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        'Code 0',
                        style: TextStyle(color: textGreen),
                      ),
                    ),
                  ],
                ),
                const Text('No fault'),
                const SizedBox(height: 5),
                // Remaining Life
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Remaining life',
                      style: TextStyle(color: textGrey,fontSize: 16,),
                    ),
                    Text('9000 hours',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 5),
                // Your ProgressBar widget
                ProgressBar(
                  width: MediaQuery.of(context).size.width,
                  height: 20,
                  progress: 0.1, // 90% for 9000/10000 hours example
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Recommended Action
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recommended Action',
                      style: TextStyle(color: tdBlue,fontSize: 16),
                    ),
                    Text('Schedule inspection within 72 hours',
                      style: TextStyle(color: tdPurple,fontSize: 14)),
                SizedBox( // Constrained button width
                  width: double.infinity, // Makes button full width
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Button color
                      foregroundColor: Colors.white, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Rounded corners
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16), // Button height
                    ),
                    onPressed: () {
                      // Add your button action here
                      print('Schedule maintenance button pressed');
                    },
                    child: const Text(
                      'Schedule Maintenance Now',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}

// Test screen
class GearTestScreen extends StatelessWidget {
  const GearTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gear Item Test'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          GearItem(),
          GearItem(), // Second item for testing
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: GearTestScreen(),
  ));
}