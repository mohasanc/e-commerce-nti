import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.icon, required this.title});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: Icon(icon, size: 30),
          title: Padding(
            padding: EdgeInsetsGeometry.only(left: 15),
            child: Text(title),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}
