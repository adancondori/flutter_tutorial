class PokemonStates {}

class InitialState extends PokemonStates {}

class UpdateState extends PokemonStates {
  List<dynamic> data = [];
  UpdateState(this.data);
}
