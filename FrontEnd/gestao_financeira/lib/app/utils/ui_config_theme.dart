import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UiConfigTheme {
  UiConfigTheme._();

  static String get title => 'Financy_UAI';

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
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF9AD0D3),
          onPrimary: Color(0xFFFFFFFF),
          primaryContainer: Color(0xFF8DFB77),
          onPrimaryContainer: Color(0xFF002200),
          secondary: Color.fromARGB(255, 69, 133, 206),
          onSecondary: Color(0xFFFFFFFF),
          secondaryContainer: Color.fromARGB(255, 0, 229, 245),
          onSecondaryContainer: Color(0xFF002200),
          tertiary: Color.fromARGB(255, 20, 99, 216),
          onTertiary: Color(0xFFFFFFFF),
          tertiaryContainer: Color(0xFFB1F49D),
          onTertiaryContainer: Color(0xFF012200),
          error: Color(0xFFBA1A1A),
          errorContainer: Color(0xFFFFDAD6),
          onError: Color(0xFFFFFFFF),
          onErrorContainer: Color(0xFF410002),
          surface: Color(0xFFFCFDF6),
          onSurface: Color(0xFF1A1C18),
          onSurfaceVariant: Color(0xFF43483F),
          outline: Color(0xFF73796E),
          onInverseSurface: Color(0xFFF1F1EB),
          inverseSurface: Color(0xFF2F312D),
          inversePrimary: Color(0xFF72DE5E),
          shadow: Color(0xFF000000),
          surfaceTint: Color(0xFF9AD0D3),
          outlineVariant: Color(0xFFC3C8BC),
          scrim: Color(0xFF000000),
        ),
      );

  static ThemeData get themedark => ThemeData(
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
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFF9AD0D3),
          onPrimary: Color(0xFFFFFFFF),
          primaryContainer: Color(0xFF8DFB77),
          onPrimaryContainer: Color(0xFF002200),
          secondary: Color.fromARGB(255, 69, 133, 206),
          onSecondary: Color(0xFFFFFFFF),
          secondaryContainer: Color.fromARGB(255, 0, 229, 245),
          onSecondaryContainer: Color(0xFF002200),
          tertiary: Color.fromARGB(255, 20, 99, 216),
          onTertiary: Color(0xFFFFFFFF),
          tertiaryContainer: Color(0xFFB1F49D),
          onTertiaryContainer: Color(0xFF012200),
          error: Color(0xFFBA1A1A),
          errorContainer: Color(0xFFFFDAD6),
          onError: Color(0xFFFFFFFF),
          onErrorContainer: Color(0xFF410002),
          surface: Color(0xFFFCFDF6),
          onSurface: Color(0xFF1A1C18),
          onSurfaceVariant: Color(0xFF43483F),
          outline: Color(0xFF73796E),
          onInverseSurface: Color(0xFFF1F1EB),
          inverseSurface: Color(0xFF2F312D),
          inversePrimary: Color(0xFF72DE5E),
          shadow: Color(0xFF000000),
          surfaceTint: Color(0xFF9AD0D3),
          outlineVariant: Color(0xFFC3C8BC),
          scrim: Color(0xFF000000),
        ),
      );
}
