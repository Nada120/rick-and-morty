import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/screens/details_page.dart';
import '../cubits_logic/cubit/search_character_cubit.dart';
import '../cubits_logic/cubit/characters_cubit.dart';
import '../data/repository/character_repository.dart';
import '../data/services/character_services.dart';
import 'screens/home_page.dart';
import 'screens/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CharactersCubit(
            CharacterRepository(CharacterServices()),
          )..getAllCharacters(),
        ),
        BlocProvider(
            create: (context) => SearchCharacterCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'RICk & MORTY',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (_) =>  const HomePage(),
          'search': (_) => const SearchPage(),
          'detail': (_) => const DetailsPage(),
        },
      ),
    );
  }
}
