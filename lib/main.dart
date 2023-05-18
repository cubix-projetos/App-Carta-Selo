import 'package:carta_selo/screens/carta_selo.dart';
import 'package:carta_selo/screens/home_screen.dart';
import 'package:carta_selo/screens/multi_carta_selo.dart';
import 'package:carta_selo/stores/pdf_store.dart';
import 'package:carta_selo/styles/style.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    MultiProvider(
      providers: [
        Provider<PdfStore>.value(
          value: PdfStore(),
        ),
      ],
      child: CartaSeloApp(),
    ),
  );
}

class CartaSeloApp extends StatelessWidget {
  const CartaSeloApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      routes: {
        "/home": (context) => HomeScreen(),
        "/carta_selo": (context) => CartaSeloScreen(),
        "/multi_carta_selo": (context) => MultiCartaSeloScreen(),
      },
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget!),
        maxWidth: 1366,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1366, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
        background: Container(
          color: Color(0xFFF5F5F5),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      theme: androidTheme(),
    );
  }
}
