import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: kFontFamily,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.whitebackground,

      dividerTheme: DividerThemeData(color: AppColors.dividerColor),

      colorScheme: ColorScheme.light(
        // اللون الأساسي للتطبيق
        primary: AppColors.primaryColor,
        // لون النص أو الأيقونة فوق الـ primary
        onPrimary: Colors.white,
        // درجة فاتحة وناعمة من اللون الأساسي
        primaryContainer: AppColors.primaryContainer,
        //لون أساسي ثابت لا يتغير إطلاقاً بين ال ـ Light والـ Dark Mode (بيفضل نفس الدرجة في الليل والنهار).
        primaryFixed: AppColors.primaryFixed,

        // #############################################################################################

        // لون البراند الثاني
        secondary: AppColors.secondryColor,
        // خلفية ناعمة مشتقة من اللون الثانوي.
        secondaryContainer: AppColors.secondaryContainer,

        // #############################################################################################
        shadow: AppColors.surfaceDark.withOpacity(0.08),

        // #############################################################################################
        outline: AppColors.iconArrowBorder,
        outlineVariant: AppColors.iconArrowBorder,
        // #############################################################################################
        surface: AppColors.backgroundColorImage,
        onSurface: AppColors.surfaceDark,
        onSurfaceVariant: AppColors.textFieldBorderColor,
        surfaceBright: AppColors.itemDetailsInfoBoxColor,

        // #############################################################################################
        tertiary: AppColors.forgetPasswordTextColor,
        tertiaryContainer: AppColors.hintTextFieldColor,
        tertiaryFixed: Color(0xffEEEEEE),
        tertiaryFixedDim: AppColors.lightBackground,

        // #############################################################################################
        error: AppColors.textFieldErrorBorderColor,
      ),

      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        titleTextStyle: AppStyles.textStyle19Bold,
        backgroundColor: AppColors.whitebackground,
      ),

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.whitebackground;
          }
          return AppColors.whitebackground;
        }),

        trackOutlineColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.transparent;
          }
          return Colors.transparent;
        }),

        trackColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryColor;
          }
          return AppColors.hintTextFieldColor;
        }),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.whitebackground,
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.whitebackground,
          foregroundColor: AppColors.surfaceDark,
          side: BorderSide(color: AppColors.bottonColorBorder),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        counterStyle: AppStyles.textStyle13Regular.copyWith(
          color: AppColors.hintTextFieldColor,
        ),
        filled: true,
        fillColor: AppColors.numberInputFillColor,
        suffixIconColor: AppColors.passwordVisibleIconColor,
        prefixIconColor: AppColors.passwordVisibleIconColor,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: AppColors.textFieldBorderColor,
            width: 1,
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: AppColors.textFieldBorderColor,
            width: 1,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: AppColors.textFieldBorderColor,
            width: 1,
          ),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: AppColors.textFieldErrorBorderColor,
            width: 1,
          ),
        ),

        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: AppColors.textFieldBorderColor,
            width: 1,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: AppColors.textFieldErrorBorderColor,
            width: 1,
          ),
        ),

        errorStyle: TextStyle(fontSize: 0),
        hintStyle: AppStyles.textStyle13Bold.copyWith(
          color: AppColors.hintTextFieldColor,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      fontFamily: kFontFamily,
      brightness: Brightness.dark,
      // 🌙 خلفية الشاشة الأساسية في الـ Dark Mode
      scaffoldBackgroundColor: AppColors.surfaceDark,

      dividerTheme: DividerThemeData(
        color: AppColors.dividerColor.withOpacity(0.2),
      ),

      colorScheme: ColorScheme.dark(
        // اللون الأساسي بيظل الأخضر
        primary: AppColors.primaryColor,
        onPrimary: Colors.white,
        // خلفيات الأيقونات/الدرجات الناعمة بتتحول لداكنة
        primaryContainer: AppColors.primaryColor.withOpacity(0.2),
        primaryFixed: AppColors.primaryFixed,

        // #############################################################################################
        secondary: AppColors.secondryColor,
        secondaryContainer: AppColors.secondaryContainer.withOpacity(0.2),

        // #############################################################################################
        shadow: Colors.black.withOpacity(0.4),

        // #############################################################################################
        // الحدود والفاصل بتتحول لرمادي داكن
        outline: AppColors.textFieldBorderColor.withOpacity(0.3),
        outlineVariant: AppColors.iconArrowBorder.withOpacity(0.3),

        // #############################################################################################
        // 🌙 خلفيات الأسطح والكروت
        surface: AppColors.surfaceDark,
        onSurface: AppColors.whitebackground, // النص الرئيسي بيتحول لأبيض
        onSurfaceVariant:
            AppColors.hintTextFieldColor, // النص الثانوي رمادي فاتح
        surfaceBright: const Color(0xFF242728), // خلفية كروت المعلومات الداكنة
        // #############################################################################################
        tertiary: AppColors.forgetPasswordTextColor,
        tertiaryContainer: AppColors.hintTextFieldColor.withOpacity(0.2),
        tertiaryFixed: const Color(0xFF2C2C2C),
        tertiaryFixedDim: const Color(0xFF1E1E1E),

        // #############################################################################################
        error: AppColors.textFieldErrorBorderColor,
      ),

      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        titleTextStyle: AppStyles.textStyle19Bold.copyWith(
          color: AppColors.whitebackground,
        ),
        backgroundColor: AppColors.surfaceDark,
      ),

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
          return AppColors.whitebackground;
        }),
        trackOutlineColor: WidgetStateProperty.resolveWith<Color>((states) {
          return Colors.transparent;
        }),
        trackColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryColor;
          }
          return AppColors.surfaceDark;
        }),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.whitebackground,
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.surfaceDark,
          foregroundColor: AppColors.whitebackground,
          side: BorderSide(color: AppColors.bottonColorBorder.withOpacity(0.4)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        counterStyle: AppStyles.textStyle13Regular.copyWith(
          color: AppColors.hintTextFieldColor,
        ),
        filled: true,
        fillColor: const Color(0xFF1E2223), // 🌙 خلفية داكنة للـ TextFields
        suffixIconColor: AppColors.hintTextFieldColor,
        prefixIconColor: AppColors.hintTextFieldColor,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: AppColors.textFieldBorderColor.withOpacity(0.2),
            width: 1,
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: AppColors.textFieldBorderColor.withOpacity(0.2),
            width: 1,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 1),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: AppColors.textFieldErrorBorderColor,
            width: 1,
          ),
        ),

        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: AppColors.textFieldBorderColor.withOpacity(0.2),
            width: 1,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: AppColors.textFieldErrorBorderColor,
            width: 1,
          ),
        ),

        errorStyle: const TextStyle(fontSize: 0),
        hintStyle: AppStyles.textStyle13Bold.copyWith(
          color: AppColors.hintTextFieldColor,
        ),
      ),
    );
  }
}
