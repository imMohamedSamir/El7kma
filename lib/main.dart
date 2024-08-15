import 'package:el7kma/Core/Manager/language_cubit/language_cubit.dart';
import 'package:el7kma/Core/Utlis/blocObs.dart';
import 'package:el7kma/Features/AuthView/Presentaion/AuthView.dart';
import 'package:el7kma/Features/HomeView/Presentaion/HomeView.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  runApp(const El7kmaApp());
}

class El7kmaApp extends StatelessWidget {
  const El7kmaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LanguageCubit(),
        child: BlocBuilder<LanguageCubit, Locale>(
          builder: (context, state) {
            return MaterialApp(
              theme:
                  ThemeData(scaffoldBackgroundColor: const Color(0xffEFF1F2)),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: state,
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        ));
  }
}
