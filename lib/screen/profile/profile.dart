import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/address/select_address.dart';
import 'package:food_delivery_app/payment_method/payment_method.dart';
import 'package:food_delivery_app/initial_page/login.dart';
import 'package:food_delivery_app/screen/profile/account_setting.dart';
import 'package:food_delivery_app/screen/profile/editprofile.dart';
import 'package:food_delivery_app/screen/profile/notification.dart';
import 'package:image_picker/image_picker.dart';
import 'package:food_delivery_app/screen/homescreen.dart';
import 'package:food_delivery_app/screen/confirmorder.dart';
import 'package:food_delivery_app/screen/myorderlist.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _imageFile;
  Future<void> _pickImage() async {
    final status = await Permission.photos.request(); // iOS
    final status2 = await Permission.storage.request(); // Android

    if (status.isGranted || status2.isGranted) {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFC107),
      body: SafeArea(
        child: Column(
          children: [
            // Header with back arrow + title
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
                    "Profile Page",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Profile picture
                        GestureDetector(
                          onTap: _pickImage,
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.grey.shade200,
                            backgroundImage: _imageFile != null
                                ? FileImage(_imageFile!)
                                : const AssetImage("assets/profile.jpg"),
                            child: _imageFile == null
                                ? const Icon(
                                    Icons.add_a_photo,
                                    size: 40,
                                    color: Colors.red,
                                  )
                                : null,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Menu rows
                        buildMenuRow1(Icons.person, "Edit Profile"),

                        buildMenuRow1(Icons.settings, "Account Settings"),
                        buildMenuRow1(
                          Icons.notifications,
                          "Notification Settings",
                        ),
                        buildMenuRow1(Icons.location_on, "Delivery Address"),
                        buildMenuRow1(Icons.credit_card, "Payment Method"),
                        buildMenuRow6(Icons.logout, "Logout", isLogout: true),

                        const SizedBox(height: 20),

                        // Update Profile Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Editprofile(),
                                ),
                              );
                            },
                            child: const Text(
                              "Update Profile",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
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

            const BottomStatusBar(),
          ],
        ),
      ),
    );
  }

  // Reusable Menu Row
  Widget buildMenuRow6(IconData icon, String text, {bool isLogout = false}) {
    return ListTile(
      leading: Icon(icon, color: isLogout ? Colors.red : Colors.black),
      title: Text(
        text,
        style: TextStyle(
          color: isLogout ? Colors.red : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        if (icon == Icons.logout) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        }

        // handle navigation
      },
    );
  }

  Widget buildMenuRow1(IconData icon, String text, {bool isLogout = false}) {
    return ListTile(
      leading: Icon(icon, color: isLogout ? Colors.red : Colors.black),
      title: Text(
        text,
        style: TextStyle(
          color: isLogout ? Colors.red : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        if (icon == Icons.person) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Editprofile()),
          );
        } else if (icon == Icons.settings) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AccountSettingPage()),
          );
        } else if (icon == Icons.logout) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        } else if (icon == Icons.location_on) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SelectAddress()),
          );
        } else if (icon == Icons.notifications) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotificationSettingsPage()),
          );
        } else if (icon == Icons.credit_card) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PaymentMethodPage()),
          );
        }

        // handle navigation
      },
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
