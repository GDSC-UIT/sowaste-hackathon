import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sowaste/data/models/article.dart';
import 'package:sowaste/data/services/data_center.dart';

import '../../routes/app_routes.dart';

class EnvironmentNewsController extends GetxController {
  Rx<TextEditingController> searchInput = TextEditingController().obs;

  RxList<Article> news = <Article>[].obs;
  RxBool showBigCard = true.obs;
  Rx<Article> currentArticle = Article(
          id: "",
          title: "",
          shortDescription: "",
          source: "",
          createAt: DateTime.now(),
          displayImage: "")
      .obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    if (DataCenter.news.isNotEmpty) {
      news.value = [...DataCenter.news];
    }
    super.onInit();
  }

  void filterArticle() {
    news.value = DataCenter.news
        .where((article) =>
            article.title.toLowerCase().contains(searchInput.value.text))
        .toList();
  }

  Future<void> getDetailArticle(Article article) async {
    isLoading.value = true;
    Get.toNamed(AppRoutes.detailNewsPage, arguments: article.id);
    currentArticle.value = await Article.getArticle(article.id);
    isLoading.value = false;
  }
}
