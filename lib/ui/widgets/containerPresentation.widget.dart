import 'package:flutter/material.dart';
import 'package:sick_child/ui/widgets/text_with_style.widget.dart';
import 'package:sick_child/utils/app_color.dart';
import 'package:sizer/sizer.dart';

class ContainerPresentation extends StatelessWidget {
  const ContainerPresentation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWithStyle(
            data: "Cancérologie pédiatrique",
            color: AppColor.primaryColor,
            size: 15.sp,
            weigth: FontWeight.bold,
          ),
          SizedBox(
            height: 0.5.h,
          ),
          TextWithStyle(
            data: "La suivi des enfants atteints du cancer",
            color: const Color.fromARGB(255, 227, 236, 243),
            size: 15.sp,
          ),
        ],
      ),
    );
  }
}
