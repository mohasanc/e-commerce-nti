import 'package:flutter/material.dart';
import 'package:products/features/Profile/Presentation/Widgets/custom_listTile.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});
  static List<Map<String, dynamic>> items = [
    {'title': "Favorites", 'icon': Icons.favorite_border},
    {'title': "Downloads", 'icon': Icons.file_download_outlined},
    {'title': "Languages", 'icon': Icons.language},
    {'title': "Locations", 'icon': Icons.location_on_outlined},
    {'title': "Display", 'icon': Icons.smart_display_outlined},
    {'title': "Subscribtions", 'icon': Icons.display_settings_sharp},
    {'title': "Clear Cache", 'icon': Icons.delete_forever},
    {'title': "Clear History", 'icon': Icons.history_sharp},
    {'title': "Logout", 'icon': Icons.logout_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                CustomListTile(
                  title: items[index]['title'],
                  icon: items[index]['icon'],
                ),
                index == 1 || index == 5 || index == 8
                    ? Divider(thickness: 1, color: Colors.grey[300])
                    : SizedBox(),
              ],
            );
          },
        ),
      ),
    );
  }
}
