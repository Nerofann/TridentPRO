import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tridentpro/src/components/colors/default.dart';
import 'package:tridentpro/src/helpers/validator/email_validator.dart';

class VoidTextField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final String? fieldName;
  final bool? readOnly;
  final Function()? onPressed;
  final TextEditingController? controller;
  const VoidTextField({super.key, this.hintText, this.labelText, this.controller, this.readOnly, this.fieldName, this.onPressed});

  @override
  State<VoidTextField> createState() => _VoidTextFieldState();
}

class _VoidTextFieldState extends State<VoidTextField> {
  RxBool isEmail = false.obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        readOnly: true,
        onTap: widget.onPressed,
        controller: widget.controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: CustomColor.defaultColor,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Mohon isikan ${widget.fieldName}';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: GoogleFonts.inter(
            color: CustomColor.textThemeDarkSoftColor,
            fontSize: 14
          ),
          labelText: widget.labelText,
          labelStyle: const TextStyle(color: CustomColor.textThemeDarkSoftColor),
          filled: false,
          suffixIcon: Icon(Icons.keyboard_arrow_down, color: Colors.black54,),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: CustomColor.defaultColor
            )
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: CustomColor.textThemeDarkSoftColor
            )
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: CustomColor.textThemeDarkSoftColor
              )
            )
          ),
          onChanged: (value) {
            if(validateEmailBool(value) == true){
              isEmail(true);
            }else{
              isEmail(false);
            }
          },
        ),
    );
  }
}