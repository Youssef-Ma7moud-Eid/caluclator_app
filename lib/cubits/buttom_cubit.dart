import 'package:caluc_project/cubits/buttom_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtomCubit extends Cubit<Allstate> {
  ButtomCubit() : super(Calculate());
  String appear = "";
  double result = 0;
  String introval = "";
  String exp = "";
  bool firstexp = false;

  void addnumber(String value) {
    if (appear != '') {
      appear += value;
    } else {
      appear = value;
    }
    emit(Calculate());
  }

  void addexpression(String ex) {
    if (appear.isEmpty ||
        (appear.length >= 1 &&
            appear[appear.length - 1] != "+" &&
            appear[appear.length - 1] != "-" &&
            appear[appear.length - 1] != "x" &&
            appear[appear.length - 1] != "/" &&
            appear[appear.length - 1] != "%")) {
      if (ex == '_') {
        ex = '-';
      }

      appear += ex;
      emit(Calculate());
    } else {
      emit(Invaildinput());
      appear = "";
      result = 0;
      exp = "";
      firstexp = false;
      introval = "";
    }
  }

  void getresult() {
    if (appear[appear.length - 1] != "+" &&
        appear[appear.length - 1] != "-" &&
        appear[appear.length - 1] != "x" &&
        appear[appear.length - 1] != "/" &&
        appear[appear.length - 1] != "%") {
      for (int i = 0; i < appear.length; i++) {
        if (appear[i] != '+' &&
            appear[i] != '-' &&
            appear[i] != 'x' &&
            appear[i] != '/' &&
            appear[i] != '%') {
          introval += appear[i];
        } else {
          if (exp != "") {
            if (exp == "+") {
              result += double.parse(introval);
            } else if (exp == "-") {
              result -= double.parse(introval);
            } else if (exp == "x") {
              result *= double.parse(introval);
            } else if (exp == "/") {
              result /= double.parse(introval);
            } else if (exp == "%") {
              result %= double.parse(introval);
            }
            exp = appear[i];
            introval = "";
          } else {
            if (introval == "" && appear[i] == '-') {
              firstexp = true;
            } else if (introval.length >= 1) {
              exp = appear[i];
              result = (double.parse(introval));
              if (firstexp) {
                result *= -1;
                firstexp = false;
              }
              introval = "";
            }
          }
        }
      }
      if (result == 0) {
        if (exp == "") {
          result = (double.parse(introval));
        } else {
          if (exp == "+") {
            result += double.parse(introval);
          } else if (exp == "-") {
            result -= double.parse(introval);
          } else if (exp == "x") {
            result *= double.parse(introval);
          } else if (exp == "/") {
            result /= double.parse(introval);
          } else if (exp == "%") {
            result %= double.parse(introval);
          }
          exp = "";
          introval = "";
        }
        if (firstexp) {
          result *= -1;
          firstexp = false;
        }
        introval = "";
        exp = "";
      } else if (exp != "" && introval != "") {
        if (exp == "+") {
          result += double.parse(introval);
        } else if (exp == "-") {
          result -= double.parse(introval);
        } else if (exp == "x") {
          result *= double.parse(introval);
        } else if (exp == "/") {
          result /= double.parse(introval);
        } else if (exp == "%") {
          result %= double.parse(introval);
        }
        exp = "";
        introval = "";
      }
      appear = result.toString();
      if (result == -0.0) {
        result = 0.0;
      }
      emit(Resullt());
    } else {
      emit(Invaildinput());
      appear = "";
      result = 0;
      exp = "";
      firstexp = false;
      introval = "";
    }
  }

  void clear() {
    appear = "";
    result = 0;
    exp = "";
    firstexp = false;
    introval = "";
    emit(Calculate());
  }

  void deletelast() {
    if (appear.length >= 1) {
      appear = appear.substring(0, appear.length - 1);
      if (appear.isEmpty) {
        appear = "";
      }
    }
    if (introval.length >= 1) {
      introval = introval.substring(0, introval.length - 1);
    }
    if (exp != "") {
      exp = "";
    }
    emit(Calculate());
  }
}
