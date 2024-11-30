
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

const colorRed = Color.fromRGBO(231, 28, 36, 1);

const colorDark = Color.fromRGBO(136, 28, 32, 1);

const colorGreen = Color.fromRGBO(33, 191, 115, 1);

const colorBlue = Color.fromRGBO(52, 152, 219, 1.0);

const colorOrange = Color.fromRGBO(230, 126, 34, 1.0);

const colorWhite = Color.fromRGBO(255, 255, 255, 1.0);

const colorDarkBlue = Color.fromRGBO(44, 62, 80, 1.0);

const colorLightGray = Color.fromRGBO(135, 142, 150, 1.0);

const colorLight = Color.fromRGBO(211, 211, 211, 1.0);

PinTheme App0TPStyle() {
  return PinTheme(
    inactiveColor: colorLight,
    inactiveFillColor: colorWhite,
    selectedColor: colorGreen,
    activeColor: colorWhite,
    selectedFillColor: colorGreen,
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(5),
    fieldHeight: 50,
    borderWidth: 0.5,
    fieldWidth: 40,
    activeFillColor: Colors.white,
  );
}

TextStyle Head1Text(textColor) {
  return TextStyle(
    color: textColor,
    fontSize: 28,
    fontFamily: 'poppins',
    fontWeight: FontWeight.w700,
  );
}

TextStyle Head6Text(textColor) {
  return TextStyle(
      color: textColor,
      fontSize: 16,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w400);
}


TextStyle Head7Text(textColor) {
  return TextStyle(
      color: textColor,
      fontSize: 13,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w400
  );
}

InputDecoration AppInputDecoration(label) {
  return InputDecoration(
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: colorGreen, width: 1),
      ),

// Outline InputBorder

      fillColor: colorWhite,
      filled: true,
      contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: colorWhite, width: 0.0),
      ),

// Outline InputBorder

      border: const OutlineInputBorder(),
      labelText: label);
// InputDecoration
}

DecoratedBox AppDropDownStyle(child) {
  return DecoratedBox(
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.white, width: 1),
    ),
    child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30), child: child),
  ); // DecoratedBox
}

SvgPicture ScreenBackground(context) {
  return SvgPicture.asset(
    'assets/images/background.svg',
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.cover,
  );
}

ButtonStyle AppButtonStyle() {
  return ElevatedButton.styleFrom(
      elevation: 1,
      padding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)));
}

TextStyle ButtonTextStyle() {
  return const TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontFamily: 'poppins',
    fontWeight: FontWeight.w400,
  );
}

Ink SuccessButtonChild(String buttonText) {
  return Ink(
    decoration: BoxDecoration(
        color: colorGreen, borderRadius: BorderRadius.circular(6)),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(
        buttonText,
        style: ButtonTextStyle(),
      ),
    ),
  ); // Ink
}

void SuccessToast(msg) {
  Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: colorGreen,
    textColor: colorWhite,
    fontSize: 16.0,
  );
}

void ErrorToast(msg) {
  Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: colorRed,
    textColor: colorWhite,
    fontSize: 16.0,
  );
}
