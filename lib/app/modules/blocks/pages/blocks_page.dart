import 'package:flutter/material.dart';
import 'package:smartlock_app/app/modules/blocks/widgets/card_block_widget.dart';
import 'package:smartlock_app/constants/block_constants.dart';
import 'package:smartlock_app/core/configs/app_colors.dart';
import 'package:smartlock_app/core/configs/app_images.dart';

class BlocksPage extends StatelessWidget {
  const BlocksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: theme.background,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(
              'Blocos',
              style: textTheme.bodyMedium!.copyWith(
                color: kWhite,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            floating: true,
            expandedHeight: 30,
            backgroundColor: theme.primary,
            stretch: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0).copyWith(top: 24.0, bottom: 120),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CardBlockWidget(
                    block: BlocksConstant.blocks[index],
                    image: AppImages.bloco,
                  ),
                ),
                childCount: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
