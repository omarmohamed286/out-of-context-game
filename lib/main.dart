import 'package:flutter/material.dart';
import 'package:out_of_context/controllers/game_controller.dart';
import 'package:out_of_context/controllers/players_controller.dart';
import 'package:out_of_context/utils/cache_service.dart';
import 'package:provider/provider.dart';

import 'views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheService.initPrefs();
  runApp(const OutOfContext());
}

class OutOfContext extends StatelessWidget {
  const OutOfContext({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PlayersController(),
        ),
        ChangeNotifierProvider(
          create: (context) => GameController(PlayersController()),
        )
      ],
      child: MaterialApp(
        home: HomeView(),
      ),
    );
  }
}
