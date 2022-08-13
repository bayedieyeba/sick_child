import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sick_child/utils/app_color.dart';
import 'package:sizer/sizer.dart';

class NavigationLoginRegistration extends StatelessWidget {
  const NavigationLoginRegistration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5.w, right: 5.w),
      width: double.infinity,
      height: 60.sp,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey))),
      child: TabBar(
        indicatorColor: AppColor.primaryColor,
        indicatorWeight: 2,
        labelColor: AppColor.primaryColor,
        unselectedLabelColor: const Color.fromARGB(255, 227, 236, 243),
        labelStyle: GoogleFonts.poppins(fontSize: 15.sp),
        tabs: const [
          Tab(text: "Connexion"),
          Tab(
            text: "Inscription",
          ),
        ],
      ),
    );
  }
}
