import 'package:breaking_bad/business_logic/cubit/characters/characters_cubit.dart';
import 'package:breaking_bad/constants/app_colors.dart';
import 'package:breaking_bad/data/models/character_model.dart';
import 'package:breaking_bad/presentation/widgets/home/home_grid_view.dart';
import 'package:breaking_bad/presentation/widgets/home/offline_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

class CharactersScreen extends StatefulWidget {
  static const String routeName = '/';

  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  List<CharacterModel> allCharacters = [];
  List<CharacterModel> searchCharacters = [];
  late TextEditingController searchController;
  bool isSearching = false;

  @override
  void initState() {
    searchController = TextEditingController();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: isSearching
          ? AppBar(
              backgroundColor: AppColors.yellow,
              leading: IconButton(
                onPressed: () {
                  setState(() {
                    isSearching = false;
                  });
                },
                icon: const Icon(Icons.arrow_back),
                color: AppColors.grey,
              ),
              title: TextFormField(
                controller: searchController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search For Character ...",
                ),
                onChanged: (query) {
                  searchCharacters = allCharacters
                      .where(
                        (character) => character.name
                            .toLowerCase()
                            .startsWith(query.toLowerCase()),
                      )
                      .toList();
                  setState(() {});
                },
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    if (searchController.text.isEmpty) {
                      isSearching = false;
                    } else {
                      searchController.clear();
                    }
                    setState(() {});
                  },
                  icon: const Icon(Icons.close),
                  color: AppColors.grey,
                ),
              ],
            )
          : AppBar(
              backgroundColor: AppColors.yellow,
              title: const Text(
                "Characters",
                style: TextStyle(color: AppColors.grey),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = true;
                    });
                  },
                  icon: const Icon(Icons.search),
                  color: AppColors.grey,
                ),
              ],
            ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return BlocBuilder<CharactersCubit, CharactersState>(
              builder: (context, state) {
                if (state is CharactersLoaded) {
                  allCharacters = state.characters;
                  return HomeGridView(
                    allCharacters:
                        isSearching && searchController.text.isNotEmpty
                            ? searchCharacters
                            : allCharacters,
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(color: AppColors.yellow),
                  );
                }
              },
            );
          } else {
            return const OfflineWidget();
          }
        },
        child: const SizedBox.shrink(),
      ),
    );
  }
}
