import 'package:breaking_bad/business_logic/cubit/quotes/quotes_cubit.dart';
import 'package:breaking_bad/constants/app_colors.dart';
import 'package:breaking_bad/data/models/character_model.dart';
import 'package:breaking_bad/presentation/widgets/character_details/custom_sliver_app_bar.dart';
import 'package:breaking_bad/presentation/widgets/character_details/custom_sliver_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterDetailsScreen extends StatelessWidget {
  static const String routeName = '/character_details';
  final CharacterModel character;

  const CharacterDetailsScreen({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<QuotesCubit>(context).getCharacterQuotes(character.name);
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            CustomSliverAppBar(character: character),
            CustomSliverList(character: character),
          ],
        ),
      ),
    );
  }
}
