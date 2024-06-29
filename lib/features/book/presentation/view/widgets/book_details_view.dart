import 'package:book_app/core/utils/strings.dart';
import 'package:book_app/features/book/presentation/view/widgets/custom_app_bar.dart';
import 'package:book_app/features/book/presentation/view/widgets/featured_books_ist_bloc_builder.dart';
import 'package:book_app/features/book/presentation/view/widgets/newest_books_list_bloc_builder.dart';
import 'package:flutter/material.dart';

class BooksDetailsView extends StatelessWidget {
  const BooksDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(child: CustomAppBar()),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(child: FeaturedBooksListBlocBuilder()),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 40,
                ),
              ),
              SliverToBoxAdapter(
                child: Text(
                  AppStrings.newestBooksTitle,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              NewestBooksListBlocBuilder()
            ],
          ),
        ),
      ),
    );
  }
}
