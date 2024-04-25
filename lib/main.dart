import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quadleo_test/controller/api_provider.dart';
import 'package:quadleo_test/view/customers_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CustomerProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CustomerListScreen(),
      ),
    );
  }
}

