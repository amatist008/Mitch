import 'package:flutter/material.dart';
import 'package:mitchtest/pages/first_page.dart';
import 'package:mitchtest/providers/ButtonStateProvider.dart';
import 'package:provider/provider.dart';


void main(){
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ButtonStateProvider()),
        ],
        child: MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super (key: key);
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}