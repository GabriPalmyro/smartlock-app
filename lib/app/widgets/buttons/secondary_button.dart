import 'package:flutter/material.dart';

class SecondaryButtonWidget extends StatelessWidget {
  final Size size;
  final VoidCallback onTap;
  final String label;
  const SecondaryButtonWidget({
    super.key,
    required this.size,
    required this.onTap,
    required this.label,
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
            decoration: BoxDecoration(
              color: theme.background,
              border: Border.all(color: theme.primary, width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                label,
                style: textTheme.bodyMedium!.copyWith(fontSize: 14),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
