import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test_app/bloc_character_by_id/bloc_event_id.dart';
import 'package:rick_and_morty_test_app/bloc_character_by_id/bloc_list_id.dart';
import 'package:rick_and_morty_test_app/bloc_character_by_id/bloc_state_id.dart';
import 'package:rick_and_morty_test_app/pages/error_image.dart';
import 'package:rick_and_morty_test_app/pages/error_screen.dart';
import 'package:rick_and_morty_test_app/repository/api_service.dart';

class CharacterByidPage extends StatelessWidget {
  final int id;
  const CharacterByidPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CharacterByIdBloc(ApiService())
          ..add(
            GetCharacterById(id),
          ),
        child: BlocBuilder<CharacterByIdBloc, CharacterByIdState>(
          builder: (context, state) {
            if (state is CharacterByIdLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CharacterByIdLoaded) {
              return Center(
                child: Card(
                  child: CachedNetworkImage(
                    imageUrl: state.sigleCharacterId.image,
                    fit: BoxFit.fill,
                    imageBuilder: (context, image) {
                      return SizedBox(
                        width: double.infinity,
                        height: 280,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                    errorWidget: (context, url, Object? error) =>
                        const ErrorImage(),
                  ),
                ),
              );
            } else if (state is CharacterByIdError) {
              return const ErrorScreen();
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
