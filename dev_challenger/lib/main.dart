import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dev_challenge/shared/routers/app_routers.dart';
import 'package:dev_challenge/shared/routers/named_routers.dart';
import 'package:dev_challenge/view/home/home_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Despesas',
      initialRoute: NamedRouters.homePage,
      initialBinding: HomeBinding(),
      getPages: AppPage.pages,
    );
  }
}
