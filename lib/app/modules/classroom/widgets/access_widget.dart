import 'package:flutter/material.dart';
import 'package:smartlock_app/app/data/model/access.dart';
import 'package:smartlock_app/utils/helper/datetime.dart';

class AccessWidget extends StatelessWidget {
  final List<Access> access;
  const AccessWidget({super.key, required this.access});

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
            'Últimos Acessos',
            style: textTheme.bodyMedium!.copyWith(color: theme.surface),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Column(
            children: List.generate(
              access.length > 3 ? 3 : access.length,
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
                    Text(
                      'Murilo Varges',
                      style: textTheme.bodyMedium!,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          convertDateTimeToString(access[index].openTime),
                          style: textTheme.bodySmall!.copyWith(
                              fontSize: 11,
                              color: theme.primary.withOpacity(0.6)),
                        ),
                        const SizedBox(height: 2.0),
                        Row(
                          children: [
                            Text(
                              '${convertDateTimeToStringTime(access[index].openTime)} - ',
                              style: textTheme.bodyMedium!.copyWith(
                                  fontSize: 14,
                                  color: theme.primary.withOpacity(0.8),
                                  fontWeight: FontWeight.w500),
                            ),
                            if (access[index].closeTime != null) ...[
                              Text(
                                convertDateTimeToStringTime(
                                    access[index].closeTime!),
                                style: textTheme.bodyMedium!.copyWith(
                                    fontSize: 14,
                                    color: theme.primary.withOpacity(0.8),
                                    fontWeight: FontWeight.w500),
                              ),
                            ] else ...[
                              Text(
                                'Em Aberto',
                                style: textTheme.bodyMedium!.copyWith(
                                    fontSize: 12, color: theme.surface),
                              ),
                            ]
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
