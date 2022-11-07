import 'package:flutter/material.dart';
import 'package:sick_child/ui/widgets/drawer.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Enfant"),
        ),
        //drawer: const DrawerWidget(),
        body: Container(
            padding:
                const EdgeInsets.all(20),
            child: Column(
              
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/consultation");
                  },
                  child: Container(
                    height: 200.0,
                    decoration: const BoxDecoration(
                        color: Colors.yellow,
                        image: DecorationImage(
                            image: AssetImage('images/consultation.png'),
                            // prendre l'adaptation de limage
                            fit: BoxFit.contain),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                   onTap: () {
                    Navigator.pushNamed(context, "/hospitalisation");
                  },
                  child: Container(
                    height: 200.0,
                    decoration: const BoxDecoration(
                        color: Colors.yellow,
                        image: DecorationImage(
                            image: AssetImage('images/hospitalise.png'),
                            // prendre l'adaptation de limage
                            fit: BoxFit.contain),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 200.0,
                  decoration: const BoxDecoration(
                      color: Colors.yellow,
                      image: DecorationImage(
                          image: AssetImage('images/rip.png'),
                          // prendre l'adaptation de limage
                          fit: BoxFit.contain),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                ),
              ],
            )),
        drawer: const DrawerWidget());
  }
}
