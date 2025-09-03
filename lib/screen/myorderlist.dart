import 'package:flutter/material.dart';
import 'package:food_delivery_app/screen/11.dart';
import 'package:food_delivery_app/screen/confirmorder.dart';
import 'package:food_delivery_app/screen/homescreen.dart';
import 'package:food_delivery_app/screen/placeorder.dart';
import 'package:food_delivery_app/screen/review.dart';
import 'package:food_delivery_app/screen/trackingorder.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  String selectedTab = "Active";

  // Example Orders
  List<Map<String, String>> activeOrders = [
    {
      "image": "assets/images/p1.jpg",
      "title": "Large Pizza",
      "time": "29 Nov, 01:20 PM",
      "price": "\$20.00",
      "items": "2 Items",
    },
    {
      "image": "assets/images/b1.jpg",
      "title": "Cheese Burger",
      "time": "29 Nov, 02:10 PM",
      "price": "\$15.00",
      "items": "1 Item",
    },
    {
      "image": "assets/images/sa1.jpg",
      "title": "Sandwitch",
      "time": "29 Nov, 02:10 PM",
      "price": "\$20.00",
      "items": "1 Item",
    },
  ];

  List<Map<String, String>> completedOrders = [
    {
      "image": "assets/images/co1.jpg",
      "title": "Cold Drink",
      "time": "28 Nov, 02:30 PM",
      "price": "\$5.00",
      "items": "3 Items",
    },
  ];

  List<Map<String, String>> cancelledOrders = [];

  @override
  Widget build(BuildContext context) {
    const Color mustardColor = Color(0xFFFFC107);

    return Scaffold(
      backgroundColor: mustardColor,
      body: SafeArea(
        child: Column(
          children: [
            // 🔍 Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "My Orders",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            // 🔘 Tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildTabButton("Active"),
                  buildTabButton("Completed"),
                  buildTabButton("Cancelled"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 📦 Orders
            Expanded(
              child: SingleChildScrollView(
                child: Card(
                  color: Colors.white,
                  elevation: 4,
                  margin: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Builder(
                      builder: (context) {
                        List<Map<String, String>> orders = getOrdersForTab(
                          selectedTab,
                        );

                        if (orders.isEmpty) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.insert_drive_file_outlined,
                                size: 80,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 16),
                              Text(
                                "No orders here!",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          );
                        }

                        return Column(
                          children: orders.map((order) {
                            return buildOrderRow(
                              order["image"]!,
                              order["title"]!,
                              order["time"]!,
                              order["price"]!,
                              order["items"]!,
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),

            // Bottom Bar
            const BottomStatusBar(),
          ],
        ),
      ),
    );
  }

  /// 🔘 Flexible Tab Button
  Widget buildTabButton(String tabName) {
    final bool isSelected = selectedTab == tabName;

    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              selectedTab = tabName;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected ? Colors.red : Colors.red.shade50,
            foregroundColor: isSelected ? Colors.white : Colors.red,
            side: const BorderSide(color: Colors.red),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              tabName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  /// 📋 Orders Tab Getter
  List<Map<String, String>> getOrdersForTab(String tab) {
    if (tab == "Active") return activeOrders;
    if (tab == "Completed") return completedOrders;
    if (tab == "Cancelled") return cancelledOrders;
    return [];
  }

  /// 🛒 Order Row with Flexible Assets + Buttons
  Widget buildOrderRow(
    String image,
    String title,
    String time,
    String price,
    String items,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ Flexible Asset Loader
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(image, width: 60, height: 60, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  time,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 8),

                // ✅ Buttons with Flexible Text
                if (selectedTab == "Active")
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              cancelledOrders.add({
                                "image": image,
                                "title": title,
                                "time": time,
                                "price": price,
                                "items": items,
                              });
                              activeOrders.removeWhere(
                                (order) => order["title"] == title,
                              );
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red,
                            side: const BorderSide(color: Colors.red),
                          ),
                          child: const FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text("Cancel Order"),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const DeliveryStatusPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                          child: const FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text("Track Driver"),
                          ),
                        ),
                      ),
                    ],
                  ),

                if (selectedTab == "Completed")
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LeaveReviewPage(),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red,
                            side: const BorderSide(color: Colors.red),
                          ),
                          child: const FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text("Leave a Review"),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ConfirmOrderPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                          child: const FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text("Order Again"),
                          ),
                        ),
                      ),
                    ],
                  ),

                if (selectedTab == "Cancelled")
                  OutlinedButton(
                    onPressed: null,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      side: const BorderSide(color: Colors.red),
                    ),
                    child: const FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text("Order Cancelled"),
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Price
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                items,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 🔻 Bottom Navigation Bar
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
