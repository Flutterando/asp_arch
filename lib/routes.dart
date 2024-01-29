import 'package:routefly/routefly.dart';

import 'app/(public)/home_page.dart' as a0;
import 'app/(public)/splash_page.dart' as a1;

List<RouteEntity> get routes => [
  RouteEntity(
    key: '/home',
    uri: Uri.parse('/home'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a0.HomePage(),
    ),
  ),
  RouteEntity(
    key: '/splash',
    uri: Uri.parse('/splash'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a1.SplashPage(),
    ),
  ),
];

const routePaths = (
  path: '/',
  home: '/home',
  splash: '/splash',
);
