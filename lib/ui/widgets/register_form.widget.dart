import 'package:flutter/material.dart';
import 'package:sick_child/ui/widgets/custom_button.widget.dart';
import 'package:sick_child/ui/widgets/textFormField.widget.dart';
import 'package:sizer/sizer.dart';

class RegistredForm extends StatefulWidget {
  const RegistredForm({Key? key}) : super(key: key);

  @override
  State<RegistredForm> createState() => _RegistredFormState();
}

class _RegistredFormState extends State<RegistredForm> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
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
                    hintext: "nom", requiredValueText: "champ obligatoir"),
                SizedBox(
                  height: 5.h,
                ),
                const CustomTextFormField(
                    hintext: "email", requiredValueText: "champ obligatoir"),
                SizedBox(
                  height: 5.h,
                ),
                const CustomTextFormField(
                    hintext: "numéro téléphone",
                    requiredValueText: "champ obligatoir"),
                SizedBox(
                  height: 5.h,
                ),
                const CustomTextFormField(
                    hintext: "nom d'utilisateur",
                    requiredValueText: "champ obligatoir"),
                SizedBox(
                  height: 5.h,
                ),
                const CustomTextFormField(
                    hintext: "mot de passe",
                    requiredValueText: "champ obligatoir"),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, "/page-register");
                      },
                      child: CustomButton(
                        title: "Enregitrer",
                        height: 7.5.h,
                        width: 40.w,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
