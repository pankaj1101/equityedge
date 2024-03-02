import 'package:equityedge/res/colors/AppColors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isDropdown;
  final VoidCallback? onTap;

  const CustomTextFormField({
    super.key,
    required this.hint,
    required this.controller,
    required this.isDropdown,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final outlinedInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Colors.grey.shade400),
    );

    return TextFormField(
      controller: controller,
      readOnly: isDropdown,
      onTap: onTap,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.normal,
          ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.lightGrey,
              fontWeight: FontWeight.normal,
            ),
        suffixIcon: isDropdown ? Icon(Icons.keyboard_arrow_down_rounded) : null,
        border: outlinedInputBorder,
        enabledBorder: outlinedInputBorder,
        focusedBorder: outlinedInputBorder,
        errorBorder: outlinedInputBorder,
      ),
    );
  }
}
