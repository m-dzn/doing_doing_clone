import 'package:doing_doing_clone/provider/date_time_provider.dart';
import 'package:doing_doing_clone/provider/diaries.dart';
import 'package:doing_doing_clone/provider/todos.dart';
import 'package:doing_doing_clone/provider/year_month_provider.dart';
import 'package:doing_doing_clone/screen/screen_home.dart';
import 'package:doing_doing_clone/service/app.theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String title = 'Doing Doing Clone';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DiariesProvider()),
        ChangeNotifierProvider(create: (_) => TodosProvider()),
        ChangeNotifierProvider(create: (_) => DateTimeProvider()),
        ChangeNotifierProvider(create: (_) => YearMonthProvider()),
      ],
      child: MaterialApp(
        title: title,
        theme: themeData,
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ko', 'KR')
        ],
        locale: const Locale('ko'),
      )
    );
  }
}
