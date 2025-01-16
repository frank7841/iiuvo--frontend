import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iiuovo/routes/named-routes.dart';
import 'package:iiuovo/translations/codegen_loader.g.dart';
import 'package:iiuovo/translations/locale_keys.g.dart';
import 'package:iiuovo/views/landingPage.dart';
import 'package:logger/logger.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(
  debugLabel: 'root',
);
final Logger logger = Logger();
final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
      navigatorKey: _rootNavigator,
      initialLocation: landingPage,
      routes: [
        GoRoute(
            parentNavigatorKey: _rootNavigator,
            path: '/',
            builder: (context, state) => const LandingPage()),
        GoRoute(
            parentNavigatorKey: _rootNavigator,
            path: landingPage,
            name: landingPage,
            builder: (context, state) => const LandingPage()),
      ]);
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en')],
    path: 'assets/translations',
    assetLoader: const CodegenLoader(),
    child: const ProviderScope(
      child: MyApp(),
    ),
  ));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final GoRouter router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      title: LocaleKeys.iiuovoTitle.tr(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.latoTextTheme(
          ThemeData.light().textTheme,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue, // Adjust primary color
        ).copyWith(
          surface: Colors.grey[300], // Set surface color for light theme
          surfaceVariant:
              Colors.grey[200], // Set surface variant color for light theme
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.latoTextTheme(
          ThemeData.dark().textTheme,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue, // Adjust primary color for dark theme
        ).copyWith(
          surface: Colors.grey[850], // Set surface color for dark theme
          surfaceVariant:
              Colors.grey[700], // Set surface variant color for dark theme
        ),
      ),
      themeMode: ThemeMode.light,
    );
  }
}
