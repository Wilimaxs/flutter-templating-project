import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_flutter/feature/explore/explore_controller.dart';
import 'package:template_flutter/feature/explore/widgets/explore_item_card.dart';
import 'package:template_flutter/utils/theme/app_spacing.dart';
import 'package:template_flutter/utils/widgets/primary_appbar.dart';

class ExplorePage extends GetView<ExploreController> {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(title: 'Explore'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.large),
        child: ExploreItemCard(
          author: controller.author,
          title: controller.title,
          description: controller.description,
          imageUrl: controller.imageUrl,
          readingTime: controller.readingTime,
          readerCount: controller.readerCount,
        ),
      ),
    );
  }
}
