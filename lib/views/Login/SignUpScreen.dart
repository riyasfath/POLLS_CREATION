import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>(); // For form validation

  // Text editing controllers for signup fields
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green, // Green app bar
        elevation: 0.0, // Remove shadow effect
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // Back button
          onPressed: () => Navigator.pop(context), // Navigate back
        ),
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right:55),
            child: Text(
              'Polls App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
      ),
      body: SingleChildScrollView( // Allow scrolling if needed
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightGreen
                ),
              ),
              const SizedBox(height: 20.0),

              // Username field
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person,color: Colors.lightGreen,),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your username.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),

              // Email field
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress, // Email keyboard type
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email,color: Colors.lightGreen,),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email.';
                  } else if (!value.isValidEmail) {
                    return 'Please enter a valid email address.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),

              // Password field
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock,color: Colors.lightGreen),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),

              // Sign Up Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center horizontally
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle signup logic (e.g., API call)
                      }
                    },
                    child: const Text('Sign Up'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.green, backgroundColor: Colors.white, // Text color for pressed state
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
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

extension EmailValidator on String {
  bool get isValidEmail {

        final emailRegExp = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");
        return emailRegExp.hasMatch(this);
        }
    }

