import 'package:flutter/material.dart';

import '../../constants/appConstant.dart';
import '../Homepage/homepage.dart';
import '../Search/searchPage.dart';

class Deshboard extends StatefulWidget {
  const Deshboard({super.key});

  @override
  State<Deshboard> createState() => _DeshboardState();
}

class _DeshboardState extends State<Deshboard> {
  late PageController _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    final int defaultPage = 1;
    _selectedIndex = defaultPage;
    _pageController = PageController(initialPage: defaultPage);
  }

  final List<BottomNavItem> _navItems = const [
    BottomNavItem(
      activeIcon: Icons.task_rounded,
      inactiveIcon: Icons.task_outlined,
      label: 'Inspection',
    ),
    BottomNavItem(
      activeIcon: Icons.home_rounded,
      inactiveIcon: Icons.home_outlined,
      label: 'Home',
    ),
    BottomNavItem(
      activeIcon: Icons.history_edu_rounded,
      inactiveIcon: Icons.history_edu_outlined,
      label: 'History',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> bottomBarPages = [
      NewsHomePage(),
      NewsHomePage(),
      NewsHomePage(),
    ];

    final List<Widget> selectedPages = bottomBarPages;
    final List<BottomNavItem> selectedPageIcons = _navItems;

    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() => _selectedIndex = index);
        },
        children: List.generate(
          selectedPages.length,
          (index) => selectedPages[index],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
        child: CustomBottomBar(
          selectedIndex: _selectedIndex,
          items: selectedPageIcons,
          onTap: (index) {
            setState(() => _selectedIndex = index);
            _pageController.jumpToPage(index);
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class CustomBottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
  final List<BottomNavItem> items;

  const CustomBottomBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.30,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          items.length,
          (index) => _buildNavItem(index, context),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, BuildContext context) {
    final item = items[index];
    final isSelected = selectedIndex == index;

    return InkWell(
      onTap: () => onTap(index),
      borderRadius: BorderRadius.circular(25),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: isSelected
            ? BoxDecoration(shape: BoxShape.circle, color: Colors.white)
            : null,
        child: Icon(
          isSelected ? item.activeIcon : item.inactiveIcon,
          color: isSelected ? Colors.black : Colors.grey,
          size: 24,
        ),
      ),
    );
  }
}

class BottomNavItem {
  final IconData activeIcon;
  final IconData inactiveIcon;
  final String label;

  const BottomNavItem({
    required this.activeIcon,
    required this.inactiveIcon,
    required this.label,
  });
}
