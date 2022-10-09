import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:breaking_bad/business_logic/cubit/quotes/quotes_cubit.dart';
import 'package:breaking_bad/constants/app_colors.dart';
import 'package:breaking_bad/data/models/character_model.dart';
import 'package:breaking_bad/data/models/quote_model.dart';
import 'package:breaking_bad/presentation/widgets/character_details/description_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSliverList extends StatelessWidget {
  final CharacterModel character;

  const CustomSliverList({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            margin: const EdgeInsets.all(14),
            padding: const EdgeInsets.all(14),
            height: MediaQuery.of(context).size.height - 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DescriptionItem(
                  title: "Nick Name",
                  jobs: character.nickname,
                ),
                DescriptionItem(
                  title: "Actor/Actress",
                  jobs: character.actorName,
                ),
                DescriptionItem(
                  title: "Job",
                  jobs: character.jobs.join(" / "),
                ),
                DescriptionItem(
                  title: "Appeared in",
                  jobs: character.category,
                ),
                character.appearance.isNotEmpty
                    ? DescriptionItem(
                        title: "Breaking Bad Seasons",
                        jobs: character.appearance.join(" / "),
                      )
                    : const SizedBox.shrink(),
                character.betterCallSaulAppearance.isNotEmpty
                    ? DescriptionItem(
                        title: "Better Call Saul Seasons",
                        jobs: character.betterCallSaulAppearance.join(" / "),
                      )
                    : const SizedBox.shrink(),
                DescriptionItem(
                  title: "Status",
                  jobs: character.status,
                ),
                const SizedBox(height: 20),
                BlocBuilder<QuotesCubit, QuotesState>(
                  builder: (context, state) {
                    if (state is QuotesLoaded) {
                      List<QuoteModel> quotes = state.quotes;
                      if (quotes.isNotEmpty) {
                        return DefaultTextStyle(
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 25,
                            color: AppColors.yellow,
                            shadows: [
                              Shadow(
                                blurRadius: 7.0,
                                color: AppColors.white,
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                          child: AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: quotes.map((quote) => FlickerAnimatedText(quote.quote)).toList(),
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.yellow,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
