import 'package:caluc_project/cubits/buttom_cubit.dart';
import 'package:caluc_project/cubits/buttom_cubit_state.dart';
import 'package:caluc_project/widgets/buttom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ButtomCubit, Allstate>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black.withOpacity(0.9),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 280,
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 22),
                      child: Text(
                        state is Calculate
                            ? BlocProvider.of<ButtomCubit>(context).appear
                            : state is Resullt
                                ? ' ${BlocProvider.of<ButtomCubit>(context).result}'
                                : 'Error',
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 55,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                    child: SizedBox(
                      height: 435,
                      child: GridView.builder(
                          itemCount: Btn.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 12,
                            childAspectRatio: 1.1,
                          ),
                          itemBuilder: (context, index) {
                            return ButtomWidget(
                              item: Btn[index],
                            );
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
