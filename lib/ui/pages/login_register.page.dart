import 'package:flutter/material.dart';
import 'package:sick_child/ui/widgets/containerPresentation.widget.dart';
import 'package:sick_child/ui/widgets/login_form.widget.dart';
import 'package:sick_child/ui/widgets/navigation.widget.dart';
import 'package:sick_child/ui/widgets/register_form.widget.dart';
import 'package:sizer/sizer.dart';

class LoginRegisterPage extends StatelessWidget {
  const LoginRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            height: 100.h,
            width: 100.w,
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                const ContainerPresentation(),
                SizedBox(
                  height: 0.5.h,
                ),
                const NavigationLoginRegistration(),
                SizedBox(
                  height: 2.h,
                ),
                const Flexible(
                  child: TabBarView(
                    children: [
                      LoginForm(),
                      RegistredForm(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
