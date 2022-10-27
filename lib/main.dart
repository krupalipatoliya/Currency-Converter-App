import 'package:currency_convter/providers/converter_api.dart';
import 'package:currency_convter/utils/appRoutes.dart';
import 'package:currency_convter/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider<ConverterProvider>(
          create: (context) => ConverterProvider(),
        ),
      ],
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: (Provider.of<ThemeProvider>(context).obj.isDark)
            ? ThemeMode.dark
            : ThemeMode.light,
        title: "Currency Converter App",
        theme: ThemeData(
          primaryColor: Colors.deepOrange,
          backgroundColor: Colors.deepOrange.shade50,
          secondaryHeaderColor: Colors.black,
          cardColor: Colors.black,
          iconTheme: const IconThemeData(
            color: Colors.deepOrange,
          ),
        ),
        darkTheme: ThemeData(
          backgroundColor: Colors.black54,
          primaryColor: Colors.blueAccent,
          secondaryHeaderColor: Colors.white,
          cardColor: Colors.grey.withOpacity(0.6),
          iconTheme: const IconThemeData(
            color: Colors.blue,
          ),
        ),
        initialRoute: AppRoutes().homePage,
        routes: routes,
      ),
    );
  }
}
