import 'package:flutter/material.dart';
import 'package:template_flutter/utils/widgets/primary_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: PrimaryAppBar(title: 'Home Page'));
  }
}
