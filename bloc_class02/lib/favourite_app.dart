import 'package:bloc_class02/bloc/favourite_app/favourite_app_bloc.dart';
import 'package:bloc_class02/models/favaourite_app_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteApp extends StatefulWidget {
  const FavouriteApp({super.key});

  @override
  State<FavouriteApp> createState() => _FavouriteAppState();
}

class _FavouriteAppState extends State<FavouriteApp> {
  @override
  void initState() {
    context.read<FavouriteAppBloc>().add(FavouriteList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite App"),
        centerTitle: true,
        actions: [
          BlocBuilder<FavouriteAppBloc, FavouriteAppState>(
              builder: (context, state) {
            return Visibility(
              visible: state.tempitems.isEmpty ? false : true,
              child: IconButton(
                  onPressed: () {
                    context.read<FavouriteAppBloc>().add(DeleteItemEvent());
                  },
                  icon: const Icon(Icons.delete)),
            );
          })
        ],
      ),
      body: BlocBuilder<FavouriteAppBloc, FavouriteAppState>(
        builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.loeading:
              return const Center(child: CircularProgressIndicator());
            case ListStatus.success:
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      tileColor: Colors.teal,
                      leading: Checkbox(
                        value: state.tempitems.contains(state.items[index])
                            ? true
                            : false,
                        onChanged: (val) {
                          if (val!) {
                            context.read<FavouriteAppBloc>().add(
                                SelectItemEvent(
                                    favaouriteAppModel: state.items[index]));
                          } else {
                            context.read<FavouriteAppBloc>().add(
                                UnSelectItemEvent(
                                    favaouriteAppModel: state.items[index]));
                          }
                        },
                      ),
                      title: Text(state.items[index].value),
                      trailing: IconButton(
                          onPressed: () {
                            FavaouriteAppModel favaouriteAppModel =
                                FavaouriteAppModel(
                                    id: state.items[index].id,
                                    value: state.items[index].value,
                                    isFavourite: state.items[index].isFavourite
                                        ? false
                                        : true);
                            context.read<FavouriteAppBloc>().add(
                                FavouriteITemEvent(
                                    favaouriteAppModel: favaouriteAppModel));
                          },
                          icon: Icon(state.items[index].isFavourite
                              ? Icons.favorite
                              : Icons.favorite_outline)),
                    ),
                  );
                },
              );

            case ListStatus.failure:
              return const Text("Something went wrong");
          }
        },
      ),
    );
  }
}
