import 'package:chiedoziedivine/providers/app_state.dart';
import 'package:chiedoziedivine/utils/colors.dart';
import 'package:chiedoziedivine/views/CarOwnersScreen/CarOwnersScreen.dart';
import 'package:chiedoziedivine/views/FilterScreen/FilterScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppState>(
          builder: (context) => AppState(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => FilterScreen(),
          CarOwnersScreen.routeName: (context) => CarOwnersScreen()
        },
        theme: ThemeData(
            primaryColor: AppColors.PRIMARY_COLOR,
            accentColor: AppColors.ACCENT_COLOR,
            textTheme: GoogleFonts.poppinsTextTheme()),
      ),
    ),
  );
}

