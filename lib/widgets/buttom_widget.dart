import 'package:caluc_project/cubits/buttom_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtomWidget extends StatelessWidget {
  const ButtomWidget({
    super.key,
    required this.item,
  });
  final String item;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item == 'D' || item == 'C'
          ? Colors.blueGrey
          : item == "%" ||
                  item == "x" ||
                  item == "_" ||
                  item == "+" ||
                  item == "=" ||
                  item == '/'
              ? Colors.orange
              : Colors.red,
      clipBehavior: Clip.hardEdge,
      shape: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white24,
          ),
          borderRadius: BorderRadius.circular(100)),
      child: InkWell(
        onTap: () {
          if (item == "D") {
            BlocProvider.of<ButtomCubit>(context).deletelast();
          } else if (item == "C") {
            BlocProvider.of<ButtomCubit>(context).clear();
          } else if (item == "+" ||
              item == "_" ||
              item == "x" ||
              item == "/" ||
              item == "%") {
            BlocProvider.of<ButtomCubit>(context).addexpression(item);
          } else if (item != '=') {
            BlocProvider.of<ButtomCubit>(context).addnumber(item);
          } else {
            BlocProvider.of<ButtomCubit>(context).getresult();
          }
        },
        child: Center(
          child: Text(
            item,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 23,
            ),
          ),
        ),
      ),
    );
  }
}

List<String> Btn = [
  "D",
  "C",
  "%",
  "x",
  "7",
  "8",
  "9",
  "+",
  "4",
  "5",
  "6",
  "_",
  "1",
  "2",
  "3",
  '/',
  "0",
  ".",
  "00",
  "=",
];
Map<String, double> values = {
  "1": 1,
  "2": 2,
  "3": 3,
  "4": 4,
  "5": 5,
  "6": 6,
  "7": 7,
  "0": 0,
  "8": 8,
  "9": 9,
  "00": 0,
};
