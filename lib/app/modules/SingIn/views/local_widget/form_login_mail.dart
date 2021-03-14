import 'package:finanzas_personales/app/utils/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class FormLoginBuilderMail extends StatelessWidget {
  final String name;

  const FormLoginBuilderMail({
    Key key,
    @required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      style: Get.theme.textTheme.bodyText2,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.mail_outline,
          color: Palette.iconColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.textColor1),
          borderRadius: BorderRadius.all(Radius.circular(35.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.textColor1),
          borderRadius: BorderRadius.all(Radius.circular(35.0)),
        ),
        contentPadding: EdgeInsets.all(10),
        hintText: "info@demouri.com",
        hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context, errorText: 'Campo Obligatorio'),
        FormBuilderValidators.email(context,
            errorText: 'Debe ser un mail valido'),
      ]),
    );
  }
}
