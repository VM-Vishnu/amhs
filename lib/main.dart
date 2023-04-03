import 'package:amhs/Details/categoryDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:amhs/Details/router.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: ((context, orientation, deviceType) {
        return ChangeNotifierProvider(
          create: (context) => Ctainer(),
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.generateRoute,
            initialRoute: '/',
          ),
        );
      }),
    );
  }
}
