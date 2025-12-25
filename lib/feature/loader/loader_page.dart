import 'package:flutter/material.dart';
import 'package:ppob_koperasi_payment/utils/theme/app_color.dart';

class LoaderPage extends StatelessWidget {
  const LoaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primaryContainerLight,
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.all(24.0),
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
