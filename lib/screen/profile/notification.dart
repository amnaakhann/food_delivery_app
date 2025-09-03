import 'package:flutter/material.dart';
import 'package:food_delivery_app/screen/homescreen.dart';
import 'package:food_delivery_app/screen/confirmorder.dart';
import 'package:food_delivery_app/screen/myorderlist.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  // Toggle states
  bool generalNotification = true;
  bool sound = false;
  bool vibrate = true;

  bool appUpdates = true;
  bool billReminder = false;
  bool promotion = true;
  bool discountAvailable = true;
  bool paymentRequest = false;

  bool newServices = true;
  bool newTips = false;

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
                    "Notification Settings",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            // Card Body
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
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Common Section
                        const Text(
                          "Common",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        buildToggleRow(
                          "General Notification",
                          generalNotification,
                          (val) {
                            setState(() => generalNotification = val);
                          },
                        ),
                        buildToggleRow("Sound", sound, (val) {
                          setState(() => sound = val);
                        }),
                        buildToggleRow("Vibrate", vibrate, (val) {
                          setState(() => vibrate = val);
                        }),

                        const Divider(height: 30, thickness: 1),

                        // System & Services Update Section
                        const Text(
                          "System and Services Update",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        buildToggleRow("App Updates", appUpdates, (val) {
                          setState(() => appUpdates = val);
                        }),
                        buildToggleRow("Bill Reminder", billReminder, (val) {
                          setState(() => billReminder = val);
                        }),
                        buildToggleRow("Promotion", promotion, (val) {
                          setState(() => promotion = val);
                        }),
                        buildToggleRow(
                          "Discount Available",
                          discountAvailable,
                          (val) {
                            setState(() => discountAvailable = val);
                          },
                        ),
                        buildToggleRow("Payment Request", paymentRequest, (
                          val,
                        ) {
                          setState(() => paymentRequest = val);
                        }),

                        const Divider(height: 30, thickness: 1),

                        // Others Section
                        const Text(
                          "Others",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        buildToggleRow("New Services", newServices, (val) {
                          setState(() => newServices = val);
                        }),
                        buildToggleRow("New Tips Available", newTips, (val) {
                          setState(() => newTips = val);
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const BottomStatusBar(),
          ],
        ),
      ),
    );
  }

  Widget buildToggleRow(String text, bool value, Function(bool) onChanged) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(text, style: const TextStyle(fontSize: 15)),
      trailing: Switch(
        value: value,
        activeColor: Colors.red,
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Colors.grey,
        onChanged: onChanged,
      ),
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
