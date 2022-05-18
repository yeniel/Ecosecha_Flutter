import 'dart:async';

import 'package:ecosecha_flutter/app.dart';
import 'package:ecosecha_flutter/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await SharedPreferences.getInstance();

      var apiClient = HttpApiClient();
      var authRepository = AuthRepository(apiClient: apiClient);
      var repository = Repository(apiClient: apiClient, authRepository: authRepository);

      runApp(
        MultiRepositoryProvider(
          providers: [
            RepositoryProvider(create: (context) => authRepository),
            RepositoryProvider(create: (context) => repository),
          ],
          child: const App(),
        ),
      );
    },
    (error, st) => print(error),
  );
}
