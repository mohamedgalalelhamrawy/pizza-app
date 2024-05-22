import 'package:flutter/material.dart';

class MytextField extends StatelessWidget {
  const MytextField(
      {super.key,
      this.keyboardtype,
      required this.obsecuretext,
      this.onchange,
      this.ontap,
      this.validation,
      this.errmessage,
      this.hinttext,
      this.prifixicon,
      this.suffixIcon,
      this.focusNode,
      required this.controller});

  final TextInputType? keyboardtype;
  final bool obsecuretext;
  final Function(String)? onchange;
  final Function()? ontap;
  final String? Function(String?)? validation;
  final String? errmessage;
  final String? hinttext;
  final Widget? prifixicon;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardtype,
      obscureText: obsecuretext,
      onChanged: onchange,
      onTap: ontap,
      validator: validation,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
          errorText: errmessage,
          hintText: hinttext,
          prefixIcon: prifixicon,
          suffixIcon: suffixIcon,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.secondary)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.transparent))),
    );
  }
}
