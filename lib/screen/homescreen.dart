import 'package:flutter/material.dart';
import 'package:food_delivery_app/contact_us/contact_us.dart';
import 'package:food_delivery_app/screen/icons/burger.dart';
import 'package:food_delivery_app/screen/cancelorder.dart';
import 'package:food_delivery_app/screen/confirmorder.dart';
import 'package:food_delivery_app/screen/icons/chicken.dart';
import 'package:food_delivery_app/screen/icons/dessert.dart';
import 'package:food_delivery_app/screen/icons/shakes.dart';
import 'package:food_delivery_app/screen/myorderlist.dart';
import 'package:food_delivery_app/screen/icons/pizza.dart';
import 'package:food_delivery_app/screen/profile/editprofile.dart';
import 'package:food_delivery_app/screen/profile/profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = -1;
  String selectedCategory = "Pizza";
  // -1 means nothing selected

  @override
  Widget build(BuildContext context) {
    const Color mustardColor = Color(0xFFFFC107);

    return Scaffold(
      backgroundColor: mustardColor,
      body: SafeArea(
        child: Column(
          children: [
            // 🔍 Search bar and icons row
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
                    onPressed: () async {
                      final RenderBox button =
                          context.findRenderObject() as RenderBox;
                      final RenderBox overlay =
                          Overlay.of(context).context.findRenderObject()
                              as RenderBox;

                      await showMenu(
                        context: context,
                        position: RelativeRect.fromRect(
                          Rect.fromPoints(
                            button.localToGlobal(
                              button.size.topRight(Offset.zero),
                              ancestor: overlay,
                            ),
                            button.localToGlobal(
                              button.size.bottomRight(Offset.zero),
                              ancestor: overlay,
                            ),
                          ),
                          Offset.zero & overlay.size,
                        ),
                        items: [
                          PopupMenuItem(
                            enabled: false, // disable clicking
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 22,
                                  backgroundColor: Colors.purple,
                                  child: const Text(
                                    "A",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  "Amna Khan",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    icon: const Icon(Icons.account_circle_outlined),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Card(
                  color: Colors.white,
                  elevation: 4,
                  margin: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      HomeCardSection(
                        selectedIndex: selectedIndex,
                        onCategoryTap: (index) {
                          setState(() {
                            selectedIndex = index;
                          });

                          if (index == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Pizza(),
                              ),
                            );
                          } else if (index == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BurgerPage(),
                              ),
                            );
                          } else if (index == 2) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ChickenPage(),
                              ),
                            );
                          } else if (index == 3) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DessertPage(),
                              ),
                            );
                          } else if (index == 4) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DrinkPage(),
                              ),
                            );
                          }
                        },
                      ),

                      const SizedBox(height: 20),
                      const Divider(),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "Best Seller",

                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "View all",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.arrow_right, color: Colors.red),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          productItem("assets/images/download.jpg"),
                          productItem("assets/images/2pic.jpg"),
                          productItem("assets/images/33.jpg"),
                          productItem("assets/images/44.jpg"),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [productItem3("assets/images/off.jpg")],
                      ),
                      const SizedBox(height: 20),

                      const Text(
                        "Recommended",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          productItem2("assets/images/66.jpg"),
                          productItem2("assets/images/77.jpg"),
                        ],
                      ),
                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          productItem2("assets/images/88.jpg"),
                          productItem2("assets/images/99.jpg"),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const Divider(),
                      const Text(
                        "Contact Us",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // WhatsApp
                          IconButton(
                            icon: const FaIcon(
                              FontAwesomeIcons.whatsapp,
                              color: Colors.green,
                              size: 30,
                            ),
                            onPressed: () {
                              print("WhatsApp tapped");
                            },
                          ),
                          // Facebook
                          IconButton(
                            icon: const FaIcon(
                              FontAwesomeIcons.facebook,
                              color: Colors.blue,
                              size: 30,
                            ),
                            onPressed: () {
                              print("Facebook tapped");
                            },
                          ),
                          // Instagram
                          IconButton(
                            icon: const FaIcon(
                              FontAwesomeIcons.instagram,
                              color: Colors.purple,
                              size: 30,
                            ),
                            onPressed: () {
                              print("Instagram tapped");
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // Contact Us Icon button at bottom
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ContactUsPage(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.contact_mail),
                        label: const Text(
                          "Contact Us",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
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

  static Widget productItem(String imagePath) {
    return Flexible(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          width: 120,
          height: 120,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  static Widget productItem2(String imagePath) {
    return Flexible(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          width: 320,
          height: 120,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  static Widget productItem3(String imagePath) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          width: 820,
          height: 280,
          filterQuality: FilterQuality.high,
          fit: BoxFit.fitHeight,
        ),
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
          navButton(Icons.contact_mail, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          }),
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

class Pizza extends StatefulWidget {
  const Pizza({super.key});

  @override
  State<Pizza> createState() => _PizzaState();
}

class _PizzaState extends State<Pizza> {
  @override
  Widget build(BuildContext context) {
    const Color mustardColor = Color(0xFFFFC107);

    return Scaffold(
      backgroundColor: mustardColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // 🔍 Search bar
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
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
              Card(
                color: Colors.white,
                elevation: 4,
                margin: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Good Morning",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Rise and shine! It's breakfast time",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 20),

                      // 🍴 Categories Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            child: Card(
                              color: Color(0xFFFFC107),
                              elevation: 4,
                              margin: const EdgeInsets.all(22),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: foodCategory(Icons.local_pizza, "Pizza"),
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
                            child: foodCategory(Icons.cake, "Dessert"),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DessertPage(),
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
                      const Divider(),

                      // 🍕 Combined Pizza Card Section
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Sort By Row (shown only ONCE)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              const SizedBox(height: 16),

                              // Pizza Item 1
                              pizzaItem(
                                image1: "assets/images/p1.jpg",
                                image2: "assets/images/p2.jpg",
                                title: "Big Pizza",
                                rating: "5.0",
                                price: "\$15.00",
                                desc: "Tortilla chips with toppings",
                              ),
                              const Divider(),

                              // Pizza Item 2
                              pizzaItem(
                                image1: "assets/images/p4.jpg",
                                image2: "assets/images/p3.jpg",
                                title: "Cheese Burst",
                                rating: "4.7",
                                price: "\$18.50",
                                desc: "Loaded cheese & crispy crust",
                              ),
                            ],
                          ),
                        ),
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
    );
  }

  // 🔹 Single Pizza Item Widget
  Widget pizzaItem({
    required String image1,
    required String image2,
    required String title,
    required String rating,
    required String price,
    required String desc,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Images
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    image1,
                    height: 120,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    image2,
                    height: 120,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Title + Rating
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Text(
                      rating,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.star, color: Colors.yellow, size: 16),
                    const SizedBox(width: 6),
                    Text(
                      price,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Description
          Text(
            desc,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }

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

class HomeCardSection extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onCategoryTap;

  const HomeCardSection({
    super.key,
    required this.selectedIndex,
    required this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Good Morning",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            "Rise and shine! It's breakfast time",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildCategory(0, Icons.local_pizza, "Pizza"),
              buildCategory(1, Icons.fastfood, "Burger"),
              buildCategory(2, Icons.set_meal, "Chicken"),
              buildCategory(3, Icons.cake, "Dessert"),
              buildCategory(4, Icons.local_drink, "Shakes"),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCategory(int index, IconData icon, String label) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onCategoryTap(index),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isSelected ? Colors.white : Colors.transparent,
            width: 2,
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: foodCategory(icon, label),
      ),
    );
  }

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
