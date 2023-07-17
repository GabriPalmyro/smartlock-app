import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:smartlock_app/app/initial_binding.dart';
import 'package:smartlock_app/core/theme/theme.dart';
import 'package:smartlock_app/routes/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    GetMaterialApp(
      title: 'Smartlock App',
      themeMode: ThemeMode.dark,
      theme: CustomTheme.getDarkTheme(),
      darkTheme: CustomTheme.getDarkTheme(),
      getPages: AppPages.pages,
      initialRoute: Routes.splash,
      defaultTransition: Transition.native,
      debugShowCheckedModeBanner: false,
      supportedLocales: const [Locale('pt', 'BR')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      initialBinding: InitialBinding(),
    ),
  );
}
