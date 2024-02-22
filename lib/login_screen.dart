import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';
import 'register_screen.dart';

// Widget for the login screen
class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Function to handle user login
  void login(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Check if email and password fields are not empty
    if (email == "" || password == "") {
      print("Fill in all the fields");
    } else {
      try {
        // Sign in user with Firebase Authentication
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        // If login successful, navigate to HomeScreen
        if (userCredential.user != null) {
          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(builder: (context) => HomeScreen()),
          );
        }
      } catch (e) {
        // Log any errors that occur during login
        print("Error during login: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/ytlogo2.png', height: 300, width: 300),
              SizedBox(height: 20),
              // Text input fields for email and password
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 20),
              // Button to trigger login
              ElevatedButton(
                onPressed: () {
                  login(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Text('Login'),
              ),
              SizedBox(height: 10),
              // Row with a link to the registration screen
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("New?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                    child: Text('Register'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
