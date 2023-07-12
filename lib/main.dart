import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_note_app/core/services/hive/hive_config.dart';
import 'package:todo_note_app/core/settings/flavors_settings/flavors_environment.dart';
import 'package:todo_note_app/core/settings/routes/router.dart';
import 'package:todo_note_app/core/settings/theme/theme_controller.dart';
import 'package:firebase_core/firebase_core.dart';

// ignore: depend_on_referenced_packages
import 'package:stack_trace/stack_trace.dart' as stack_trace;

late FlavorsEnvironment flavorEnvironment;

void mainApp(FlavorsEnvironment flavorsEnvironment) async {
  flavorEnvironment = flavorsEnvironment;
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.init();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MainApp()));
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final themeProviderWatch = ref.watch(themeProvider);
    return GestureDetector(
      // onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: MaterialApp.router(
        routerConfig: ref.watch(routeProvider),
        debugShowCheckedModeBanner: false,
        theme: themeProviderWatch.getThemeData(),
      ),
    );

    // return MaterialApp();
  }
}
