import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/Cubits/ChangeSelectedValue/change_selected_value_cubit.dart';
import 'package:newapp/Cubits/LoginCubit/login_cubit.dart';
import 'package:newapp/Cubits/RadioToggleCubit/radio_toggle_cubit.dart';
import 'package:newapp/Cubits/ShowHidePass/show_hide_password_cubit.dart';

// ignore: must_be_immutable
class Task8Answer extends StatelessWidget {
  Task8Answer({super.key});

  List<String> filterList = [
    "show ",
    "ya ",
    "show ",
    "hapipi ",
    "hapasoooo",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              BlocBuilder<ChangeSelectedValueCubit, ChangeSelectedValueState>(
                builder: (context, state) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < filterList.length; i++)
                          InkWell(
                            onTap: () {
                              context
                                  .read<ChangeSelectedValueCubit>()
                                  .changeIndex(i);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(4),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: context
                                              .read<ChangeSelectedValueCubit>()
                                              .selectedIndex ==
                                          i
                                      ? Colors.red
                                      : Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Text(filterList[i]),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 50,
              ),
              const Divider(
                color: Colors.black,
                thickness: 2,
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    BlocBuilder<ShowHidePasswordCubit, ShowHidePasswordState>(
                  builder: (context, state) {
                    return TextField(
                      obscureText:
                          context.read<ShowHidePasswordCubit>().isShown,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: context.read<ShowHidePasswordCubit>().isShown
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          onPressed: () {
                            context
                                .read<ShowHidePasswordCubit>()
                                .showHidePass();
                          },
                        ),
                        hintText: "Password",
                        // errorBorder: ,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 36, 4, 240), width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        // border: ,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        // border:
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Divider(
                color: Colors.black,
                thickness: 2,
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 300,
                child: BlocBuilder<RadioToggleCubit, RadioToggleState>(
                  builder: (context, state) {
                    return ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return RadioListTile(
                          value: index,
                          groupValue:
                              context.read<RadioToggleCubit>().currentValue,
                          onChanged: (value) {
                            context
                                .read<RadioToggleCubit>()
                                .toggleRadios(value);
                          },
                          title: Text("example ${index + 1}"),
                          subtitle: const Text("the end of the world"),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                  height: 100,
                  child: Center(child: BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return const CircularProgressIndicator();
                      } else if (state is LogingSuccess) {
                        return ElevatedButton(
                            onPressed: () {
                              context.read<LoginCubit>().logIn();
                            },
                            child: const Text("Login"));
                      } else {
                        return ElevatedButton(
                            onPressed: () {
                              context.read<LoginCubit>().logIn();
                            },
                            child: const Text("Login"));
                      }
                    },
                  ))),
              SizedBox(
                  height: 100,
                  child: Center(child: BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      if (state is registerLoading) {
                        return const CircularProgressIndicator();
                      } else {
                        return ElevatedButton(
                            onPressed: () {
                              context.read<LoginCubit>().register();
                            },
                            child: const Text("Register"));
                      }
                    },
                  )))
            ],
          ),
        ),
      ),
    );
  }
}
