import 'package:flutter/material.dart';
import 'package:sick_child/ui/widgets/text_with_style.widget.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double top;
  final double left;
  final double height;
  final double width;
  const CustomButton(
      {Key? key,
      required this.title,
      this.top = 0,
      this.left = 0,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(
        top: top,
      ),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 227, 236, 243),
          borderRadius: BorderRadius.circular(50)),
      child: Center(
        child: TextWithStyle(
          data: title,
          color: Colors.white,
          size: 15.sp,
        ),
      ),
    );
  }
}
