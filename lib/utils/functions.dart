import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


Widget commonTextField(
    {String? title,
      required String placeholder,
      required TextEditingController controller,
      EdgeInsetsGeometry? padding,
      Function(String? value)? onChanged,
      Function(String? value)? onSubmitted,
      validation,
      Function()? onTap,
      bool showValidation = false,
      String? validatorMsg,
      Function(String? value)? onPressonPress,
      TextInputType keyboardTyoe = TextInputType.text,
      bool? isPassword,
      bool? isObsecure,
      List<TextInputFormatter>? inputFormatter,
      textInputAction,
      maxLines = null,
      bool isMandatory = false,
      readOnly = false,
      bool isShowRightButton = false,
      Widget? rightButtonDesign,
      Widget? suffixIconWidget,
      EdgeInsets? fieldMargin,
      Widget? prefixIconWidget,
      bool isCheckValidation = false,
      isShowCustomValidation = false,
      // String validationMsg = AppStrings.validatorTextConst,
      FocusNode? focusNode,
      bool isMobile = false,
      double? fontSize,
      bool isMobileView = false,
      int? maxLength}) {
  return Container(
    margin: fieldMargin ?? EdgeInsets.only(right: 20, left: 2),
    padding: padding != null
        ? padding
        : EdgeInsets.symmetric(
        vertical: 10 /*SizeConfig.blockSizeVertical * 0.5*/,
        horizontal: 10 /*SizeConfig.blockSizeHorizontal * 7*/),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != "")
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  title ?? "",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: "Inter",
                      color: Colors.black,
                      fontSize: fontSize ?? 12),
                ),
                if (isMandatory)
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  ),
                if (isShowRightButton)
                  Expanded(
                    child: rightButtonDesign!,
                  )
              ],
            ),
          ),
        SizedBox(
          height: 10,
        ),
        if (title != "")

       TextFormField(
              controller: controller,
              obscureText: isObsecure ?? false,
              keyboardType: keyboardTyoe,
              textInputAction: textInputAction ?? TextInputAction.next,
              readOnly: readOnly,
              onTap: onTap,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // autofillHints: true,
              textAlignVertical: TextAlignVertical.center,
              onFieldSubmitted: onSubmitted,
              validator: validation,
              inputFormatters: inputFormatter,
              focusNode: focusNode,
              cursorColor: Colors.blue,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontFamily: "Inter",
              ),
              decoration: InputDecoration(
                prefixIcon: prefixIconWidget,
                suffixIcon: suffixIconWidget ?? SizedBox(),
                hintStyle: TextStyle(
                    fontFamily: "Inter", fontSize: 13, color: Colors.grey),
                filled: false,
                hintText: placeholder,
                focusColor: Colors.grey,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: showValidation == false
                            ? Colors.grey.withOpacity(0.3)
                            : Colors.red),
                    borderRadius: BorderRadius.circular(20)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),


      ],
    ),
  );
}