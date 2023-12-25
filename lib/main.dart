import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutterzon/src/config/router/router.dart';
import 'package:flutterzon/src/config/themes/app_theme.dart';
import 'package:flutterzon/src/data/repositories/auth_repository.dart';
import 'package:flutterzon/src/logic/blocs/admin/admin_offers/single_image_coursel_cubic/single_image_carousel_cubic.dart';
import 'package:flutterzon/src/logic/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutterzon/src/logic/blocs/auth_bloc/radio_bloc/radio_bloc.dart';
import 'package:flutterzon/src/logic/blocs/page_redirection_cubit/page_redirection_cubit.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      // statusBarBrightness: Brightness.light,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  await dotenv.load(fileName: "config.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageRedirectionCubit(AuthRepository()),
        ),
        BlocProvider(
          create: (context) => SingleImageCubic(),
        ),
        BlocProvider(
          create: (context) => RadioBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(AuthRepository()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        routerConfig: router,
      ),
    );
  }
}
