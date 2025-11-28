import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie/screens/home.dart';
import 'package:movie/theme/styles.dart';
import 'package:provider/provider.dart';
import 'package:movie/providers/common.dart';
import 'package:movie/global_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('mn', 'MN')],
      path: 'assets/translations', // <-- change the path of the translation files 
      fallbackLocale: Locale('en', 'US'),
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => CommonProvider()),
    ], 
      child:  MaterialApp(
        title: 'Movie app',
        theme: myTheme,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: HomePage(),
        navigatorKey: GlobalKeys.navigatorKey,
    ));
  }
}
