import 'package:flutter/material.dart';
import 'package:flutter_react_demo/src/routing/app_router.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('An error occured',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32,),
              ElevatedButton(
                onPressed: () => context.goNamed(AppRoute.home.name),
                child: Text('Go home'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
