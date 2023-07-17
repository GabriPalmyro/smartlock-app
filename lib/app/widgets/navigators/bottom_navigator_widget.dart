import 'package:flutter/material.dart';

class BottomNavigatorWidget extends StatelessWidget {
  const BottomNavigatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Center(
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.9,
          decoration: BoxDecoration(
            color: theme.background,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 2)
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton.outlined(
                  onPressed: () {},
                  icon: Icon(
                    Icons.home_rounded,
                    color: theme.primary,
                  )),
              IconButton.outlined(
                  onPressed: () {},
                  icon: Icon(
                    Icons.pin_drop_rounded,
                    color: theme.primary.withOpacity(0.3),
                  )),
              IconButton.outlined(
                  onPressed: () {},
                  icon: Icon(
                    Icons.book,
                    color: theme.primary.withOpacity(0.3),
                  )),
              IconButton.outlined(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person,
                    color: theme.primary.withOpacity(0.3),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
