import 'package:breaking_bad/constants/app_colors.dart';
import 'package:flutter/material.dart';

class DescriptionItem extends StatelessWidget {
  final String title;
  final String jobs;

  const DescriptionItem({
    Key? key,
    required this.title,
    required this.jobs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: [
             TextSpan(
              text: title,
              style: const TextStyle(
                color: AppColors.yellow,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            const TextSpan(
              text: " : ",
              style: TextStyle(
                color: AppColors.yellow,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: jobs,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
