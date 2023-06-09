import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sowaste/core/themes/app_themes.dart';
import 'package:sowaste/data/services/data_center.dart';
import 'package:sowaste/data/services/local_data.dart';
import 'package:sowaste/routes/app_page.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DataCenter.AppFilePath = await LocalService.getFilePath;
  // check if this is the first time user have opened this app then show onboarding screen
  var response =
      await LocalService.readFile("${DataCenter.AppFilePath}/app.json");
  if (response == null) {
    LocalService.saveContent(
        {"isTheFirstTime": true}, "${DataCenter.AppFilePath}/app.json");
    DataCenter.isFirstTime = true;
  }
  // fetch all data from local and api
  DataCenter.doneQuizzesFolder =
      await LocalService.createFolderInAppDocDir("quizzes");
  await Future.wait([
    LocalService.getAllFileDoneQuiz(),
    DataCenter.fetchDictionary(),
    DataCenter.fetchAllQuestions(),
    DataCenter.fetchAllArticles(),
    DataCenter.fetchSavedTrashes(),
    DataCenter.fetchAllUserQuizzes(),
    DataCenter.fetchRecentTrashes(),
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute:
          DataCenter.isFirstTime ? AppRoutes.onboardingPage : AppRoutes.base,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
    );
  }
}
