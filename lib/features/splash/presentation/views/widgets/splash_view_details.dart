import 'package:book_app/config/routers/routers.dart';
import 'package:book_app/core/utils/assets.dart';
import 'package:book_app/core/utils/strings.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewDetails extends StatefulWidget {
  const SplashViewDetails({super.key});

  @override
  State<SplashViewDetails> createState() => _SplashViewDetailsState();
}

class _SplashViewDetailsState extends State<SplashViewDetails> {
  @override
  void initState() {
    navigateToHomeView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Image.asset(
              AppAssets.logo,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Center(
              child: Text(
            AppStrings.splashText,
            style: AppStyles.textStyle23,
          )),
        ],
      ),
    );
  }

  Future navigateToHomeView() async {
    await Future.delayed(
      const Duration(seconds: 5),
      () => GoRouter.of(context).go(AppRouters.homeView),
    );
  }
}
