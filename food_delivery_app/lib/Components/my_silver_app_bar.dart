import "package:flutter/material.dart";


class MySilverAppBar extends StatelessWidget
{
  final Widget child;
  final Widget title;

  MySilverAppBar({required this.child, required this.title});

  @override
  Widget build(BuildContext context)
  {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text("Dinner"),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: EdgeInsets.only(left: 0, right: 0, top: 0),
      ),
      actions: [
        Icon(Icons.shopping_bag_outlined)
      ],
    );
  }
}