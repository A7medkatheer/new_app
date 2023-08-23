import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/Cubits/CounterCubit/counter_cubit.dart';
import 'package:newapp/Cubits/ReplaceUICubit/replace_ui_cubit.dart';

class CounterScreenWithCubit extends StatelessWidget {
  const CounterScreenWithCubit({super.key});

  @override
  Widget build(BuildContext context) {
    // sum(1,2,3);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      // CounterCubit().increment();

                      context.read<CounterCubit>().increment();
                    },
                    child: const Text("+")),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state) {
                      return Text(
                          context.read<CounterCubit>().counter.toString());
                    },
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterCubit>().decrement();
                    },
                    child: const Text("_"))
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            // TextField(
            //   decoration: InputDecoration(
            //       contentPadding: EdgeInsets.all(8),
            //       constraints: BoxConstraints()),
            // ),
            BlocBuilder<ReplaceUiCubit, ReplaceUiState>(
                builder: (context, state) {
              switch (state.runtimeType) {
                case ShowText:
                  return const Text("Hello We Are ITI");

                case ShowCubitImage:
                  return SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                        "https://pub.dev/packages/flutter_bloc/versions/8.1.3/gen-res/gen/190x190/logo.webp"),
                  );

                case ShowRedCircle:
                  return Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                  );

                default:
                  return const Text(" No Button Clicked");
              }

              // if (state is ShowText) {
              //   return Text("Hello We Are ITI");
              // } else if (state is ShowCubitImage) {
              //   return SizedBox(
              //     height: 100,
              //     width: 100,
              //     child: Image.network(
              //         "https://pub.dev/packages/flutter_bloc/versions/8.1.3/gen-res/gen/190x190/logo.webp"),
              //   );
              // } else if (state is ShowRedCircle) {
              //   return Container(
              //     height: 200,
              //     width: 200,
              //     decoration:
              //         BoxDecoration(shape: BoxShape.circle, color: Colors.red),
              //   );
              // } else {
              //   return Text(" No Button Clicked");
              // }
            }),

            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<ReplaceUiCubit>().showText();
                },
                child: const Text("Show text")),
            ElevatedButton(
                onPressed: () {
                  context.read<ReplaceUiCubit>().showCubitImage();
                },
                child: const Text("Show cubit image")),
            ElevatedButton(
                onPressed: () {
                  context.read<ReplaceUiCubit>().showRedCircle();
                },
                child: const Text("Show the red circle")),
            ElevatedButton(
                onPressed: () {
                  context.read<ReplaceUiCubit>().reset();
                },
                child: const Text("Reset"))
          ],
        ),
      ),
    );
  }
}



