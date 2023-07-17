import 'package:flutter/material.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final Size size;
  final VoidCallback onTap;
  final String label;
  final bool loading;
  const PrimaryButtonWidget({
    super.key,
    required this.size,
    required this.onTap,
    required this.label,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Ink(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(color: theme.primary),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: textTheme.bodyMedium!
                      .copyWith(color: theme.background, fontSize: 14),
                ),
                if (loading) ...[
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor: theme.background,
                        strokeWidth: 1.5,
                      ),
                    ),
                  )
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
