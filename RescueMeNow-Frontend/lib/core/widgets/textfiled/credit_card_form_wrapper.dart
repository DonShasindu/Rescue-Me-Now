import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me_now/core/widgets/textfiled/common_text_field.dart';

class CreditCardFormWrapper extends StatelessWidget {
  const CreditCardFormWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CommonTextField(
          fieldName: 'Card Number',
          hintText: 'XXXX XXXX XXXX XXXX',
          textColor: Colors.white,
          cursorColor: Colors.black,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 150.w,
              child: const CommonTextField(
                textColor: Colors.white,
                cursorColor: Colors.black,
                fieldName: 'Expiry Date',
                hintText: 'MM/YY',
                keyboardType: TextInputType.datetime,
              ),
            ),
            SizedBox(
              width: 159.w,
              child: const CommonTextField(
                textColor: Colors.white,
                cursorColor: Colors.black,
                fieldName: 'CVV',
                hintText: 'XXX',
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
