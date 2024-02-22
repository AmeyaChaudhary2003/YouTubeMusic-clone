import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

// Widget for the registration screen
class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: RegisterForm(),
        ),
      ),
    );
  }
}

// Widget for the registration form
class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  // Controllers for text input fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cpasswordController = TextEditingController();

  // Function to create a new user account
  void createAccount() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String cPassword = cpasswordController.text.trim();

    // Check if any of the fields are empty
    if (email == "" || password == "" || cPassword == "") {
      log("Please fill all the details");
    } else if (password != cPassword) {
      log("Password mismatched");
    } else {
      try {
        // Create user account using Firebase Authentication
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        // Log success and navigate back to the previous screen
        log("User Created!");
        if (userCredential.user != null) {
          Navigator.pop(context);
        }
      } catch (e) {
        // Log any errors that occur during user creation
        log("Error creating user: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/ytlogo2.png', height: 300, width: 300),
        SizedBox(height: 20),
        // Text input fields for email, password, and confirm password
        TextField(
          controller: emailController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(labelText: 'Email', labelStyle: TextStyle(color: Colors.white)),
        ),
        TextField(
          controller: passwordController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(labelText: 'Password', labelStyle: TextStyle(color: Colors.white)),
        ),
        TextField(
          controller: cpasswordController,
          obscureText: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(labelText: 'Confirm Password', labelStyle: TextStyle(color: Colors.white)),
        ),
        SizedBox(height: 20),
        // Button to trigger account creation
        ElevatedButton(
          onPressed: () {
            createAccount();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          ),
          child: Text('Register', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
