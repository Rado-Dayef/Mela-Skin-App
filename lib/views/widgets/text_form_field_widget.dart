import 'package:flutter/material.dart';
import 'package:mela_skin/constants/colors.dart';
import 'package:mela_skin/constants/extensions.dart';

class TextFormFieldWidget extends StatelessWidget {
  final bool filled;
  final bool obscure;
  final int maxLines;
  final int minLines;
  final bool readOnly;
  final int? maxLength;
  final bool autofocus;
  final double padding;
  final String? initVal;
  final TextStyle? style;
  final String? labelName;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? placeholder;
  final VoidCallback? onClick;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final TextEditingController? textController;
  final void Function(String)? onFieldSubmitted;

  const TextFormFieldWidget({
    super.key,
    this.style,
    this.onClick,
    this.onSaved,
    this.initVal,
    this.maxLength,
    this.onChanged,
    this.validator,
    this.labelName,
    this.prefixIcon,
    this.suffixIcon,
    this.placeholder,
    this.padding = 0,
    this.maxLines = 1,
    this.minLines = 1,
    this.keyboardType,
    this.textController,
    this.filled = false,
    this.obscure = false,
    this.textInputAction,
    this.onFieldSubmitted,
    this.readOnly = false,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: padding,
        ),
        child: TextFormField(
          onTap: onClick,
          onSaved: onSaved,
          minLines: minLines,
          readOnly: readOnly,
          maxLines: maxLines,
          obscureText: obscure,
          onChanged: onChanged,
          maxLength: maxLength,
          validator: validator,
          autofocus: autofocus,
          controller: textController,
          keyboardType: keyboardType,
          cursorColor: AppColors.darkBlueColor,
          onFieldSubmitted: onFieldSubmitted,
          textAlignVertical: TextAlignVertical.center,
          style: style ??
              Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.darkBlueColor,
                  ),
          textInputAction: textInputAction ?? TextInputAction.next,
          onTapOutside: (PointerDownEvent event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(
            counterStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 0,
                ),
            label: labelName == null
                ? null
                : Text(
                    labelName.toString(),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.darkBlueColor,
                        ),
                  ),
            fillColor: AppColors.darkBlueColor,
            filled: filled,
            hintText: placeholder,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.darkBlueColor.withOpacity(0.5),
                ),
            labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.darkBlueColor,
                ),
            border: _outlineInputBorderBlue,
            errorBorder: _outlineInputBorderRed,
            prefixIconColor: AppColors.whiteColor,
            suffixIconColor: AppColors.whiteColor,
            focusedBorder: _outlineInputBorderBlue,
            enabledBorder: _outlineInputBorderBlue,
            disabledBorder: _outlineInputBorderBlue,
            focusedErrorBorder: _outlineInputBorderRed,
            errorStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.redColor,
                  fontSize: 10,
                ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder get _outlineInputBorderRed => OutlineInputBorder(
        borderRadius: 15.borderRadiusAll,
        borderSide: const BorderSide(
          color: AppColors.redColor,
        ),
      );

  OutlineInputBorder get _outlineInputBorderBlue => OutlineInputBorder(
        borderRadius: 15.borderRadiusAll,
        borderSide: const BorderSide(
          color: AppColors.darkBlueColor,
        ),
      );
}
