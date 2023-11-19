import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/constant/colors.dart';
import '../../cubits_logic/cubit/characters_cubit.dart';
import '../shared/widgets/custom_loading.dart';
import '../shared/widgets/home/home_page_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      body: buildBlocWidget(),
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
      if (state is CharactersLoaded) {
        return HomePageBody(characters: (state).characters);
      } else {
        return const CustomLoading();
      }
    });
  }
}
