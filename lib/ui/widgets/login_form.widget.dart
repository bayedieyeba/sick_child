import 'package:flutter/material.dart';
import 'package:sick_child/ui/widgets/custom_button.widget.dart';
import 'package:sick_child/ui/widgets/textFormField.widget.dart';
import 'package:sizer/sizer.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
              const CustomTextFormField(
                  hintext: "Nom d'utilisateur",
                  requiredValueText: "ce champ est obligatoir"),
              SizedBox(
                height: 5.h,
              ),
              const CustomTextFormField(
                hintext: "Mot de passe",
                requiredValueText: "ce champ est obligatoir",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/home");
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
}
