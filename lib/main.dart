import 'package:bugloos_player/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bloc/counter_bloc.dart' as bloc;



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>bloc.ManagePageState()),
      ],
      child: MaterialApp(
          //Disable debug banner for testing
          debugShowCheckedModeBanner: false,
          title: 'Bugloos Player',
          theme: ThemeData(),
          home: const MainScreen()
      ),
    );
  }
}
