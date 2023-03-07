import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:sm_technical_app/ui/shared/widgets/appbar/customappbar.dart';

import '../../../domain/constants/routes.dart';

class NavigationWrapper extends StatefulWidget {
  final Widget child;

  const NavigationWrapper(this.child, {super.key});

  @override
  State<NavigationWrapper> createState() => _NavigationWrapperState();
}

class _NavigationWrapperState extends State<NavigationWrapper> {
  late int _selectedIndex = getCurrentIndex();
  @override
  Widget build(BuildContext context) {
    _selectedIndex = getCurrentIndex();
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(child: widget.child).animate().fadeIn(),
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(indicatorColor: Colors.indigoAccent),
        child: NavigationBar(
          animationDuration: const Duration(milliseconds: 500),
          backgroundColor: Colors.white,
          selectedIndex: _selectedIndex,
          onDestinationSelected: onTapped,
          destinations: [
            NavigationDestination(
              icon: Icon(
                Icons.explore,
                color: _selectedIndex == 0 ? Colors.white : Colors.black87,
              ),
              label: 'Explore',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.map,
                color: _selectedIndex == 1 ? Colors.white : Colors.black87,
              ),
              label: 'Plan',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.list,
                color: _selectedIndex == 2 ? Colors.white : Colors.black87,
              ),
              label: 'List',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.create,
                color: _selectedIndex == 3 ? Colors.white : Colors.black87,
              ),
              label: 'Create',
            ),
          ],
        ),
      ),
    );
  }

  int getCurrentIndex() {
    switch (GoRouter.of(context).location) {
      case '/explore':
        return 0;
      case '/plan':
        return 1;
      case '/list':
        return 2;
      case '/create':
        return 3;
      default:
        return 0;
    }
  }

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          context.goNamed(Routes.explore.name);
          break;
        case 1:
          context.goNamed(Routes.plan.name);
          break;
        case 2:
          context.goNamed(Routes.list.name);
          break;
        case 3:
          context.goNamed(Routes.create.name);
          break;
      }
    });
  }
}
