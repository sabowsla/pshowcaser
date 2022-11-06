import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pshowcaser/pages/a_export_pages.dart';
import 'package:pshowcaser/pages/error_page.dart';
import 'package:pshowcaser/providers/providers.dart';
import 'package:pshowcaser/translation/app_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialize = ref.watch(Providers.firebaseInitializer);

    return MaterialApp(
      title: 'P Showcaser',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        // delegate from flutter_localization
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        AppLocalizationsDelegate(),
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
      home: initialize.when(
        data: (data) {
          return const HomePage();
        },
        loading: () => const LoadingPage(),
        error: (e, stackTrace) => ErrorPage(
          error: e.toString(),
          stackTrace: stackTrace.toString(),
        ),
      ),
    );
  }
}
