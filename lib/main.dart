import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loginpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => SplashScreenBloc(),
        child: SplashScreen(),
      ),
    );
  }
}

class SplashScreenBloc extends Cubit<bool> {
  SplashScreenBloc() : super(false);

  void showSplash() {
    emit(true);
    Timer(Duration(seconds: 5), () {
      emit(false);
    });
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SplashScreenBloc>(context);
    bloc.showSplash();

    return BlocBuilder<SplashScreenBloc, bool>(
      builder: (context, showSplash) {
        if (showSplash) {
          return Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/logo.png")
                ),
              ),
            )
          );
        } else {
          // Navigate to the next screen after splash
          return LoginPage(); // Implement your next screen here
        }
      },
    );
  }
}

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      body: Center(
        child: Text('Welcome to the next screen!'),
      ),
    );
  }
}
