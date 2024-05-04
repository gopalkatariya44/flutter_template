import '/common_imports.dart';

class AppThemeData {
  static ThemeData dark = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Color.fromARGB(255, 11, 128, 74), // Dark WhatsApp green
      onPrimary: Colors.white, // For content on primary color
      secondary: Color(0xFF128C7E), // Darker green for secondary elements
      onSecondary: Colors.white, // For content on secondary color
      error: Colors.redAccent,
      onError: Colors.white,
      background: Color(0xFF2C2C2C), // Very dark grey, almost black
      onBackground: Colors.white, // Light text on dark backgrounds
      surface: Color(0xFF1C1C1C),
      onSurface: Colors.white, // Text on dark surfaces
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.all(15),
      border: OutlineInputBorder(),
    ),
    useMaterial3: true,
  );

  static ThemeData light = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Color.fromARGB(255, 29, 168, 80), // WhatsApp green
      onPrimary: Colors.white, // For content on primary color
      secondary: Color(0xFF128C7E), // Darker green for secondary elements
      onSecondary: Colors.white, // For content on secondary color
      error: Colors.redAccent,
      onError: Colors.white,
      background: Color(0xFFECE5DD), // Light grey used in chat background
      onBackground: Colors.black, // Typically dark text on light backgrounds
      surface: Colors.white,
      onSurface: Colors.black, // Text on surfaces like cards, dialogs, etc.
    ),
    useMaterial3: true,
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.all(15),
      border: OutlineInputBorder(),
    ),
  );
}
