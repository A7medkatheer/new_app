import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/Cubits/ChangeSelectedValue/change_selected_value_cubit.dart';
import 'package:newapp/Cubits/CounterCubit/counter_cubit.dart';
import 'package:newapp/Cubits/LoginCubit/login_cubit.dart';
import 'package:newapp/Cubits/RadioToggleCubit/radio_toggle_cubit.dart';
import 'package:newapp/Cubits/ReplaceUICubit/replace_ui_cubit.dart';
import 'package:newapp/Cubits/ShowHidePass/show_hide_password_cubit.dart';
import 'package:newapp/StateManagement/counter_screen.dart';
import 'package:newapp/StateManagement/counter_screen_with_cubit.dart';
import 'package:newapp/StateManagement/task8.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(
          create: (BuildContext context) => CounterCubit(),
        ),
        BlocProvider<ReplaceUiCubit>(
          create: (BuildContext context) => ReplaceUiCubit(),
        ),
        BlocProvider<ChangeSelectedValueCubit>(
          create: (BuildContext context) => ChangeSelectedValueCubit(),
        ),
        BlocProvider<ShowHidePasswordCubit>(
          create: (BuildContext context) => ShowHidePasswordCubit(),
        ),
        BlocProvider<RadioToggleCubit>(
          create: (BuildContext context) => RadioToggleCubit(),
        ),
        BlocProvider<LoginCubit>(
          create: (BuildContext context) => LoginCubit(),
        ),
      ],
      child: MaterialApp(
          // Cupertino App
          title: 'app',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: CounterScreenWithCubit()

          // OurFirstScreen(
          //   title: 'Flutter Demo Home Page',
          // ),
          ),
    );
  }
}
