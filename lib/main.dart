import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'package:flutter_discard_web_app/app/pages/home_page.dart';
import 'package:flutter_discard_web_app/app/provider/application_provider_binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Intl.defaultLocale = 'pt-BR';
  initializeDateFormatting('pt-BR', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationProviderBinding(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Color(0xff5865f2),
          ),
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        routes: {
          '/': (context) => const HomePage(),
        },
      ),
    );
  }
}
