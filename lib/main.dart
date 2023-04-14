import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test_app/bloc_character_by_id/bloc_list_id.dart';
import 'package:rick_and_morty_test_app/bloc_list/bloc_characters_list.dart';
import 'package:rick_and_morty_test_app/pages/characters_list_page.dart';
import 'package:rick_and_morty_test_app/repository/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CharacterListBloc>(
          create: (BuildContext context) => CharacterListBloc(
            ApiService(),
          ),
        ),
        BlocProvider<CharacterByIdBloc>(
          create: (context) => CharacterByIdBloc(
            ApiService(),
          ),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CharactersListPage(),
      ),
    );
  }
}
