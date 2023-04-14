import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test_app/bloc_character_by_id/bloc_event_id.dart';
import 'package:rick_and_morty_test_app/bloc_character_by_id/bloc_state_id.dart';
import 'package:rick_and_morty_test_app/repository/api_service.dart';

class CharacterByIdBloc extends Bloc<GetCharacterById, CharacterByIdState> {
  final ApiService apiService;

  CharacterByIdBloc(this.apiService) : super(CharacterByIdLoading()) {
    on<GetCharacterById>(
      (event, emit) async {
        emit(CharacterByIdLoading());
        try {
          final charactersById =
              await apiService.fetchResultCharactersById(event.id);
          emit(CharacterByIdLoaded(charactersById!));
        } catch (e) {
          emit(CharacterByIdError(e.toString()));
        }
      },
    );
  }
}
