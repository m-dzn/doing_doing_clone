import 'package:doing_doing_clone/provider/todos.dart';
import 'package:doing_doing_clone/screen/screen_home.dart';
import 'package:doing_doing_clone/service/app.theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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
    return ChangeNotifierProvider(
        create: (context) => TodosProvider(),
        child: MaterialApp(
          title: title,
          theme: themeData,
          home: const HomeScreen(),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: const [
            Locale('ko', 'KR')
          ],
          locale: const Locale('ko'),
        ));
  }
}
