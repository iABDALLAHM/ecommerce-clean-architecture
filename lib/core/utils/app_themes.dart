import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_colors.dart';
import 'package:ecommerce_clean_architecture/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
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
      padding: EdgeInsets.zero,
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
        padding: EdgeInsets.zero,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
        borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1),
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
        borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1),
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

  static ThemeData darkTheme = ThemeData(
    fontFamily: kFontFamily,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(
      0xFF0F172A,
    ), // Slate 900 كخلفية أساسية مريحة للعين

    dividerTheme: const DividerThemeData(
      color: Color(0xFF334155), // Slate 700 للفواصل والحدود الناعمة
      thickness: 1,
    ),

    colorScheme: ColorScheme.dark(
      // اللون الأساسي للبراند في الوضع الليلي (أخضر زمردي ناصع ومتوهج)
      primary: const Color(0xFF22C55E), // Emerald 500
      // لون النص أو الأيقونة فوق الـ primary
      onPrimary: Colors.white,
      // درجة أغمق للأسطح المعتمدة على اللون الأساسي
      primaryContainer: const Color(0xFF14532D), // Emerald 900
      // لون أساسي ثابت لا يتغير بين الـ Light والـ Dark Mode
      primaryFixed: AppColors.primaryFixed,

      // #############################################################################################
      // لون البراند الثاني (برتقالي دافئ)
      secondary: const Color(0xFFF97316),
      // خلفية مشتقة من الثانوي في الوضع الليلي
      secondaryContainer: const Color(0xFF7C2D12),

      // #############################################################################################
      shadow: Colors.black.withOpacity(0.4),

      // #############################################################################################
      outline: const Color(0xFF334155), // حدود الأيقونات والأسطح
      outlineVariant: const Color(0xFF1E293B), // حدود ثانوية خافتة
      // #############################################################################################
      // أسطح البطاقات والحاويات المرتفعة
      surface: const Color(0xFF1E293B), // Slate 800
      onSurface: const Color(0xFFF8FAFC), // نص أساسي ناصع وقابل للقراءة
      onSurfaceVariant: const Color(0xFF94A3B8), // نص ثانوي رمادي هادئ
      surfaceBright: const Color(
        0xFF334155,
      ), // سطح الحقول المحددة أو بطاقات التفاصيل
      // #############################################################################################
      tertiary: const Color(0xFF34D399), // روابط الإجراءات مثل نسيت كلمة المرور
      tertiaryContainer: const Color(
        0xFF64748B,
      ), // Slate 500 للتلميحات المساعدة
      tertiaryFixed: const Color(
        0xFF1E293B,
      ), // أزرار العداد أو البطاقات المصغرة
      tertiaryFixedDim: const Color(0xFF0F172A),

      // #############################################################################################
      error: const Color(0xFFEF4444), // أحمر التحذيرات والأخطاء
    ),

    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      titleTextStyle: AppStyles.textStyle19Bold.copyWith(
        color: const Color(0xFFF8FAFC),
      ),
      backgroundColor: const Color(0xFF0F172A),
      iconTheme: const IconThemeData(color: Color(0xFFF8FAFC)),
    ),

    switchTheme: SwitchThemeData(
      padding: EdgeInsets.zero,
      thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return const Color(0xFF94A3B8);
      }),
      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      trackColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return const Color(0xFF22C55E);
        }
        return const Color(0xFF334155);
      }),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: const Color(0xFF16A34A), // Emerald 600
        foregroundColor: Colors.white,
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        backgroundColor: const Color(0xFF1E293B),
        foregroundColor: const Color(0xFFF8FAFC),
        side: const BorderSide(color: Color(0xFF334155)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      counterStyle: AppStyles.textStyle13Regular.copyWith(
        color: const Color(0xFF64748B),
      ),
      filled: true,
      fillColor: const Color(0xFF1E293B), // خلفية الحقل الداكنة
      suffixIconColor: const Color(0xFF94A3B8),
      prefixIconColor: const Color(0xFF94A3B8),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xFF334155), width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xFF334155), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xFF22C55E), width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xFFEF4444), width: 1.5),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xFF1E293B), width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xFFEF4444), width: 1),
      ),
      errorStyle: const TextStyle(fontSize: 0),
      hintStyle: AppStyles.textStyle13Bold.copyWith(
        color: const Color(0xFF64748B),
      ),
    ),
  );
}
