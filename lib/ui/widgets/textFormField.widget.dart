import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sick_child/utils/app_color.dart';
import 'package:sick_child/utils/style_form_text.dart';
import 'package:sick_child/utils/text_input_decoration.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintext;
  final String requiredValueText;

  const CustomTextFormField(
      {Key? key, required this.hintext, required this.requiredValueText})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: styleTextFormfield,
      decoration: TextInputDecoration.copyWith(
          hintText: widget.hintext,
          labelText: widget.hintext,
          hintStyle: GoogleFonts.poppins(
              fontSize: 15.sp, color: AppColor.primaryColor),
          contentPadding:
              EdgeInsets.only(top: 10.sp, bottom: 10.sp, left: 20.sp)),
      validator: (value) {
        if (value!.isEmpty) {
          return widget.requiredValueText;
        }
        return null;
      },
      onSaved: (value) {},
    );
  }
}
