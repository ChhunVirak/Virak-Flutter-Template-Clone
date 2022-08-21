import 'package:auto_route/annotations.dart';
import 'package:z1fsc_flutter_template/module/profile/page/profile.dart';

import '../module/home/pages/home.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/', page: HomePage, initial: true),
    AutoRoute(path: '/profile', page: ProfilePage),
    RedirectRoute(path: '*', redirectTo: '/'),
  ],
)
class $AppRouter {}
