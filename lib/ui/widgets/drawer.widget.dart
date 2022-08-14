import 'package:flutter/material.dart';
import 'package:sick_child/ui/widgets/drawerHeader.widget.dart';
import 'package:sick_child/ui/widgets/drawerItem.widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const MyDrawerHeader(),
          ListView(
            children: [
              DrawerItemWidget(
                title: "Ajouter Enfant",
                leading: Icons.add,
                onAction: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/ajouterEnfant");
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
