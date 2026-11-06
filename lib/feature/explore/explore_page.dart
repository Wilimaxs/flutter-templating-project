import 'package:flutter/material.dart';
import 'package:template_flutter/utils/widgets/primary_appbar.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: PrimaryAppBar(title: 'Home Page'));
  }
}
