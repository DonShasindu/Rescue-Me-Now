import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryRoundButton extends StatelessWidget {
  final VoidCallback? onClicked;
  final String text;
  final IconData? icon;
  final Color color;
  final Color textColor;

  const PrimaryRoundButton({
    super.key,
    this.onClicked,
    required this.text,
    this.icon,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      elevation: 0,
      onPressed: onClicked,
      minWidth: double.infinity,
      height: 42.h,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: color,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      disabledColor: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 4,
            child: Text(
              text,
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
              style: TextStyle(
                color: textColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          icon != null
              ? SizedBox(
                  width: 8.w,
                )
              : Container(),
          icon != null
              ? Icon(
                  icon,
                  color: Colors.white,
                  size: 22.sp,
                )
              : Container(),
        ],
      ),
    );
  }
}
