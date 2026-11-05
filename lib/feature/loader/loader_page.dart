import 'package:flutter/material.dart';

class LoaderPage extends StatelessWidget {
  const LoaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.all(24.0),
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
