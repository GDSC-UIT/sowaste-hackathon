import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sowaste/core/themes/app_themes.dart';
import 'package:sowaste/data/services/data_center.dart';
import 'package:sowaste/modules/env_news/env_news_controller.dart';

import '../../../core/themes/app_colors.dart';
import '../widgets/card_big_news.dart';
import '../widgets/news_item.dart';

class EnvironmentNewsOverviewScreen extends StatelessWidget {
  EnvironmentNewsOverviewScreen({
    super.key,
  });
  final EnvironmentNewsController _environmentNewsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: AppColors.background,
        title: Text(
          "Environment News",
          style: CustomTextStyle.sub(AppColors.secondary),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: AppColors.secondary,
                    ),
                    onPressed: () => {Get.back()},
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 60,
                            offset: Offset(0, 4),
                            color: AppColors.dropShadow,
                          ),
                        ],
                      ),
                      child: TextField(
                        onChanged: (value) {
                          if (value == "") {
                            _environmentNewsController.showBigCard.value = true;
                          } else {
                            _environmentNewsController.showBigCard.value =
                                false;
                          }
                          _environmentNewsController.filterArticle();
                        },
                        controller:
                            _environmentNewsController.searchInput.value,
                        decoration: InputDecoration.collapsed(
                          hintText: "Find your interested news here...",
                          hintStyle: CustomTextStyle.normal(AppColors.info),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: context.height * 0.045),
            Obx(() => _environmentNewsController.showBigCard.value
                ? CardBigNews(
                    article: DataCenter.news[DataCenter.news.length - 1])
                : Container()),
            const SizedBox(height: 24),
            Container(
              constraints: BoxConstraints(maxHeight: context.height * 0.8),
              child: Obx(
                () => ListView.separated(
                  itemBuilder: (_, index) => NewsItem(
                    article: _environmentNewsController.news[index],
                  ),
                  separatorBuilder: (_, __) => const SizedBox(
                    height: 16,
                  ),
                  itemCount: _environmentNewsController.news.length,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}