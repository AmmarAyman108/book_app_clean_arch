import 'package:book_app/book_app.dart';
import 'package:book_app/core/utils/colors.dart';
import 'package:book_app/core/utils/constants.dart';
import 'package:book_app/features/book/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  setUIOverlayStyle();
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  runApp(const BookApp());
}

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter<BookEntity>(BookEntityAdapter());
  await Hive.openBox<BookEntity>(AppSettings.kFeaturedBooksBox);
  await Hive.openBox<BookEntity>(AppSettings.knNewestBooksBox);
}

void setUIOverlayStyle() {
  return SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColor.primaryColor,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColor.primaryColor,
      systemNavigationBarDividerColor: AppColor.primaryColor));
}
