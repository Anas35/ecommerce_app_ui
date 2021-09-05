import 'package:ecommerce_app_ui/pages/home_page.dart';
import 'package:ecommerce_app_ui/src/data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DataWidget(child: MyApp()));
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ECommerce App Design',
      home: HomePage(
        key: Key('HomePage'),
      ),
    );
  }
}

