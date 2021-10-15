import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/ultilities/ultils.dart';
import 'package:todo_app/views/home_view.dart';
import 'package:device_preview/device_preview.dart';

// void main() {
//   runApp(MyApp());
// }
void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: const Color.fromRGBO(249, 251, 255, 1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: customBlue),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
          shadowColor: Colors.black38,
          primaryColor: Colors.black,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ),
            actionsIconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Color.fromRGBO(229, 232, 249, .5)),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.grey)),
      themeMode: ThemeMode.system,
      locale: DevicePreview.locale(context), // Add the locale here
      builder: DevicePreview.appBuilder, // Add the builder here
      home: HomeView(),
    );
  }
}
