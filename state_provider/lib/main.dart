import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_provider/api/cheetah_api.dart';
import 'package:state_provider/controller/user_notifier.dart';
import 'package:state_provider/screens/home.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserNotifire()),
          FutureProvider(
            create: (_) => getProfileUserName(),
            initialData: "Loading Name...",
          ),
          StreamProvider(create: (_) => getSessionTime(), initialData: 0)
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color(0xFF2F5233)),
        primaryColor: Color(0xFF2F5233),
        backgroundColor: Color(0xFFDCDCDC),
      ),
      home: Home(),
    );
  }
}
