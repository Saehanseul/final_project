import 'package:final_project/features/authentication/repos/auth_repo.dart';
import 'package:final_project/features/authentication/screens/login_screen.dart';
import 'package:final_project/features/authentication/screens/sign_up_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:final_project/common/widgets/main_navigation_screen.dart';

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: "/home",
      redirect: (context, state) {
        final isLoggedIn = ref.watch(authRepo).isLoggedIn;
        print("isLoggedIn: $isLoggedIn");
        print("state matchedLocation: ${state.matchedLocation}");
        if (!isLoggedIn) {
          if (state.matchedLocation != SignUpScreen.routeURL &&
              state.matchedLocation != LoginScreen.routeURL) {
            return LoginScreen.routeURL;
          }
        }
        return null;
      },
      routes: [
        GoRoute(
          path: "/:tab(home|post)",
          builder: (context, state) {
            final tab = state.pathParameters["tab"]!;
            print("tab: $tab");
            return MainNavigationScreen(tab: tab);
          },
        ),
        GoRoute(
          path: SignUpScreen.routeURL,
          builder: (context, state) {
            return const SignUpScreen();
          },
        ),
        GoRoute(
          path: LoginScreen.routeURL,
          builder: (context, state) {
            return const LoginScreen();
          },
        ),
      ],
    );
  },
);
