import 'package:caluc_project/cubits/buttom_cubit.dart';
import 'package:caluc_project/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const CalucolatorApp());
}

class CalucolatorApp extends StatefulWidget {
  const CalucolatorApp({super.key});

  @override
  State<CalucolatorApp> createState() => _CalucolatorAppState();
}

class _CalucolatorAppState extends State<CalucolatorApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtomCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
