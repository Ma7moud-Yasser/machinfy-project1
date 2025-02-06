import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  TextEditingController searchController = TextEditingController();
  void search(String query) {
    emit(SearchLoading());

    emit(SearchSuccess());
  }
}
