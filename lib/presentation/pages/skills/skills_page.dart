import 'package:flutter/material.dart';
import 'package:nahid_hasan_noyon/core/theme/app_theme.dart';
import 'package:nahid_hasan_noyon/core/utils/responsive.dart';
import 'package:nahid_hasan_noyon/data/models/portfolio_data.dart';
import 'package:nahid_hasan_noyon/data/portfolio_content.dart';
import 'package:nahid_hasan_noyon/presentation/widgets/common/common_widgets.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(
        Responsive.getValue(context, mobile: 15, tablet: 30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ArticleTitle(title: 'Skills'),
          const SizedBox(height: 30),

          _buildSkills(context),
        ],
      ),
    );
  }

  Widget _buildSkills(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Technical skills', style: AppTextStyles.h3),
        const SizedBox(height: 20),
        GradientBox(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: PortfolioContent.skills.map((skill) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: _SkillBar(skill: skill),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _SkillBar extends StatelessWidget {
  const _SkillBar({required this.skill});
  final SkillItem skill;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(skill.name, style: AppTextStyles.h5),
            Text(
              '${skill.percentage}%',
              style: AppTextStyles.bodyText.copyWith(fontSize: 13),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 8,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.jet,
            borderRadius: BorderRadius.circular(10),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: skill.percentage / 100,
            child: Container(
              decoration: BoxDecoration(
                gradient: AppColors.textGradientYellow,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
