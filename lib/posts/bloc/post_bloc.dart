import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/posts/bloc/post_event.dart';
import 'package:flutter_tutorial/posts/bloc/post_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PostBloc extends Bloc<PostEvents, PostStates> {
  List<dynamic> data = [];

  //PostBloc() : super(InitialState()) {
  //  on<ApiPostEvent>(onApiPostEvent){
//
  //  };
  //}
  PostBloc() : super(InitialState()) {
    on<ApiPostEvent>(
      (event, emit) async {
        emit(UpdateState(data));
      },
    );
  }
  void onApiPostEvent(ApiPostEvent event, Emitter<PostStates> emit) async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      data = convert.jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
    emit(UpdateState(data));
  }
}
