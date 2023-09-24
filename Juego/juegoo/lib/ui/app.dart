import 'package:flutter/material.dart';
import 'package:juegoo/ui/triqui/jugar.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true
      ),
      title: 'Triki App',
      home: const Jueguito(),
    );
  }
}
