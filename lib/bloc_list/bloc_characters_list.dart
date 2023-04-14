import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test_app/bloc_list/bloc_list_event.dart';
import 'package:rick_and_morty_test_app/bloc_list/bloc_list_state.dart';
import 'package:rick_and_morty_test_app/repository/api_service.dart';

class CharacterListBloc extends Bloc<CharacterListEvent, CharacterListState> {
  final ApiService apiService;

  CharacterListBloc(this.apiService) : super(CharacterListLoading()) {
    on<LoadCharacterListEvent>(
      (event, emit) async {
        emit(CharacterListLoading());
        try {
          final charactersList = await apiService.fetchResultCharacters();
          emit(CharacterListLoaded(charactersList!));
        } catch (e) {
          emit(CharacterListError(e.toString()));
        }
      },
    );
  }

  Future<void> refreshCharactersList() async {
    await apiService.fetchResultCharacters();
  }
}
