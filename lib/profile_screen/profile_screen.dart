import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final Map<String, dynamic> userDetails;

  ProfileScreen({required this.userDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Header
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  // User Avatar
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/avatar.jpg'), // Use your own image path or network image
                  ),
                  SizedBox(height: 10),
                  // User Name
                  Text(
                    userDetails['name'] ?? '',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  // User Email
                  Text(
                    userDetails['email'] ?? '',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),

            Divider(),
          ],
        ),
      ),
    );
  }
}
