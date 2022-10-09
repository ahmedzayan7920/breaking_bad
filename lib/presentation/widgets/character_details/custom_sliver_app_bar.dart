import 'package:breaking_bad/constants/app_colors.dart';
import 'package:breaking_bad/data/models/character_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  final CharacterModel character;

  const CustomSliverAppBar({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: AppColors.grey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.name,
          style: const TextStyle(color: AppColors.white),
        ),
        background: Hero(
          tag: character.charId,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: character.image,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(
                color: AppColors.yellow,
              ),
            ),
            errorWidget: (context, url, error) => Center(child: Text("$error")),
          ),
        ),
      ),
    );
  }
}
