import 'package:final_project/common/widgets/nav_tab.dart';
import 'package:final_project/features/home/screens/home_screen.dart';
import 'package:final_project/features/post/screens/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainNavigationScreen extends StatefulWidget {
  static const String routeName = "mainNavigation";

  final String tab;

  const MainNavigationScreen({
    super.key,
    required this.tab,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final List<String> _tabs = [
    "home",
    "post",
  ];

  late int _selectedIndex = _tabs.indexOf(widget.tab);

  void _onTap(int index) {
    context.go("/${_tabs[index]}");
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Offstage(
              offstage: _selectedIndex != 0,
              child: const HomeScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 1,
              child: const PostScreen(),
            )
          ],
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.black, // 검은색 테두리
                width: 2.0, // 테두리 두께
              ),
            ),
          ),
          child: BottomAppBar(
            elevation: 0,
            color: const Color(0xFFEBE6C6),
            child: Row(
              children: [
                NavTab(
                  text: "Home",
                  icon: Icons.home,
                  selectedIcon: Icons.home,
                  isSelected: _selectedIndex == 0,
                  onTab: () => _onTap(0),
                  selectedIndex: _selectedIndex,
                ),
                NavTab(
                  text: "Post",
                  icon: Icons.post_add,
                  selectedIcon: Icons.post_add,
                  isSelected: _selectedIndex == 1,
                  onTab: () => _onTap(1),
                  selectedIndex: _selectedIndex,
                )
              ],
            ),
          ),
        ));
  }
}
