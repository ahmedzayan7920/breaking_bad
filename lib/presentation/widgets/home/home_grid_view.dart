import 'package:breaking_bad/data/models/character_model.dart';
import 'package:breaking_bad/presentation/widgets/home/character_item.dart';
import 'package:flutter/material.dart';

class HomeGridView extends StatelessWidget {
  final List<CharacterModel> allCharacters;

  const HomeGridView({
    Key? key,
    required this.allCharacters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: allCharacters.length,
      itemBuilder: (BuildContext context, int index) {
        return CharacterItem(character: allCharacters[index]);
      },
    );
  }
}
