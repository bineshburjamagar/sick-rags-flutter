import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sick_rags_flutter/config/app_colors.dart';
import 'package:sick_rags_flutter/core/providers/base_page_provider.dart';

class BasePage extends StatelessWidget {
  const BasePage({Key? key}) : super(key: key);
  static const String routeName = "/basepage";
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const BasePage());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BasePageProvider>(builder: (context, baseProv, child) {
      return Scaffold(
        drawer: const Drawer(),
        body: baseProv.screen.elementAt(baseProv.initialIndex),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: NavigationBar(
              backgroundColor: AppColors.primaryColor,
              onDestinationSelected: (value) {
                baseProv.changeIndex(value);
              },
              selectedIndex: baseProv.initialIndex,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              elevation: 0.0,
              height: 50.0,
              indicatorColor: Colors.white,
              destinations: const [
                NavigationDestination(
                    icon: Icon(
                      Icons.home_rounded,
                    ),
                    label: 'Home'),
                NavigationDestination(
                    icon: Icon(
                      Icons.home_rounded,
                    ),
                    label: 'Home'),
                NavigationDestination(
                    icon: Icon(
                      Icons.home_rounded,
                    ),
                    label: 'Home'),
              ],
            ),
          ),
        ),
      );
    });
  }
}
