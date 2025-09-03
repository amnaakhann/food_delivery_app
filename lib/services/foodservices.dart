import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FoodService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<Map<String, dynamic>>> getFoodItems() {
    return _firestore.collection("food_items").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  Future<void> addFoodItem(Map<String, dynamic> foodData) async {
    await _firestore.collection("food_items").add(foodData);
  }

  Stream<List<Map<String, dynamic>>> getUserAddresses() {
    final uid = _auth.currentUser!.uid;
    return _firestore
        .collection("users")
        .doc(uid)
        .collection("addresses")
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) => doc.data()).toList();
        });
  }

  Future<void> addAddress(Map<String, dynamic> addressData) async {
    final uid = _auth.currentUser!.uid;
    await _firestore
        .collection("users")
        .doc(uid)
        .collection("addresses")
        .add(addressData);
  }

  Future<void> placeOrder(Map<String, dynamic> orderData) async {
    final uid = _auth.currentUser!.uid;
    await _firestore.collection("orders").add({
      ...orderData,
      "userId": uid,
      "status": "Pending",
      "timestamp": Timestamp.now(),
    });
  }

  Stream<List<Map<String, dynamic>>> getUserOrders() {
    final uid = _auth.currentUser!.uid;
    return _firestore
        .collection("orders")
        .where("userId", isEqualTo: uid)
        .orderBy("timestamp", descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  Future<void> updateOrderStatus(String orderId, String status) async {
    await _firestore.collection("orders").doc(orderId).update({
      "status": status,
    });
  }

  Stream<List<Map<String, dynamic>>> getPaymentMethods() {
    final uid = _auth.currentUser!.uid;
    return _firestore
        .collection("users")
        .doc(uid)
        .collection("payment_methods")
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  Future<void> addPaymentMethod(Map<String, dynamic> cardData) async {
    final uid = _auth.currentUser!.uid;
    await _firestore
        .collection("users")
        .doc(uid)
        .collection("payment_methods")
        .add(cardData);
  }
}
