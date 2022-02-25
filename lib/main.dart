import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_aapp/view/home_page.dart';
import 'package:weather_aapp/view/home_page_model.dart';




void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => HomePageModel(),
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
