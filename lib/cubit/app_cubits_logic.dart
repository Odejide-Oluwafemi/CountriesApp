import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:countries_app/cubit/app_cubits.dart';
import 'package:countries_app/cubit/app_cubits_states.dart';
import 'package:countries_app/pages/home_page.dart';

class AppCubitLogics extends StatefulWidget {
  AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogics();
}

class _AppCubitLogics extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(builder: ((context, state) {
        if (state is HomePageState) {
          return HomePage();
        } else if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Container(color: Colors.red);
        }
      })),
    );
  }
}
