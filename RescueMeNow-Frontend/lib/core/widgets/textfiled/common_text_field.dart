import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final String? hintText;
  final String? fieldName;
  final bool isRequired;
  final bool isPassword;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final Color textColor;
  final Color cursorColor;
  final Widget? prefixIcon; // New property for prefix icon
  final double? fontSize;
  final int? maxLines;
  final bool? enabled;

  const CommonTextField({
    super.key,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.onSaved,
    this.onChanged,
    this.hintText,
    this.fieldName,
    this.isRequired = false,
    this.isPassword = false,
    this.suffix,
    this.validator,
    required this.textColor,
    required this.cursorColor,
    this.prefixIcon, // Initialize prefix icon
    this.fontSize,
    this.maxLines = 1,
    this.enabled = true,
  });

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: Text(
            (widget.fieldName ?? "") + (widget.isRequired == true ? " *" : ""),
            style: TextStyle(
              fontSize: widget.fontSize ?? 16.sp,
              color: Colors.green,
            ),
          ),
        ),
        SizedBox(
          height: 50.h,
          child: TextFormField(
            controller: widget.controller,
            enabled: widget.enabled,
            maxLines: widget.maxLines,
            keyboardType: widget.keyboardType,
            textInputAction: TextInputAction.next,
            cursorColor: widget.cursorColor,
            onSaved: widget.onSaved,
            onChanged: widget.onChanged,
            validator: widget.validator,
            decoration: InputDecoration(
              prefixIcon: widget.prefixIcon, // Add prefix icon
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.r),
              ),
              filled: true,
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: widget.fontSize ?? 16.sp, // Set font size
              ),
              hintText: widget.hintText,
              fillColor: widget.textColor,
              isDense: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              suffixIcon: widget.isPassword == true
                  ? _getTogglePwdButton()
                  : widget.suffix,
              suffixIconColor: Colors.black,
            ),
            obscureText: (widget.isPassword && !isPasswordVisible),
          ),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }

  _getTogglePwdButton() {
    return GestureDetector(
      onTap: _showHidePwd,
      child: Icon(isPasswordVisible
          ? Icons.visibility_outlined
          : Icons.visibility_off_outlined),
    );
  }

  _showHidePwd() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }
}
