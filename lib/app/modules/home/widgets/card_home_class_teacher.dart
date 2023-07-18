import 'package:flutter/material.dart';
import 'package:smartlock_app/app/data/model/class.dart';
import 'package:smartlock_app/core/configs/app_colors.dart';
import 'package:smartlock_app/utils/helper/datetime.dart';

class CardHomeClassTeacher extends StatelessWidget {
  final Course classe;
  const CardHomeClassTeacher({super.key, required this.classe});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: theme.primary.withOpacity(0.25),
            blurRadius: 11,
            spreadRadius: -1,
            offset: const Offset(-1, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                classe.subject,
                style: textTheme.bodyLarge!.copyWith(fontSize: 14),
              ),
              const SizedBox(height: 6.0),
              Text(
                '${convertDateTimeToStringTime(classe.initialTimeClass)} - ${convertDateTimeToStringTime(classe.endTimeClass)}',
                style: textTheme.bodySmall!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: theme.primary.withOpacity(0.8)),
              ),
              const SizedBox(height: 6.0),
              Row(
                children: [
                  Text(
                    'Sala: ',
                    style: textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: theme.primary.withOpacity(0.8)),
                  ),
                  Text(
                    '${classe.classroom.block.toUpperCase()}${classe.classroom.name.toUpperCase()}',
                    style: textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: theme.primary.withOpacity(0.8)),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 2,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: theme.primary),
              padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 3.0),
              child: Center(
                child: Text(
                  'Abrir',
                  style: textTheme.bodySmall!.copyWith(
                      color: kWhite, fontSize: 10, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
