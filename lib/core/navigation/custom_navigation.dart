import 'package:app/features/main/main_screen.dart';
import 'package:app/features/recipes/presentation/pages/favourites_screen.dart';
import 'package:app/features/recipes/presentation/pages/recipe_details_screen.dart';

import '../../features/recipes/presentation/pages/recipes_screen.dart';
import '../../injection_container.dart';
import 'package:flutter/material.dart';

import '../resources/routes_manager.dart';

/// Global Context of App
BuildContext? get currentContext =>
    CustomNavigator.navigatorState.currentContext;

/// Global Context of App
BuildContext? get currentContextWithBottomNav =>
    CustomNavigator.navigatorKeysBottomNav[selectedTab].currentContext;

abstract class CustomNavigator {
  static final GlobalKey<NavigatorState> navigatorState = GlobalKey();

  static List<GlobalKey<NavigatorState>> navigatorKeysBottomNav = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];
  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();

  static Route<dynamic> onCreateRoute(RouteSettings settings) {
    Map<String, dynamic> data = settings.arguments != null
        ? settings.arguments as Map<String, dynamic>
        : {};
    switch (settings.name) {
      case Routes.mainRoute:
        return MaterialPageRoute(
            builder: (_) =>
                setupDependenciesMainScreen(child: const MainScreen()));
      case Routes.loginRoute:
        return MaterialPageRoute(
            builder: (_) =>
                setupDependenciesMainScreen(child: const MainScreen()));
      default:
        {
          final screens = generateHomeRoute(settings);

          return screens;
        }
    }
  }

  static Route generateHomeRoute(RouteSettings settings) {
    Map<String, dynamic> data = settings.arguments != null
        ? settings.arguments as Map<String, dynamic>
        : {};
    switch (settings.name) {
      case Routes.recipesRoute:
        return MaterialPageRoute(builder: (_) => const RecipesScreen());
      case Routes.favoritesRoute:
        return MaterialPageRoute(builder: (_) => const FavoritesPageScreen());
      case Routes.recipesDetailsRoute:
        return MaterialPageRoute(
            builder: (_) => RecipeDetailPage(
                  data: data["data"],
                ));

      default:
        {
          return MaterialPageRoute(builder: (_) => const RecipesScreen());
        }
    }
  }

  static void pop({dynamic result}) {
    if (navigatorState.currentState!.canPop()) {
      navigatorState.currentState!.pop(result);
    }
  }

  // track navigation of user
  static push(
    String routeName, {
    arguments,
    bool replace = false,
    bool clean = false,
    bool Function(Route<dynamic>)? predicate,
  }) {
    if (navigatorState.currentState != null) {
      if (clean) {
        return navigatorState.currentState!.pushNamedAndRemoveUntil(
          routeName,
          predicate ?? (_) => false,
          arguments: arguments,
        );
      } else if (replace) {
        return navigatorState.currentState!
            .pushReplacementNamed(routeName, arguments: arguments);
      } else {
        return navigatorState.currentState!
            .pushNamed(routeName, arguments: arguments);
      }
    }
  }

  static void popInSubNavigator(
      {dynamic result, bool Function(Route<dynamic>)? predicate}) {
    if (navigatorKeysBottomNav[selectedTab].currentState!.canPop()) {
      predicate != null
          ? navigatorKeysBottomNav[selectedTab]
              .currentState!
              .popUntil(predicate)
          : navigatorKeysBottomNav[selectedTab].currentState!.pop(result);
    }
  }

  static pushInSubNavigator(String routeName,
      {arguments,
      bool replace = false,
      bool clean = false,
      bool rootNavigator = false,
      bool digitalIdentityRequired = false,
      bool Function(Route<dynamic>)? predicate,
      bool authRequired = false}) {
    BuildContext context =
        navigatorKeysBottomNav[selectedTab].currentState!.context;

    if (clean) {
      return Navigator.of(context, rootNavigator: rootNavigator)
          .pushNamedAndRemoveUntil(
        routeName,
        predicate ?? (_) => false,
        arguments: arguments,
      );
    } else if (replace) {
      return Navigator.of(context, rootNavigator: rootNavigator)
          .pushReplacementNamed(routeName, arguments: arguments);
    } else {
      return Navigator.of(context, rootNavigator: rootNavigator)
          .pushNamed(routeName, arguments: arguments);
    }
  }
}
