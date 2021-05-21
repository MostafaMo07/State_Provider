import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_provider/home.dart';
import 'package:state_provider/model/cart.dart';

import 'learnprovider/learnprovider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Cart();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        home: HomePage(),
      ),
    );
  }
}
