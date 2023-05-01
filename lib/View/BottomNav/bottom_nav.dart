import 'package:flutter/material.dart';
import 'package:xcercise_depot/View/BottomNav/Components/Categories/categories.dart';
import 'package:xcercise_depot/View/BottomNav/Components/HomePage/home_page.dart';
import 'package:xcercise_depot/View/BottomNav/Components/Profile/profile_screen.dart';
import 'package:xcercise_depot/View/BottomNav/Components/Shopping%20Cart/shoppincart.dart';
import 'package:xcercise_depot/View/BottomNav/Components/WishList/wishlist.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:xcercise_depot/View/workout_map.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  var _selectedPageIndex = 0;
  late List<Widget> _pages;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    _selectedPageIndex = 0;
    _pages = const [
      //The individual tabs.

      HomePage(),
      WorkoutMapScreen(),
      WishList(),
      ProfileScreen(),
    ];

    _pageController = PageController(initialPage: _selectedPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  final iconList = <IconData>[
    Icons.home,
    Icons.dashboard_rounded,
    Icons.favorite_border,
    Icons.person,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedPageIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const ShoppingCart()));
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [
                Color.fromRGBO(244, 84, 70, 1),
                Color.fromRGBO(225, 42, 90, 1)
              ])),
          child: const Icon(
            Icons.shopping_bag_outlined,
            color: Colors.white,
            size: 28,
          ),
        ),
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _selectedPageIndex,
        gapLocation: GapLocation.center,
        activeColor: Colors.black,
        inactiveColor: Colors.black54,
        notchSmoothness: NotchSmoothness.softEdge,
        splashColor: Colors.red,
        splashSpeedInMilliseconds: 300,
        onTap: (index) => _onItemTapped(index),
        //other params
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
    );
  }
}
