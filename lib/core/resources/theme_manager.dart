import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'styles_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      // main colors of the app
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.secondry,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,
      iconTheme: IconThemeData(
        color: ColorManager.darkPrimary,
      ),
      // ripple color
      splashColor: ColorManager.secondry,
      // will be used incase of disabled button for example

      // card view theme

      cardTheme: CardTheme(
          color: ColorManager.darkPrimary,
          shadowColor: ColorManager.grey,
          elevation: AppSize.s4),
      // App bar theme
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: ColorManager.darkPrimary,
          elevation: AppSize.s4,
          shadowColor: ColorManager.grey,
          titleTextStyle: TextStyleManager.getRegularStyle(
              color: ColorManager.black, fontSize: FontSize.s16.sp)),
      // Button theme
      buttonTheme: ButtonThemeData(
          shape: const StadiumBorder(),
          disabledColor: ColorManager.grey1,
          buttonColor: ColorManager.primary,
          splashColor: ColorManager.grey),

      // elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, AppSize.s12),
              textStyle:
                  TextStyleManager.getRegularStyle(color: ColorManager.black),
              backgroundColor: Colors.transparent,
              elevation: 0,
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s0)))),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              minimumSize: const Size(double.infinity, AppSize.s12),
              textStyle:
                  TextStyleManager.getRegularStyle(color: ColorManager.black),
              backgroundColor: Colors.transparent,
              elevation: 0,
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s0)))),
      // Text theme
      textTheme: TextTheme(
        displayLarge: TextStyleManager.getRegularStyle(
            color: ColorManager.black, fontSize: FontSize.s57.sp),
        displayMedium: TextStyleManager.getRegularStyle(
            color: ColorManager.black, fontSize: FontSize.s45.sp),
        displaySmall: TextStyleManager.getBoldStyle(
            color: ColorManager.black, fontSize: FontSize.s36.sp),
        //
        headlineLarge: TextStyleManager.getRegularStyle(
            color: ColorManager.black, fontSize: FontSize.s32.sp),
        headlineMedium: TextStyleManager.getMediumStyle(
          color: ColorManager.darkPrimary,
          fontSize: FontSize.s28.sp,
        ),
        headlineSmall: TextStyleManager.getSemiBoldStyle(
            color: ColorManager.black, fontSize: FontSize.s24.sp),
        //
        titleLarge: TextStyleManager.getSemiBoldStyle(
            color: ColorManager.black, fontSize: FontSize.s20.sp),
        titleMedium: TextStyleManager.getSemiBoldStyle(
            color: ColorManager.greyTextColor, fontSize: FontSize.s18.sp),
        titleSmall: TextStyleManager.getRegularStyle(
            color: ColorManager.darkGrey, fontSize: FontSize.s14.sp),
        //
        labelLarge: TextStyleManager.getSemiBoldStyle(
            color: ColorManager.black, fontSize: FontSize.s14.sp),
        labelMedium: TextStyleManager.getMediumStyle(
            color: ColorManager.black, fontSize: FontSize.s12.sp),
        labelSmall: TextStyleManager.getMediumStyle(
            color: ColorManager.black, fontSize: FontSize.s10.sp),
        //
        bodyLarge: TextStyleManager.getMediumStyle(
            color: ColorManager.black, fontSize: FontSize.s16.sp),
        bodyMedium: TextStyleManager.getMediumStyle(
            color: ColorManager.darkPrimary, fontSize: FontSize.s14.sp),
        bodySmall: TextStyleManager.getRegularStyle(
            color: ColorManager.black, fontSize: FontSize.s12.sp),
      ),
      // input decoration theme (text form field)

      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyleManager.getMediumStyle(color: ColorManager.black),
        labelStyle: TextStyleManager.getMediumStyle(
            color: ColorManager.black, fontSize: FontSize.s18),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.sp),
          borderSide: BorderSide(color: ColorManager.black, width: 1.sp),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.sp),
          borderSide: BorderSide(color: ColorManager.black, width: 1.sp),
        ),
        disabledBorder: const UnderlineInputBorder(),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.sp),
          borderSide: BorderSide(color: ColorManager.error, width: 2.sp),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.sp),
          borderSide: BorderSide(color: ColorManager.error, width: 1.sp),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.sp),
        ),
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        // hint style
        // hintStyle: TextStyleManager.getRegularStyle(color: ColorManager.black),

        // label style
        // labelStyle: TextStyleManager.getMediumStyle(
        //     color: ColorManager.black, fontSize: FontSize.s22.sp),
        // error style
        errorStyle: TextStyleManager.getRegularStyle(color: ColorManager.error),

        // enabled border

        // error border
      ));
}
