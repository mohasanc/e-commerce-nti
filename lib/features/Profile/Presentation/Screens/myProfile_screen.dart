import 'package:flutter/material.dart';
import 'package:products/Core/theme/switch_theme_list_tile.dart';
import 'package:products/features/profile/Presentation/Widgets/profile_body_section.dart';
import 'package:products/features/profile/Presentation/Widgets/user_info_section.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Profile",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pushNamed('/products_screen'),
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      body: Column(
        children: [
          UserInfoSection(),
          SizedBox(height: 8),
          SwitchThemeListTile(),
          SizedBox(height: 8),
          ProfileBody(),
        ],
      ),
    );
  }
}
