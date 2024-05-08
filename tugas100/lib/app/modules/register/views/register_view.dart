import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tugas100/app/modules/login/views/login_view.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _registerUser(
    String username,
    String name,
    String address,
    String phoneNumber,
    String password,
  ) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: username,
        password: password,
      );

      String userId = userCredential.user!.uid;

      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        'name': name,
        'address': address,
        'phoneNumber': phoneNumber,
      });

      Get.off(LoginView());
    } catch (error) {
      Get.snackbar(
        'Error',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('img/5.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 444,
                    height: 45,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Register Your Account',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildTextFieldWithLabel('Username (Email)', _usernameController),
                  _buildTextFieldWithLabel('Name', _nameController),
                  _buildTextFieldWithLabel('Address', _addressController),
                  _buildTextFieldWithLabel('Phone Number', _phoneNumberController),
                  _buildTextFieldWithLabel('Password', _passwordController, obscureText: true),
                  _buildTextFieldWithLabel('Confirm Password', _confirmPasswordController, obscureText: true),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_passwordController.text == _confirmPasswordController.text) {
                          _registerUser(
                            _usernameController.text.trim(),
                            _nameController.text.trim(),
                            _addressController.text.trim(),
                            _phoneNumberController.text.trim(),
                            _passwordController.text.trim(),
                          );
                        } else {
                          Get.snackbar(
                            'Error',
                            'Passwords do not match',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        }
                      },
                      child: Text('Register'),
                    ),
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.off(LoginView());
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldWithLabel(String labelText, TextEditingController controller, {bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        SizedBox(
          width: 300,
          height: 41,
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 1),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
