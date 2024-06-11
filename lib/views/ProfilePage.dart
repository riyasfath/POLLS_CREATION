import 'package:flutter/material.dart';

class StaticProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Profile photo
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://placehold.it/150'), // Placeholder image
            ),
            const SizedBox(height: 20.0),

            // Username
            const Text(
              'John Doe', // Replace with actual username
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Email (static)
            const SizedBox(height: 10.0),
            const Text(
              'johndoe@example.com', // Replace with actual email
              style: TextStyle(fontSize: 12),
            ),

            // Password field (static, consider security implications)
            const SizedBox(height: 20.0),
            const TextField(
              obscureText: true,
              enabled: false, // Make password field read-only
              decoration: InputDecoration(
                labelText: 'Password',
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
