import 'package:bloc/bloc.dart';
import 'package:bloc_class02/models/favaourite_app_model.dart';
import 'package:bloc_class02/repo/favourite_app_repo.dart';
import 'package:equatable/equatable.dart';

part 'favourite_app_event.dart';
part 'favourite_app_state.dart';

class FavouriteAppBloc extends Bloc<FavouriteAppEvent, FavouriteAppState> {
  List<FavaouriteAppModel> _list = [];
  final List<FavaouriteAppModel> _templist = [];
  FavouriteAppRepo favouriteAppRepo;
  FavouriteAppBloc(this.favouriteAppRepo) : super(const FavouriteAppState()) {
    on<FavouriteList>((event, emit) async {
      _list = await favouriteAppRepo.fetchItem();

      emit(state.copyWith(
          items: List.from(_list), listStatus: ListStatus.success));
    });

    on<FavouriteITemEvent>((event, emit) {
      final index =
          _list.indexWhere((elm) => elm.id == event.favaouriteAppModel.id);

      if (event.favaouriteAppModel.isFavourite) {
        if (_templist.contains(_list[index])) {
          _templist.remove(_list[index]);
          _templist.add(event.favaouriteAppModel);
        }
      } else {
        if (_templist.contains(_list[index])) {
          _templist.remove(_list[index]);
          _templist.add(event.favaouriteAppModel);
        }
      }

      _list[index] = event.favaouriteAppModel;

      emit(state.copyWith(
          items: List.from(_list), tempitems: List.from(_templist)));
    });

    on<SelectItemEvent>((event, emit) {
      _templist.add(event.favaouriteAppModel);

      emit(state.copyWith(tempitems: List.from(_templist)));
    });

    on<UnSelectItemEvent>((event, emit) {
      _templist.remove(event.favaouriteAppModel);

      emit(state.copyWith(tempitems: List.from(_templist)));
    });

    on<DeleteItemEvent>((event, emit) {
      for (var i = 0; i < _templist.length; i++) {
        _list.remove(_templist[i]);
      }
      _templist.clear();

      emit(state.copyWith(
          tempitems: List.from(_templist), items: List.from(_list)));
    });
  }
}
