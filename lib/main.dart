import 'package:flutter/material.dart';
import 'package:grocery_shop_app/model/cart_model.dart';
import 'package:grocery_shop_app/pages/intro_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return CartModel();
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: IntroPage(),
      ),
    );
  }
}
