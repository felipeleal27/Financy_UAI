import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UiConfigTheme {
  UiConfigTheme._();

  static String get title => 'NewColetor';

  static ThemeData get themelight => ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal[900]!,
          foregroundColor: const Color(0xFFFFFFFF),
          titleTextStyle: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ),
          toolbarTextStyle: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.teal[900]!,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            systemNavigationBarColor: Colors.teal[900]!,
            systemNavigationBarDividerColor: Colors.teal[900]!,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
        ),
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.teal[900]!,
          onPrimary: const Color(0xFFFFFFFF),
          primaryContainer: const Color(0xFF8DFB77),
          onPrimaryContainer: const Color(0xFF002200),
          secondary: const Color.fromARGB(255, 69, 133, 206),
          onSecondary: const Color(0xFFFFFFFF),
          secondaryContainer: const Color.fromARGB(255, 0, 229, 245),
          onSecondaryContainer: const Color(0xFF002200),
          tertiary: const Color.fromARGB(255, 20, 99, 216),
          onTertiary: const Color(0xFFFFFFFF),
          tertiaryContainer: const Color(0xFFB1F49D),
          onTertiaryContainer: const Color(0xFF012200),
          error: const Color(0xFFBA1A1A),
          errorContainer: const Color(0xFFFFDAD6),
          onError: const Color(0xFFFFFFFF),
          onErrorContainer: const Color(0xFF410002),
          surface: const Color(0xFFFCFDF6),
          onSurface: const Color(0xFF1A1C18),
          onSurfaceVariant: const Color(0xFF43483F),
          outline: const Color(0xFF73796E),
          onInverseSurface: const Color(0xFFF1F1EB),
          inverseSurface: const Color(0xFF2F312D),
          inversePrimary: const Color(0xFF72DE5E),
          shadow: const Color(0xFF000000),
          surfaceTint: Colors.teal[900]!,
          outlineVariant: const Color(0xFFC3C8BC),
          scrim: const Color(0xFF000000),
        ),
      );

  static ThemeData get themedark => ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal[900]!,
          foregroundColor: const Color(0xFFFFFFFF),
          titleTextStyle: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ),
          toolbarTextStyle: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.teal[900]!,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            systemNavigationBarColor: Colors.teal[900]!,
            systemNavigationBarDividerColor: Colors.teal[900]!,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
        ),
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.teal[900]!,
          onPrimary: const Color(0xFFFFFFFF),
          primaryContainer: const Color(0xFF8DFB77),
          onPrimaryContainer: const Color(0xFF002200),
          secondary: const Color.fromARGB(255, 69, 133, 206),
          onSecondary: const Color(0xFFFFFFFF),
          secondaryContainer: const Color.fromARGB(255, 0, 229, 245),
          onSecondaryContainer: const Color(0xFF002200),
          tertiary: const Color.fromARGB(255, 20, 99, 216),
          onTertiary: const Color(0xFFFFFFFF),
          tertiaryContainer: const Color(0xFFB1F49D),
          onTertiaryContainer: const Color(0xFF012200),
          error: const Color(0xFFBA1A1A),
          errorContainer: const Color(0xFFFFDAD6),
          onError: const Color(0xFFFFFFFF),
          onErrorContainer: const Color(0xFF410002),
          surface: const Color(0xFFFCFDF6),
          onSurface: const Color(0xFF1A1C18),
          onSurfaceVariant: const Color(0xFF43483F),
          outline: const Color(0xFF73796E),
          onInverseSurface: const Color(0xFFF1F1EB),
          inverseSurface: const Color(0xFF2F312D),
          inversePrimary: const Color(0xFF72DE5E),
          shadow: const Color(0xFF000000),
          surfaceTint: Colors.teal[900]!,
          outlineVariant: const Color(0xFFC3C8BC),
          scrim: const Color(0xFF000000),
        ),
      );
}
