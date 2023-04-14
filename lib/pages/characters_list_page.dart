import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test_app/bloc_list/bloc_characters_list.dart';
import 'package:rick_and_morty_test_app/bloc_list/bloc_list_event.dart';
import 'package:rick_and_morty_test_app/bloc_list/bloc_list_state.dart';
import 'package:rick_and_morty_test_app/pages/character_by_id_page.dart';
import 'package:rick_and_morty_test_app/pages/error_screen.dart';
import 'package:rick_and_morty_test_app/pages/grid_characters_list.dart';
import 'package:rick_and_morty_test_app/repository/api_service.dart';

class CharactersListPage extends StatefulWidget {
  const CharactersListPage({Key? key}) : super(key: key);

  @override
  State<CharactersListPage> createState() => _CharactersListPageState();
}

class _CharactersListPageState extends State<CharactersListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Все персонажи"),
      ),
      body: BlocProvider(
        create: (context) =>
            CharacterListBloc(ApiService())..add(LoadCharacterListEvent()),
        child: BlocBuilder<CharacterListBloc, CharacterListState>(
          builder: (context, state) {
            if (state is CharacterListLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CharacterListError) {
              return const ErrorScreen();
            } else if (state is CharacterListLoaded) {
              return RefreshIndicator(
                triggerMode: RefreshIndicatorTriggerMode.onEdge,
                displacement: 250,
                onRefresh: () =>
                    context.read<CharacterListBloc>().refreshCharactersList(),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: state.charactersList.results.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => CharacterByidPage(
                              id: state.charactersList.results[index].id ?? 0,
                            ),
                          ),
                        );
                      },
                      child: GridCharacterList(
                        imageResult: state.charactersList.results[index],
                      ),
                    );
                  },
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
