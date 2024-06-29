import 'package:book_app/core/utils/strings.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/search/presentation/manager/cubit/searchbook_cubit.dart';
import 'package:book_app/features/search/presentation/view/widgets/custom_text_field.dart';
import 'package:book_app/features/search/presentation/view/widgets/result_book_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewDetails extends StatelessWidget {
  final TextEditingController? controller = TextEditingController();
  SearchViewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text(
                AppStrings.searchAppBabTitle,
                style: AppStyles.textStyle25,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: controller,
                onSubmitted: (_) {
                  BlocProvider.of<SearchedBookCubit>(context)
                      .fetchSearchedBook(name: controller!.text);
                },
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                AppStrings.resultBooksTitle,
                style: AppStyles.textStyle20,
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                  child: CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                    ResultBookListView(
                      name: controller!.text,
                    )
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
