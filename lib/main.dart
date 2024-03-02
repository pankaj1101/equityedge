import 'package:equityedge/utils/route/routes.dart';
import 'package:equityedge/utils/route/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations( 
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,  
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Equity Edge',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: TextTheme(
          /* body */
          bodySmall: TextStyle(fontSize: 8),
          bodyMedium: TextStyle(fontSize: 10),
          bodyLarge: TextStyle(fontSize: 12),

          /* title */
          titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),

          /* display */
          displaySmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          displayMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
          displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      // home: const LoginView(),
      initialRoute: AppRouterName.login,
      onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
    );
  }
}
