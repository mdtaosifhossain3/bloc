part of 'favourite_app_bloc.dart';

abstract class FavouriteAppEvent extends Equatable {
  const FavouriteAppEvent();

  @override
  List<Object> get props => [];
}

class FavouriteList extends FavouriteAppEvent {}

class FavouriteITemEvent extends FavouriteAppEvent {
  final FavaouriteAppModel favaouriteAppModel;
  const FavouriteITemEvent({required this.favaouriteAppModel});
}

class SelectItemEvent extends FavouriteAppEvent {
  final FavaouriteAppModel favaouriteAppModel;
  const SelectItemEvent({required this.favaouriteAppModel});
}

class UnSelectItemEvent extends FavouriteAppEvent {
  final FavaouriteAppModel favaouriteAppModel;
  const UnSelectItemEvent({required this.favaouriteAppModel});
}

class DeleteItemEvent extends FavouriteAppEvent {}
