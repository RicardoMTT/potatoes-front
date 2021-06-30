import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:potatoes_test/app_routing/routing.dart';
import 'package:potatoes_test/graphql.dart';
import 'package:potatoes_test/splash/screens/splash/screen.dart';
import 'package:potatoes_test/splash/screens/splash/screen_binding.dart';
import 'package:potatoes_test/app_constants/color.dart';

void main() {
  Get.lazyPut<GraphQLClient>(() => getGraphqlClient());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: ValueNotifier(Get.find<GraphQLClient>()),
      child: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          accentColor: kPrimaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
        initialBinding: SplashScreenBindings(),
        onGenerateRoute: AppRouting.onGenerateRoute,
      ),
    );
  }
}
