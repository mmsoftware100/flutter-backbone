import 'package:flutter/cupertino.dart';

import '../../domain/entities/app_language.dart';

class LanguageProvider extends ChangeNotifier{
  List<AppLanguage> appLanguageList = [
    AppLanguage(name: "English", code: "en", flag: "https://fumoinvest.org/img/eng_flag.png"),
    AppLanguage(name: "China", code: "ch", flag: "https://fumoinvest.org/img/ch_flag.png"),
    AppLanguage(name: "Japan", code: "jp", flag: "https://fumoinvest.org/img/jp_flag.png"),
  ];

  AppLanguage appLanguage  = AppLanguage(name: "English", code: "en", flag: "https://fumoinvest.org/img/eng_flag.png");

  void setAppLanguage(AppLanguage appLanguageUpdate){
    appLanguage = appLanguageUpdate;
    notifyListeners();
  }
}