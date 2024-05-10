import 'package:countries_task/controller/fetchedcountries_provider.dart';
import 'package:countries_task/controller/internet_provider.dart';
import 'package:countries_task/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => InternetConnectivityProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FetchedCountriesProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.loraTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: Homepage(),
      ),
    );
  }
}
