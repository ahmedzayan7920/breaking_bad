import 'package:breaking_bad/business_logic/cubit/characters/characters_cubit.dart';
import 'package:breaking_bad/business_logic/cubit/quotes/quotes_cubit.dart';
import 'package:breaking_bad/data/models/character_model.dart';
import 'package:breaking_bad/data/repositories/characters_repository.dart';
import 'package:breaking_bad/data/repositories/quotes_repository.dart';
import 'package:breaking_bad/data/web_services/characters_web_services.dart';
import 'package:breaking_bad/data/web_services/quotes_web_services.dart';
import 'package:breaking_bad/presentation/screens/character_details_screen.dart';
import 'package:breaking_bad/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;


  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CharactersScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );
      case CharacterDetailsScreen.routeName:
        final character = settings.arguments as CharacterModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => QuotesCubit(QuotesRepository(QuotesWebServices())),
            child: CharacterDetailsScreen(character: character),
          ),
        );
    }
    return null;
  }
}
