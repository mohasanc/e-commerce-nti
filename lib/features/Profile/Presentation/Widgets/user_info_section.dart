import 'package:flutter/material.dart';

class UserInfoSection extends StatelessWidget {
  const UserInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 51,
          backgroundColor: Color(0xff4E0189),
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/images/profile.jpg"),
          ),
        ),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mohamed Hassan",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            Text(
              "itsmohassan@gmail.com",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('/edit_profile'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff4E0189),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(24),
                ),
              ),
              child: Text(
                "Edit Profile",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
