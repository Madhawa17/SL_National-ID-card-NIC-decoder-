import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';
import 'package:google_fonts/google_fonts.dart' as gf;

/// This screen allows users to input their NIC number for decoding.
/// It provides a text field for input, a button to trigger decoding,
/// and displays any error messages or processing status (loading).
class InputScreen extends StatelessWidget {
  // Initialize NicController using GetX dependency injection
  final NicController controller = Get.put(NicController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NIC Decoder', style: gf.GoogleFonts.poppins()),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Text explaining the purpose of this screen
            Text(
              'Enter your NIC number below to decode.',
              style: gf.GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20),

            // NIC Number Input Field where user enters the NIC
            TextField(
              decoration: InputDecoration(
                labelText: 'NIC Number',
                hintText: 'e.g., 198534000937',
                prefixIcon: Icon(Icons.credit_card),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.blueGrey[50],
              ),
              onChanged: (value) => controller.nicNumber.value = value,
            ),
            SizedBox(height: 20),

            // Error Message Widget, displayed if there is any error in the NIC input
            Obx(() {
              return controller.errorMessage.isNotEmpty
                  ? Text(
                      controller.errorMessage.value,
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    )
                  : SizedBox.shrink();
            }),

            // Decode Button that triggers the decoding process when pressed
            SizedBox(height: 20),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed:
                    controller.decodeNic, // Triggers NIC decoding function
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors
                      .blueAccent, // Replaced `primary` with `backgroundColor`
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Decode NIC',
                  style: gf.GoogleFonts.poppins(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Display a loading indicator if the NIC is being processed
            Obx(() {
              return controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox.shrink();
            }),

            // Navigation Buttons for History and Settings Screens
            SizedBox(height: 20),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed('/history'); // Navigate to HistoryScreen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 95, 211, 99),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Go to History',
                  style: gf.GoogleFonts.poppins(fontSize: 18),
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
                  backgroundColor: const Color.fromARGB(255, 112, 201, 85),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Go to Settings',
                  style: gf.GoogleFonts.poppins(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
