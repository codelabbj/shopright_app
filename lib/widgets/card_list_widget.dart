import 'package:flutter/material.dart';

class CardListWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final List<Widget>? actions; // boutons en haut à droite
  final List<Widget>? buttons;
  final Widget child; // le contenu : grille ou table

  const CardListWidget({
    Key? key,
    this.title,
    this.subtitle,
    this.actions,
    this.buttons,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLight = theme.brightness == Brightness.light;
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: theme.dividerColor),
        boxShadow: isLight
            ? [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.2),
                  spreadRadius: 10,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ]
            : [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (buttons != null) Row(children: buttons!),
                  if (title != null)
                    Text(
                      title!,
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold),
                    ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(subtitle!, style: Theme.of(context).textTheme.displaySmall),
                  ],
                ],
              ),
              Spacer(),
              SizedBox(
                width: 10,
              ),
              if (actions != null) Row(children: actions!),
            ],
          ),
          const SizedBox(height: 16),

          // CONTENT
          Expanded(child: child),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(border: Border.all(color: theme.dividerColor), borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [
                    Text(
                      "Show: 2",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.swap_vert,
                      size: 18,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(border: Border.all(color: theme.dividerColor), borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.arrow_back,
                  size: 18,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(border: Border.all(color: theme.dividerColor), borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.more_horiz_outlined,
                  size: 18,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(color: theme.colorScheme.primary, borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "12",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold, color: theme.colorScheme.onPrimary),
                  )),
              SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(border: Border.all(color: theme.dividerColor), borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.arrow_forward,
                  size: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
