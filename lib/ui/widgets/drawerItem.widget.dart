import 'package:flutter/material.dart';

class DrawerItemWidget extends StatelessWidget {
  final String title;
  final IconData leading;
  final Function onAction;
  const DrawerItemWidget(
      {Key? key,
      required this.title,
      required this.leading,
      required this.onAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(leading),
      onTap: () => onAction(),
    );
  }
}
