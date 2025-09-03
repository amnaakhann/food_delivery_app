import 'package:flutter/material.dart';
import 'package:food_delivery_app/address/add_address.dart';
import 'package:food_delivery_app/screen/homescreen.dart';
import 'package:food_delivery_app/screen/confirmorder.dart';
import 'package:food_delivery_app/screen/myorderlist.dart';

class SelectAddress extends StatefulWidget {
  const SelectAddress({super.key});

  @override
  State<SelectAddress> createState() => _SelectAddressState();
}

class _SelectAddressState extends State<SelectAddress> {
  int? _selectedIndex; // track selected address index

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
                    "Select Address",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            // Main Card with address rows
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
                        addressRow(
                          index: 0,
                          icon: Icons.home,
                          title: "My Home",
                          subtitle: "778 Locust View Drive, Oakland, CA",
                        ),
                        const Divider(),
                        addressRow(
                          index: 1,
                          icon: Icons.work,
                          title: "Work",
                          subtitle: "451 Pine Street, San Francisco, CA",
                        ),
                        const Divider(),
                        addressRow(
                          index: 2,
                          icon: Icons.location_on,
                          title: "Other",
                          subtitle: "123 Maple Avenue, Los Angeles, CA",
                        ),
                        const Divider(),
                        const SizedBox(height: 100),

                        // Add New Address Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                247,
                                209,
                                153,
                              ),
                              foregroundColor: const Color.fromARGB(
                                255,
                                247,
                                164,
                                39,
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const AddNewAddressPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Add New Address",
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

            // Bottom Navigation Bar
            const BottomStatusBar(),
          ],
        ),
      ),
    );
  }

  // Reusable Widget for Each Address Row
  Widget addressRow({
    required int index,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    bool isSelected = _selectedIndex == index;

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

        // Column 2: Texts
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 13, color: Colors.black54),
              ),
            ],
          ),
        ),

        // Column 3: Radio Button (select/deselect)
        IconButton(
          onPressed: () {
            setState(() {
              _selectedIndex = index; // update selected
            });
          },
          icon: Icon(
            isSelected
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked,
            color: Colors.red,
            size: 28,
          ),
        ),
      ],
    );
  }
}

class BottomStatusBar extends StatelessWidget {
  const BottomStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          navButton(Icons.home, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }),
          navButton(Icons.shopping_cart, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ConfirmOrderPage()),
            );
          }),
          navButton(Icons.receipt_long, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyOrdersPage()),
            );
          }),
          navButton(Icons.contact_mail, () {}),
        ],
      ),
    );
  }

  static Widget navButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(icon, color: Colors.white, size: 28),
      ),
    );
  }
}
