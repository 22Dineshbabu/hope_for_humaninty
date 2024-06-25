import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hope_for_humaninty/Models/signup_details.dart';
import 'package:hope_for_humaninty/validate_fields.dart';

class FormFieldLayout extends StatelessWidget {
  const FormFieldLayout({
    required this.isSame,
    required this.title,
    required this.controller,
    required this.hintText,
    required this.isObsecured,
    required this.passwordVisibleIcon,
    this.signupDetails = const [],
    required this.focusNode,
    super.key,
  });

  final String title;
  final String hintText;
  final TextEditingController controller;
  final Widget? passwordVisibleIcon;
  final bool isObsecured;
  final TextEditingController isSame;
  final List<SignupDetails> signupDetails;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: const Color.fromRGBO(111, 111, 111, 1),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          focusNode: focusNode,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            return ValidateFields(
              isSame: isSame.text,
              field: controller.text,
              value: value,
              type: title,
              signupDetails: signupDetails,
            ).validateType();
          },
          textAlignVertical: TextAlignVertical.center,
          controller: controller,
          obscureText: isObsecured,
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: const Color.fromRGBO(111, 111, 111, 1),

            // backgroundColor: const Color.fromARGB(255, 255, 127, 127),
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle:
                const TextStyle(color: Color.fromARGB(255, 175, 175, 175)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            errorMaxLines: 5,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 16, 136, 0),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            errorStyle: GoogleFonts.poppins(
              fontSize: 11.5,
            ),
            filled: true,
            fillColor: const Color.fromARGB(255, 240, 240, 240),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 0,
                color: Color.fromARGB(255, 206, 206, 206),
              ),
            ),
            suffixIcon: passwordVisibleIcon,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
