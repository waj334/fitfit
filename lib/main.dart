import 'package:fitfit/router.dart';
import 'package:fitfit/screens/chat_client.dart';
import 'package:fitfit/screens/chat_trainer.dart';
import 'package:fitfit/screens/clients.dart';
import 'package:fitfit/screens/community_feed.dart';
import 'package:fitfit/screens/workouts_client.dart';
import 'package:fitfit/screens/workouts_trainer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const Main());
}

class Screen {
  const Screen(this.route, this.key, this.child);

  final String route;
  final GlobalKey<NavigatorState> key;
  final Widget child;
}

class Main extends StatelessWidget {
  const Main({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
    );

    /*
    return MaterialApp(
      title: 'FitFit - Get Fit Fit',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MainWidget(),
    );
     */
  }
}

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int currentScreen = 0;
  bool isClient = false;

  late final List<Widget> _screens;
  late final List<GlobalKey<NavigatorState>> _navigatorKeys;

  @override
  void initState() {
    super.initState();

    // Select the expected screens depending whether or not the current user is
    // a trainer or a client.
    final screens = isClient ? clientScreens() : trainerScreens();

    // Finally, build each top-level screen.
    _screens = List<Widget>.generate(
        screens.length, (index) => buildScreen(screens, index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentScreen,
        children: _screens,
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: onDestinationSelected,
        selectedIndex: currentScreen,
        destinations: isClient
            ? clientNavigationDestinations()
            : trainerNavigationDestinations(),
      ),
    );
  }

  void onDestinationSelected(int index) {
    setState(() {
      currentScreen = index;
    });
  }

  List<NavigationDestination> clientNavigationDestinations() {
    return const <NavigationDestination>[
      NavigationDestination(
          icon: FaIcon(FontAwesomeIcons.dumbbell), label: 'Workouts'),
      NavigationDestination(icon: Icon(Icons.message), label: 'Chat'),
      NavigationDestination(
          icon: Icon(Icons.rss_feed), label: 'Community Feed'),
    ];
  }

  List<Screen> clientScreens() {
    return <Screen>[
      Screen("", GlobalKey<NavigatorState>(), const ClientWorkoutsScreen()),
      Screen("", GlobalKey<NavigatorState>(), const ClientChatScreen()),
      Screen("", GlobalKey<NavigatorState>(), const CommunityFeed()),
    ];
  }

  List<NavigationDestination> trainerNavigationDestinations() {
    return const <NavigationDestination>[
      NavigationDestination(
          icon: FaIcon(FontAwesomeIcons.dumbbell), label: 'Workout Designer'),
      NavigationDestination(
          icon: FaIcon(FontAwesomeIcons.users), label: 'Clients'),
      NavigationDestination(icon: Icon(Icons.message), label: 'Chat'),
      NavigationDestination(
          icon: Icon(Icons.rss_feed), label: 'Community Feed'),
    ];
  }

  List<Screen> trainerScreens() {
    return <Screen>[
      Screen("", GlobalKey<NavigatorState>(), const TrainerWorkoutsScreen()),
      Screen("", GlobalKey<NavigatorState>(), const ClientsScreen()),
      Screen("", GlobalKey<NavigatorState>(), const TrainerChatScreen()),
      Screen("", GlobalKey<NavigatorState>(), const CommunityFeed()),
    ];
  }

  Widget buildScreen(List<Screen> screens, int index) {
    return Navigator(
      key: screens[index].key,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => screens[index].child,
        );
      },
    );
  }
}
