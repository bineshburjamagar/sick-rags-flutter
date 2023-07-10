import 'package:flutter/material.dart';

import '../../config/config.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController? controller;
  final bool isPassword;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool isRequired;
  final EdgeInsets? contentPadding;
  final double? borderRadius;
  final bool addSuffix;
  final void Function()? addSuffixOntap;
  final void Function(String?)? onSaved;
  final int? maxLines;
  final bool enable;
  const CustomTextField({
    Key? key,
    required this.labelText,
    this.controller,
    this.isPassword = false,
    this.validator,
    this.keyboardType,
    this.hintText,
    this.isRequired = false,
    this.contentPadding,
    this.borderRadius,
    this.addSuffix = false,
    this.enable = true,
    this.onSaved,
    this.addSuffixOntap,
    this.maxLines,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText.isNotEmpty) ...[
          Row(
            children: [
              Text(
                widget.labelText,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: AppColors.greyColor,
                ),
              ),
              widget.isRequired
                  ? const Text(
                      ' *',
                      style: TextStyle(color: Colors.red),
                    )
                  : const SizedBox.shrink()
            ],
          ),
          const SizedBox(
            height: 5,
          )
        ],
        TextFormField(
          enabled: widget.enable,
          textAlign: TextAlign.start,
          keyboardType: widget.keyboardType,
          obscureText: (widget.isPassword) ? _showPassword : false,
          controller: widget.controller,
          autofocus: false,
          validator: widget.validator,
          cursorColor: AppColors.primaryColor,
          style: const TextStyle(
              color: AppColors.primaryColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w500),
          textInputAction: TextInputAction.next,
          onSaved: widget.onSaved,
          maxLines: widget.maxLines ?? 1,
          decoration: InputDecoration(
            prefixStyle:
                const TextStyle(color: AppColors.primaryColor, fontSize: 16),
            fillColor: Colors.white10,
            filled: true,
            errorMaxLines: 2,
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.0),
            ),
            hintText: widget.hintText,
            hintStyle: const TextStyle(
                color: AppColors.hintTextColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w400),
            suffixIcon: (widget.isPassword
                ? InkWell(
                    onTap: () => setState(() => _showPassword = !_showPassword),
                    child: _showPassword
                        ? const Icon(
                            Icons.visibility_off_outlined,
                            size: 18.0,
                            color: Colors.grey,
                          )
                        : const Icon(
                            Icons.visibility_outlined,
                            size: 18.0,
                            color: Colors.grey,
                          ),
                  )
                : widget.addSuffix
                    ? InkWell(
                        onTap: widget.addSuffixOntap,
                        child: const Icon(Icons.add),
                      )
                    : null),
            contentPadding: widget.contentPadding ??
                const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
          ),
        ),
      ],
    );
  }
}
