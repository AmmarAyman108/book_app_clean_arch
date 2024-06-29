import 'package:book_app/core/utils/strings.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  const CustomTextField({super.key, this.controller, this.onSubmitted});
  final Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: onSubmitted,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        suffixIcon: const Icon(
          FontAwesomeIcons.magnifyingGlass,
          color: Colors.white,
          size: 20,
        ),
        hintText: AppStrings.textFieldHint,
        hintStyle: AppStyles.textStyle18.copyWith(
          color: Colors.white.withOpacity(.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(500),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(500),
          borderSide: const BorderSide(color: Colors.white, width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(500),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
      ),
    );
  }
}
