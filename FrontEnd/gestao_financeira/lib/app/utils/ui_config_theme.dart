import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestao_financeira/app/database/local_storage/shared_preferences/shared_preferences_local_storage_impl.dart';

class UiConfigTheme {
  UiConfigTheme._();

  static String get title => 'Financy_UAI';

  static final ValueNotifier<ThemeMode> themeMode =
      ValueNotifier(ThemeMode.light);

  static void toggleTheme() async {
    final localStorage = SharedPreferencesLocalStorageImpl();
    final isDark = await localStorage.isThemeDark();
    themeMode.value = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  static ThemeData get themelight => ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF9AD0D3),
          foregroundColor: Color(0xFFFFFFFF),
          titleTextStyle: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ),
          toolbarTextStyle: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xFF9AD0D3),
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            systemNavigationBarColor: Color(0xFF9AD0D3),
            systemNavigationBarDividerColor: Color(0xFF9AD0D3),
            systemNavigationBarIconBrightness: Brightness.light,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF9AD0D3),
          secondary: Color(0xFF457B9D),
          surface: Color(0xFFFCFDF6),
          error: Color(0xFFBA1A1A),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Color(0xFFFCFDF6),
          modalBackgroundColor: Color(0xFFFCFDF6),
        ),
      );

  static ThemeData get themedark => ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A2049),
          foregroundColor: Color(0xFFFFFFFF),
          titleTextStyle: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ),
          toolbarTextStyle: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xFF121212),
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
            systemNavigationBarColor: Color(0xFF121212),
            systemNavigationBarDividerColor: Color(0xFF121212),
            systemNavigationBarIconBrightness: Brightness.light,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFFD1E8E2),
        ),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF9AD0D3),
          secondary: Color(0xFF457B9D),
          surface: Color(0xFF121212),
          error: Color(0xFFCF6679),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Color(0xFF0A2049),
          modalBackgroundColor: Color(0xFF0A2049),
        ),
      );
}
