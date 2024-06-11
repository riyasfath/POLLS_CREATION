import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:poll_app/views/Home_Screen.dart';
import 'package:poll_app/views/Login/ForgetPassword.dart';
import 'package:poll_app/views/Login/SignUpScreen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // For form validation

  // Text editing controllers for username/email and password
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green, // Set app bar color to green
        elevation: 0.0, // Remove shadow effect
        title: const Center(
          child: Text(
            'Polls App',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Text color adjusted for darker background
            ),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
      ),
      body: SingleChildScrollView(
        // Allow scrolling if needed
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              // Centered elements at the top
              const Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center horizontally
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreen),
                  ),
                ],
              ),
              const SizedBox(height: 35.0),

              // Username/Email field
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username/Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.lightGreen,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your username or email.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15.0),

              // Password field
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.lightGreen,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),

              // Centered Login Button
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center horizontally
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Get.to(HomePage());
                        // Handle login logic (e.g., API call)
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.green,
                      backgroundColor:
                          Colors.white, // Text color for pressed state
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text('Login'),
                  ),
                ],
              ),

              const SizedBox(height: 20.0),

              // Forget Password and Sign Up (adjust spacing as needed)
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Align left and right
                children: [
                  TextButton(
                    onPressed: () => {
                      Get.to(ForgotPasswordPage())
                    }, // Implement forget password logic
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                  TextButton(
                    onPressed: () => {
                      Get.to(SignupPage())
                    }, // Handle signup navigation
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.green),
                    ),
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
