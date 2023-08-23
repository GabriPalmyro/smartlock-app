import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:smartlock_app/app/data/model/next_class.dart';
import 'package:smartlock_app/utils/helper/datetime.dart';

class NextClassesWidget extends StatelessWidget {
  final List<NextClass> nextclasses;
  const NextClassesWidget({super.key, required this.nextclasses});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context).colorScheme;
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.95,
      decoration: BoxDecoration(
        color: theme.background,
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Próximas Aulas',
            style: textTheme.bodyMedium!.copyWith(color: theme.surface),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Column(
            children: List.generate(
              nextclasses.length,
              (index) => Container(
                decoration: BoxDecoration(
                    border: Border.all(color: theme.primary.withOpacity(0.6)),
                    borderRadius: BorderRadius.circular(8)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                margin: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        nextclasses[index].name,
                        style: textTheme.bodyMedium!,
                      ),
                    ),
                    const SizedBox(width: 24.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          convertDateTimeToString(DateTime.now().add(Duration(
                              days: (nextclasses[index].dayOffTheWeek -
                                      DateTime.now().weekday)
                                  .abs()))),
                          style: textTheme.bodySmall!.copyWith(
                              fontSize: 10,
                              color: theme.primary.withOpacity(0.6)),
                        ),
                        const SizedBox(height: 2.0),
                        Row(
                          children: [
                            Text(
                              '${convertDateTimeToStringTime(nextclasses[index].initialTime)} - ',
                              style: textTheme.bodyMedium!.copyWith(
                                  fontSize: 14,
                                  color: theme.primary.withOpacity(0.8),
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              convertDateTimeToStringTime(
                                  nextclasses[index].endTime),
                              style: textTheme.bodyMedium!.copyWith(
                                  fontSize: 14,
                                  color: theme.primary.withOpacity(0.8),
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
