import 'package:flutter/material.dart';
import 'package:sick_child/ui/widgets/drawer.widget.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[600],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // leading: const Icon(Icons.menu),
            title: const Text("Les enfants malades"),
            expandedHeight: 100,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: const Color.fromARGB(255, 228, 106, 147),
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/consultation");
                },
                child: Container(
                  height: 40.h,
                  color: Colors.blue[300],
                  child: Image.network(
                    "https://th.bing.com/th/id/OIP.RGiQW9FfB6j7cihyHGiegAAAAA?pid=ImgDet&rs=1",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          )),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 40.h,
                color: Colors.blue[300],
                child: Image.network(
                  "https://i.notrefamille.com/800x500/smart/2015/08/05/57049-original.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 400,
                color: Colors.blue[300],
                child: Image.network(
                  "https://th.bing.com/th/id/OIP.GMFtzdoyWNLRfPGtwgZGJgHaH3?pid=ImgDet&rs=1",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )),
        ],
      ),
      drawer: const DrawerWidget(),
    );
  }
}
