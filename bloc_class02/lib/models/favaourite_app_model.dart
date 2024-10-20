import 'package:equatable/equatable.dart';

class FavaouriteAppModel extends Equatable {
  const FavaouriteAppModel({
    required this.id,
    required this.value,
    this.isDeleting = false,
    this.isFavourite = false,
  });

  final String id;
  final String value;
  final bool isDeleting;
  final bool isFavourite;

  FavaouriteAppModel copyWith(
      {String? id, String? value, bool? isDeleting, bool? isFavourite}) {
    return FavaouriteAppModel(
      id: id ?? this.id,
      value: value ?? this.value,
      isDeleting: isDeleting ?? this.isDeleting,
      isFavourite: isDeleting ?? this.isFavourite,
    );
  }

  @override
  List<Object> get props => [id, value, isDeleting, isFavourite];
}
