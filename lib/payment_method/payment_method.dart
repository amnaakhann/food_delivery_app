import 'package:flutter/material.dart';
import 'package:food_delivery_app/payment_method/add_card.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  int selectedMethod = -1; // -1 means nothing selected yet

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFC107),
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
                    "Payment Method",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            // Main Card with Payment Options
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
                        paymentRow(
                          index: 0,
                          icon: Icons.credit_card,
                          title: "*** *** *** 43",
                        ),
                        const Divider(),
                        paymentRow(
                          index: 1,
                          icon: Icons.account_balance_wallet,
                          title: "Easypaisa",
                        ),
                        const Divider(),
                        paymentRow(
                          index: 2,
                          icon: Icons.account_balance,
                          title: "JazzCash",
                        ),
                        const SizedBox(height: 100),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red.withOpacity(0.1),
                              foregroundColor: Colors.red,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(color: Colors.red),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AddNewCardPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Add New Card",
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

  // Reusable widget for each payment method row
  Widget paymentRow({
    required int index,
    required IconData icon,
    required String title,
  }) {
    return Row(
      children: [
        // Column 1: Icon
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.red.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.red, size: 28),
        ),
        const SizedBox(width: 12),

        // Column 2: Text
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),

        // Column 3: Radio Button
        Radio<int>(
          value: index,
          groupValue: selectedMethod,
          activeColor: Colors.red,
          onChanged: (value) {
            setState(() {
              selectedMethod = value!;
            });
          },
        ),
      ],
    );
  }
}
