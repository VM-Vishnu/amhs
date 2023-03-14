import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:amhs/router.dart';
//import 'package:device_preview/device_preview.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]).then(
      (value) => runApp(
          const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //RouteGenerator route=RouteGenerator();
    return Sizer(
      builder: ((context, orientation, deviceType) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.generateRoute,
          initialRoute: '/',
          //home: const HomeScreen(),
        );
      }),
    );
  }
}
