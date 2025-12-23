// features/main/presentation/screen/main_screen.dart
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:products/features/Add_Product/Presentation/Screens/add_product_screen.dart';
import 'package:products/features/Home/Presentation/Screens/products_screen.dart';
import 'package:products/features/Profile/Presentation/Screens/myProfile_screen.dart';

class MainView extends StatefulWidget {
  const MainView({super.key, this.initialIndex = 0});
  final int initialIndex;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late int _currentPageIndex;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = widget.initialIndex;
  }

  final List<TabItem> _navBarItems = [
    const TabItem(icon: Icons.home_outlined, title: 'Home'),
    const TabItem(icon: Icons.add, title: 'Add'),
    const TabItem(icon: Icons.person, title: 'Profile'),
  ];

  List<Widget> getBottomNavigationBarBody() {
    return const [ProductsScreen(), AddProductScreen(), ProfileCard()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: getBottomNavigationBarBody()[_currentPageIndex]),
      bottomNavigationBar: ConvexAppBar(
        key: ValueKey(_currentPageIndex),
        height: 50,
        curve: Curves.easeInOut,
        style: TabStyle.react,
        backgroundColor: Color(0xff4E0189),
        elevation: 5,
        items: _navBarItems,
        initialActiveIndex: _currentPageIndex,
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
      ),
    );
  }
}
