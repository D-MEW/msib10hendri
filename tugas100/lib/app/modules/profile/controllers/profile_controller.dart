import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileController extends GetxController {
  var name = ''.obs;
  var address = ''.obs;
  var phoneNumber = ''.obs;

  void fetchUserData(String userId) async {
    try {
      var userSnapshot = await FirebaseFirestore.instance.collection('users').doc(userId).get();

      if (userSnapshot.exists) {
        name.value = userSnapshot['name'];
        address.value = userSnapshot['address'];
        phoneNumber.value = userSnapshot['phoneNumber'];
      }
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }
}
