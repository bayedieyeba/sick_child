// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sick_child/ui/widgets/custom_button.widget.dart';
import 'package:sick_child/utils/app_color.dart';
import 'package:sick_child/utils/style_form_text.dart';
import 'package:sick_child/utils/text_input_decoration.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String login = '';
  String password = '';
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Container(
          margin: EdgeInsets.all(5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                style: styleTextFormfield,
                decoration: TextInputDecoration.copyWith(
                    hintText: "Login",
                    labelText: "Login",
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 15.sp, color: AppColor.primaryColor),
                    contentPadding: EdgeInsets.only(
                        top: 10.sp, bottom: 10.sp, left: 20.sp)),
                onChanged: (val) => login = val,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "la valeur ne doit pas être nule";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              TextFormField(
                style: styleTextFormfield,
                decoration: TextInputDecoration.copyWith(
                    hintText: "Login",
                    labelText: "Login",
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 15.sp, color: AppColor.primaryColor),
                    contentPadding: EdgeInsets.only(
                        top: 10.sp, bottom: 10.sp, left: 20.sp)),
                onChanged: (val) => password = val,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "la valeur ne doit pas être nule";
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      _login(login, password);
                    },
                    child: CustomButton(
                      title: "Connexion",
                      height: 7.5.h,
                      width: 40.w,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _login(
    String login,
    String password,
  ) async {
    try {
      var response = await http.post(
        Uri.parse('http://10.0.2.2:5000/api/user/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'login': login,
          'password': password,
        }),
      );
      if (response.statusCode == 200) {
        Navigator.pop(context);
        Navigator.pushNamed(context, "/home");
      }
    } catch (e) {
      print(e);
    }
  }
}
