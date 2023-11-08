import 'package:flutter/material.dart';

import 'assets/theme/theme.dart';
import 'features/authenticiation/presentation/login_screen.dart';
import 'features/authenticiation/presentation/widgets/authenticated_user.dart';
import 'features/home/home.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Productive',
    theme: AppTheme.darkTheme(),
    navigatorKey: _navigatorKey,
    onGenerateRoute: (settings) => MaterialPageRoute(
      builder: (_) => const SizedBox(),
    ),
    home:  AuthenticatedUser(
      child: Builder(builder: (context) {
        print("Came here");

        if (AuthenticatedUser.maybeOf(context)?.user == null) {
          return const LoginScreen();
        } else {
          return const HomeScreen();
        }
      }),
    ),
  );
}
