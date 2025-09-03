import 'package:flutter/material.dart';

class FoodHome extends StatefulWidget {
  const FoodHome({super.key});

  @override
  State<FoodHome> createState() => _FoodHomeState();
}

class _FoodHomeState extends State<FoodHome> {
  String selectedCategory = "Pizza"; // Default selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Food App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ------------------ Category Row ------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                categoryItem(Icons.local_pizza, "Pizza"),
                categoryItem(Icons.fastfood, "Burger"),
                categoryItem(Icons.set_meal, "Chicken"),
                categoryItem(Icons.cake, "Dessert"),
                categoryItem(Icons.local_drink, "Drinks"),
              ],
            ),

            const SizedBox(height: 20),

            // ------------------ Dropdown Section ------------------
            if (selectedCategory == "Pizza") ...[
              buildPizzaCard(
                "Big Pizza",
                "Tortilla Chips With Toppings",
                "assets/images/p1.jpg",
                15.00,
              ),
              buildPizzaCard(
                "Veg Pizza",
                "Fresh Veggies With Cheese",
                "assets/images/p2.jpg",
                12.50,
              ),
            ],

            if (selectedCategory == "Burger") ...[
              buildPizzaCard(
                "Cheese Pizza",
                "Loaded with cheese",
                "assets/images/p3.jpg",
                10.00,
              ),
            ],
          ],
        ),
      ),
    );
  }

  // ------------------ Category Item Widget ------------------
  Widget categoryItem(IconData icon, String label) {
    bool isSelected = selectedCategory == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = label; // update dropdown
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.pink.shade700 : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isSelected ? Colors.white : Colors.transparent,
            width: 2,
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.black,
              size: 30,
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(color: isSelected ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------ Pizza Card Widget ------------------
  Widget buildPizzaCard(
    String title,
    String subtitle,
    String image,
    double price,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(image, height: 180, fit: BoxFit.cover),
          ),
          ListTile(
            title: Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(subtitle),
            trailing: Text(
              "\$${price.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
