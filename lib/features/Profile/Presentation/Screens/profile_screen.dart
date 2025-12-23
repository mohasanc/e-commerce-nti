import 'dart:developer';

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed('/edit_profile'),
            icon: Icon(Icons.edit, color: Colors.black87),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            CircleAvatar(
              radius: 48,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            const SizedBox(height: 12),
            Text(
              'Mohamed Hassan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Software Engineer',
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: Column(
                children: [
                  infoTile(Icons.person, 'Mohamed Hassan'),
                  Divider(height: 1),
                  infoTile(Icons.cake, '24 Years'),
                  Divider(height: 1),
                  infoTile(Icons.email, 'itsmohassan@gmail.com'),
                  Divider(height: 1),
                  infoTile(Icons.phone, '+201009961956'),
                  Divider(height: 1),
                  infoTile(Icons.school, 'Graduated'),
                  Divider(height: 1),
                  infoTile(Icons.location_city, 'Mansoura'),
                  Divider(height: 1),
                  infoTile(Icons.work_outline, 'Software Engineer'),
                ],
              ),
            ),

            const SizedBox(height: 12),

            Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(Icons.link, color: const Color(0XFF4E0189)),
                title: Text(
                  'linkedin.com/in/mohassanc/',
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
                trailing: TextButton(
                  onPressed: () {
                    log('Open LinkedIn Profile');
                  },
                  child: Text(
                    'Open',
                    style: TextStyle(
                      color: const Color(0XFF4E0189),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget infoTile(IconData icon, String text) {
  return ListTile(
    leading: Icon(icon, color: const Color(0XFF4E0189)),
    title: Text(
      text,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    ),
    dense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
  );
}
