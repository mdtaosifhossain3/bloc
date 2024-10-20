import 'package:bloc_class02/models/favaourite_app_model.dart';

class FavouriteAppRepo {
  get id => null;

  get value => null;

  Future<List<FavaouriteAppModel>> fetchItem() async {
    Future.delayed(const Duration(seconds: 3));

    return List.of(_generate(10));
  }

  List<FavaouriteAppModel> _generate(int len) {
    return List.generate(
        len, (index) => FavaouriteAppModel(id: "$index", value: "Item $index"));
  }
}
