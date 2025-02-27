import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/theme_controller.dart';

/// A screen that allows the user to change app settings, specifically the theme.
/// It provides a toggle switch for enabling or disabling dark mode.
class SettingsScreen extends StatelessWidget {
  // Instance of ThemeController to manage theme changes
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // A list tile for the Dark Mode switch
            ListTile(
              title: Text('Dark Mode'),
              trailing: Obx(
                // Observes the themeController's isDarkMode value and updates the switch state
                () => Switch(
                  value: themeController.isDarkMode.value,
                  // Toggles the theme when the switch is changed
                  onChanged: (value) => themeController.toggleTheme(),
                ),
              ),
            ),
            // Back Button
            SizedBox(height: 20),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Get.back(); // Navigate back to the previous screen (input screen)
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
          ],
        ),
      ),
    );
  }
}
