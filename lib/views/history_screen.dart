import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Ensure Get is imported for navigation
import '../database/storage_service.dart';

/// A screen that displays the history of previously decoded NIC details.
/// It fetches and displays the stored NIC data, including the NIC number, birth date,
/// gender, and age of the individual.
class HistoryScreen extends StatelessWidget {
  // Constructor for the HistoryScreen
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch all the stored NIC data from the StorageService
    var history = StorageService.getAllNicData();

    return Scaffold(
      appBar: AppBar(title: Text('NIC History')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              // List of stored NIC data items
              itemCount: history.length,
              itemBuilder: (context, index) {
                var data = history[index];
                return ListTile(
                  // Display the NIC number as the title
                  title:
                      Text('NIC: ${data['nicNumber']}'), // Display NIC Number
                  // Display the birth date, gender, and age as the subtitle
                  subtitle: Text(
                      'Birth Date: ${data['birthDate']} - ${data['gender']} - ${data['age']} years old'),
                );
              },
            ),
          ),
          // Back Button and Go to Settings button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back(); // Navigate back to the previous screen (Input screen)
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Back to Input',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/settings'); // Navigate to SettingsScreen
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Go to Settings',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
