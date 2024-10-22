import 'package:flutter/material.dart';
import 'package:restauran_app/models/Restoran.dart';
import 'package:restauran_app/pages/details_page.dart';
import 'package:restauran_app/pages/home_page.dart';
import 'package:restauran_app/style/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restautan App',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              onPrimary: Colors.black,
              secondary: secondaryColor,
            ),
        scaffoldBackgroundColor: secondaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: textTheme,
        appBarTheme: const AppBarTheme(elevation: 0),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: secondaryColor,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
            ),
          ),
        ),
      ),
      initialRoute: '/home_page',
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        // ignore: equal_keys_in_map
        DetailsPage.routeName: (context) => DetailsPage(restaurants: ModalRoute.of(context)?.settings.arguments as Restaurants),
      },
    );
  }
}