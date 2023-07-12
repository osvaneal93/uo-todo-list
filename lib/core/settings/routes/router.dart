import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_note_app/presentation/views/auth/login_screen.dart';
import 'package:todo_note_app/presentation/views/auth/providers/global_auth/global_auth_provider.dart';
import 'package:todo_note_app/presentation/views/auth/signin_screen.dart';
// import 'package:todo_note_app/presentation/views/auth/signin_view.dart';
import 'package:todo_note_app/presentation/views/global_home/global_home_screen.dart';
import 'package:todo_note_app/presentation/views/splash/splash_screen.dart';
// import 'package:todo_note_app/presentation/views/splash/splash_screen.dart';

final routeProvider = Provider((ref) {
  final goProvider = ref.read(goRouterProvider);

  return GoRouter(
    refreshListenable: goProvider,
    initialLocation: GlobalHomeScreen.path,
    routes: [
      GoRoute(
        path: LoginScreen.path,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: GlobalHomeScreen.path,
        builder: (context, state) => const GlobalHomeScreen(),
      ),
      GoRoute(
        path: SignInScreen.path,
        builder: (context, state) => SignInScreen(),
      ),
      GoRoute(
        path: SplashScreen.path,
        builder: (context, state) => const SplashScreen(),
      )
    ],
    redirect: (context, state) {
      final goingTo = state.location;
      final authStatus = goProvider.authStatus;

      switch (goingTo) {
        case GlobalHomeScreen.path:
          if (authStatus == AuthStatus.notAuthenticated) {
            return LoginScreen.path;
          } else if (authStatus == AuthStatus.authenticated) {
            return null;
          } else {
            return null;
          }
        case LoginScreen.path:
          if (authStatus == AuthStatus.authenticated) {
            return GlobalHomeScreen.path;
          } else {
            return null;
          }
        case SignInScreen.path:
          if (authStatus == AuthStatus.authenticated) {
            return GlobalHomeScreen.path;
          } else {
            return null;
          }
        case SplashScreen.path:
          if (authStatus == AuthStatus.notAuthenticated) {
            return LoginScreen.path;
          } else if (authStatus == AuthStatus.authenticated) {
            return GlobalHomeScreen.path;
          } else {
            return null;
          }
      }

      return null;
    },
  );
});

final goRouterProvider = Provider((ref) {
  final authNotifier = ref.watch(authStateProvider.notifier);
  return RouteNotifierProvider(authNotifier);
});

class RouteNotifierProvider extends ChangeNotifier {
  final AuthStateProvider _authNotifier;
  AuthStatus _authStatus = AuthStatus.checking;

  RouteNotifierProvider(this._authNotifier) {
    _authNotifier.addListener((state) {
      authStatus = state.authStatus;
    });
  }

  AuthStatus get authStatus => _authStatus;

  set authStatus(AuthStatus value) {
    _authStatus = value;
    notifyListeners();
  }
}




// final goRouterProvider = Provider((ref) {
//   // final authNotifier = ref.watch(au)
// });
