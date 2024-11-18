import 'package:flutter/material.dart';
import 'package:lyric_lingo/Widgets/countdown_timer.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 53, 45, 57),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 53, 45, 57),
        leadingWidth: 10000,
        leading: Image.asset(
            'assets/lyric_lingo_logo.png',
            fit: BoxFit.contain,
            alignment: Alignment.centerLeft 
            // Ensures the image fits within the box
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Hello User!",
                style: TextStyle(
                  fontSize: 40,
                  color: Color.fromARGB(255, 237, 232, 221),
                ),
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 105, 95, 110),
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.all(20),
              child: CountdownTimer(UniqueKey()),
            ),
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(12.0),
            color: const Color.fromARGB(255, 105, 95, 110),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    children: [
                      Image.asset("assets/Images/album1.png"),
                      Image.asset("assets/Images/album2.png"),
                      Image.asset("assets/Images/album3.png"),
                      Image.asset("assets/Images/album4.png"),
                    ],
                  ),
                ),
                const Text(
                  "Weekly Playlist",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 237, 232, 221),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      print("go into playlist");
                    },
                    color: const Color.fromARGB(255, 237, 232, 221),
                    icon: const Icon(Icons.arrow_forward_ios_rounded)),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(12.0),
            color: const Color.fromARGB(255, 105, 95, 110),
            child: const Text(
              'artist highlight',
              style: TextStyle(
                  color: Color.fromARGB(255, 237, 232, 221), fontSize: 20),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 53, 45, 57),
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(
            color: Color.fromARGB(255, 105, 95, 110),
          ),
          selectedItemColor: const Color.fromARGB(255, 105, 95, 110),
          unselectedItemColor: const Color.fromARGB(255, 237, 232, 221),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color.fromARGB(255, 237, 232, 221)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon:
                  Icon(Icons.search, color: Color.fromARGB(255, 237, 232, 221)),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_baseball_rounded,
                  color: Color.fromARGB(255, 237, 232, 221)),
              label: 'Exercises',
            ),
            BottomNavigationBarItem(
              icon:
                  Icon(Icons.person, color: Color.fromARGB(255, 237, 232, 221)),
              label: 'Profile',
            ),
          ]),
    );
  }
}