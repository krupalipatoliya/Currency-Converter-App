import 'package:currency_convter/views/homeScreen/pages/homepage.dart';
import 'package:flutter/cupertino.dart';

import 'appRoutes.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes().homePage: (context) => HomePage()
};
