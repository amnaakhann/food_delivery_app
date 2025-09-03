import 'package:flutter/material.dart';

class AddNewCardPage extends StatelessWidget {
  const AddNewCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cardHolderController = TextEditingController();
    final cardNumberController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFFFFC107), // yellow background
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: Colors.red),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Add New Card",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            // Main Card Body
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(2),
                child: Card(
                  color: Colors.white,
                  elevation: 4,
                  margin: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/cd.jpg",
                          height: 180,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 24),

                        // Card Holder Name
                        TextField(
                          controller: cardHolderController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.yellow.withOpacity(0.3),
                            hintText: "Card Holder Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Card Number
                        TextField(
                          controller: cardNumberController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.yellow.withOpacity(0.3),
                            hintText: "Card Number",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),

                        // Save Card Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              String holder = cardHolderController.text;
                              String number = cardNumberController.text;
                              print("Card Saved: $holder - $number");
                              Navigator.pop(context); // go back after save
                            },
                            child: const Text(
                              "Save Card",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
