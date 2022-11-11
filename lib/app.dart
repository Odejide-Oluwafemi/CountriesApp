import 'package:countries_app/internals/data_service.dart';
import 'package:countries_app/misc/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countries_app/cubit/app_cubits.dart';
import 'package:countries_app/cubit/app_cubits_logic.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Explore",
      debugShowCheckedModeBanner: false,
      theme: currentTheme.lightTheme,
      darkTheme: currentTheme.darkTheme,
      themeMode: currentTheme.themeMode(),
      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(DataService()),
        child: AppCubitLogics(),
      ),
    );
  }
}
