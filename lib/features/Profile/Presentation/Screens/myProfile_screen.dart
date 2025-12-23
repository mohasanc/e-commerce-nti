import 'package:flutter/material.dart';
import 'package:products/features/Profile/Presentation/Widgets/profile_body_section.dart';
import 'package:products/features/Profile/Presentation/Widgets/user_info_section.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "My Profile",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          leading: IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed('/products_screen'),
            icon: Icon(Icons.arrow_back_ios),
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
        ),
        body: Column(children: [UserInfoSection(), ProfileBody()]),
      ),
    );
  }
}
