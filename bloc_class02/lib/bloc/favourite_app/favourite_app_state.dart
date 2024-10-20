part of 'favourite_app_bloc.dart';

enum ListStatus { loeading, success, failure }

class FavouriteAppState extends Equatable {
  final ListStatus listStatus;
  final List<FavaouriteAppModel> items;
  final List<FavaouriteAppModel> tempitems;
  const FavouriteAppState(
      {this.items = const [],
      this.tempitems = const [],
      this.listStatus = ListStatus.loeading});

  FavouriteAppState copyWith(
      {List<FavaouriteAppModel>? items,
      List<FavaouriteAppModel>? tempitems,
      ListStatus? listStatus}) {
    return FavouriteAppState(
        items: items ?? this.items,
        listStatus: listStatus ?? this.listStatus,
        tempitems: tempitems ?? this.tempitems);
  }

  @override
  List<Object> get props => [items, listStatus, tempitems];
}
