import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

import 'package:saxnpark_app/bloc/landing/landing_bloc.dart';
import 'package:saxnpark_app/firebase_options.dart';
import 'package:saxnpark_app/pages/Authentication/login.dart';
import 'package:saxnpark_app/pages/Authentication/password_reset.dart';
import 'package:saxnpark_app/pages/authentication/register_home.dart';
import 'package:saxnpark_app/repositories/authentication.dart';
import 'package:saxnpark_app/services/firebase_service.dart';
import 'package:saxnpark_app/utils/colors.dart';
import 'package:saxnpark_app/utils/router.dart';

import 'bloc/google/google_bloc.dart';
import 'pages/authentication/country_list.dart';
import 'utils/strings.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print("catch");
  }
  await FirebaseService().initNotifications();
  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    mapsImplementation.useAndroidViewSurface = true;
    initializeMapRenderer();
  }
  runApp(MyApp());
}

Completer<AndroidMapRenderer?>? _initializedRendererCompleter;

/// Initializes map renderer to the `latest` renderer type for Android platform.
///
/// The renderer must be requested before creating GoogleMap instances,
/// as the renderer can be initialized only once per application context.
Future<AndroidMapRenderer?> initializeMapRenderer() async {
  if (_initializedRendererCompleter != null) {
    return _initializedRendererCompleter!.future;
  }

  final Completer<AndroidMapRenderer?> completer =
      Completer<AndroidMapRenderer?>();
  _initializedRendererCompleter = completer;

  WidgetsFlutterBinding.ensureInitialized();

  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    unawaited(mapsImplementation
        .initializeWithRenderer(AndroidMapRenderer.latest)
        .then((AndroidMapRenderer initializedRenderer) =>
            completer.complete(initializedRenderer)));
  } else {
    completer.complete(null);
  }

  return completer.future;
}

class MyApp extends StatelessWidget {
  AuthRepository authRepository = AuthRepository();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LandingBloc>(
          create: (context) => LandingBloc(),
        ),
        BlocProvider(
          create: (context) => GoogleBloc(authRepository),
        ),
      ],
      child: MaterialApp(
        title: Strings.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: AppColors.primary, fontFamily: 'PublicSans'),
        initialRoute: '/',
        onGenerateRoute: RoutesGenerator.generateRoute,
        home: const RegisterHome(),
      ),
    );
  }
}
