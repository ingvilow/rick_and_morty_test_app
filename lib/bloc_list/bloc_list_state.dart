

import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_test_app/models/list_characters.dart';

abstract class CharacterListState extends Equatable{
  @override
  List<Object?> get props => [];

}
class CharacterListLoading extends CharacterListState{}

class CharacterListLoaded extends CharacterListState{
  final CharactersList charactersList;
  CharacterListLoaded(this.charactersList);
}


class CharacterListError extends CharacterListState{
  CharacterListError(this.messageError);
  final String messageError;

  @override
  List<Object?> get props => [messageError];
}