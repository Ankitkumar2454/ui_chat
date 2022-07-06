import 'package:flutter/material.dart';
import 'package:ui_chat/pages/homepage.dart';
import 'package:ui_chat/widgits/theme.dart';
import 'Screens/chatScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(),
      darkTheme: MyTheme.darkTheme(),
      themeMode: ThemeMode.system,
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        ChatScreen.id: (context) => ChatScreen(),
      },
      home: HomePage(),
    );
  }
}
