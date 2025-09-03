import 'package:flutter/material.dart';
import 'package:food_delivery_app/screen/confirmorder.dart';
import 'package:food_delivery_app/screen/homescreen.dart';
import 'package:food_delivery_app/screen/icons/burger.dart';
import 'package:food_delivery_app/screen/icons/chicken.dart';
import 'package:food_delivery_app/screen/icons/shakes.dart';
import 'package:food_delivery_app/screen/myorderlist.dart';

class DessertPage extends StatefulWidget {
  const DessertPage({Key? key}) : super(key: key);

  @override
  State<DessertPage> createState() => _DessertPageState();
}

class _DessertPageState extends State<DessertPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFC107),
      body: Column(
        children: [
          // 🔍 Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.search, color: Colors.grey),
                        hintText: "Search",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_basket_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.account_circle_outlined),
                ),
              ],
            ),
          ),

          // ✅ Dessert menu content inside Expanded
          Expanded(
            child: Card(
              color: Colors.white,
              elevation: 4,
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  const Text(
                    "Good Morning",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Indulge in delightful desserts",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),

                  // 🍴 Categories Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: foodCategory(Icons.local_pizza, "Pizza"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Pizza(),
                            ),
                          );
                        },
                      ),
                      GestureDetector(
                        child: foodCategory(Icons.fastfood, "Burger"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BurgerPage(),
                            ),
                          );
                        },
                      ),
                      GestureDetector(
                        child: foodCategory(Icons.set_meal, "Chicken"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChickenPage(),
                            ),
                          );
                        },
                      ),
                      GestureDetector(
                        child: Card(
                          color: Color(0xFFFFC107),
                          elevation: 4,
                          margin: const EdgeInsets.all(22),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: foodCategory(Icons.cake, "Dessert"),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                      ),
                      GestureDetector(
                        child: foodCategory(Icons.local_drink, "Shakes"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DrinkPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  const Divider(),

                  // 🍰 Dessert List Section
                  Card(
                    color: Color(0xFFFFC107),
                    elevation: 4,
                    margin: const EdgeInsets.all(22),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Sort By ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Popular",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(Icons.tune, color: Colors.black),
                            ],
                          ),
                          const SizedBox(height: 12),

                          // 🍰 Dessert Items
                          menuCard(
                            "Chocolate Cake",
                            "Rich and moist",
                            "assets/images/d1.jpg",
                            8,
                          ),
                          const Divider(),
                          menuCard(
                            "Strawberry Cheesecake",
                            "Sweet & creamy",
                            "assets/images/d2.jpg",
                            10,
                          ),
                          const Divider(),
                          menuCard(
                            "Ice Cream Sundae",
                            "Choco delight",
                            "assets/images/d3.jpg",
                            6,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const BottomStatusBar(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Dessert Item Card
  Widget menuCard(String title, String subtitle, String img, double price) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: Image.asset(
            img,
            fit: BoxFit.cover,
            height: 180,
            width: double.infinity,
            filterQuality: FilterQuality.high,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(subtitle, style: const TextStyle(color: Colors.grey)),
                ],
              ),
              Text(
                "\$$price",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.pink,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 🔹 Food Category Button
  static Widget foodCategory(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.red.shade100,
          child: Icon(icon, size: 28, color: Colors.red),
        ),
        const SizedBox(height: 4),
        Text(label),
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
