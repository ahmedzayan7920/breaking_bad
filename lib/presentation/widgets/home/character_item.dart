import 'package:breaking_bad/constants/app_colors.dart';
import 'package:breaking_bad/data/models/character_model.dart';
import 'package:breaking_bad/presentation/screens/character_details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final CharacterModel character;

  const CharacterItem({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        CharacterDetailsScreen.routeName,
        arguments: character,
      ),
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Hero(
          tag: character.charId,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: GridTile(
              footer: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: AppColors.footer,
                child: Text(
                  character.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: character.image,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.yellow,
                  ),
                ),
                errorWidget: (context, url, error) =>
                    Center(child: Text("$error")),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
