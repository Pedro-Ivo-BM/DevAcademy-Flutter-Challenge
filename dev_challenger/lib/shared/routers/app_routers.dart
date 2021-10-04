
import 'package:get/get.dart';
import 'package:dev_challenge/shared/routers/named_routers.dart';
import 'package:dev_challenge/view/home/home_binding.dart';
import 'package:dev_challenge/view/home/home_page.dart';

class AppPage {
  static final List<GetPage> pages = [
    GetPage(
      name: NamedRouters.homePage,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
     
  ];
}
