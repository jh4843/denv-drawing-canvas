import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import './features/canvas/presentation/screen/drawing_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
// final _authShellNavigatorKey =
//     GlobalKey<NavigatorState>(debugLabel: 'authShell');
// final _layoutShellNavigatorKey =
//     GlobalKey<NavigatorState>(debugLabel: 'layoutShell');
// final _drawingShellNavigatorKey =
//     GlobalKey<NavigatorState>(debugLabel: 'drawingShell');

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const DrawingPage(),
      routes: <RouteBase>[],
    ),
  ],
);

class AuthShell extends StatelessWidget {
  const AuthShell({super.key, required this.state, required this.child});

  final GoRouterState state;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 300.0,
            color: Colors.black,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  onTap: () => context.go('/signin'),
                  title: const Text('Go to Sign In Page',
                      style: TextStyle(color: Colors.white)),
                ),
                ListTile(
                  onTap: () => context.go('/signup'),
                  title: const Text('Go to Sign Up Page',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
