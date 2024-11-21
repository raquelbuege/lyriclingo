import 'package:flutter/material.dart';
import 'package:lyric_lingo/Widgets/countdown.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 53, 45, 57),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              "LyricLingo",
              style: TextStyle(
                color: Color.fromRGBO(209, 123, 136, 0.929),
                fontSize: 54,
                fontFamily: 'Coolvetica',
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Hello User!",
                style: TextStyle(
                  fontSize: 40,
                  color: Color.fromARGB(255, 133, 121, 139),
                  fontFamily: 'Coolvetica',
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CountdownTimer(UniqueKey()),
                const Text(
                  "  until your next playlist...",
                  style: TextStyle(
                    color: Color.fromARGB(255, 133, 121, 139),
                    fontSize: 24,
                    fontFamily: 'Coolvetica',
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              color: const Color.fromARGB(255, 133, 121, 139),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                      childAspectRatio: 1,
                      children: [
                        Image.asset("assets/Images/album1.png"),
                        Image.asset("assets/Images/album2.png"),
                        Image.asset("assets/Images/album3.png"),
                        Image.asset("assets/Images/album4.png"),
                      ],
                    ),
                  ),
                  const Spacer(flex: 1),
                  const Text(
                    "Weekly Playlist",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 237, 232, 221),
                    ),
                  ),
                  const Spacer(flex: 1),
                  IconButton(
                      onPressed: () {
                        print("go into artist");
                      },
                      color: const Color.fromARGB(255, 237, 232, 221),
                      icon: const Icon(Icons.arrow_forward_ios_rounded)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              color: const Color.fromARGB(255, 133, 121, 139),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/Images/Kali.png",
                    width: 100,
                    height: 100,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "This week's artist",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 237, 232, 221),
                        ),
                      ),
                      Text(
                        "Kali Uchis",
                        style: TextStyle(
                          fontSize: 32,
                          color: Color.fromARGB(255, 53, 45, 57),
                        ),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        print("go into artist");
                      },
                      color: const Color.fromARGB(255, 237, 232, 221),
                      icon: const Icon(Icons.arrow_forward_ios_rounded)),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 53, 45, 57),
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(
            color: Color.fromARGB(255, 105, 95, 110),
          ),
          selectedItemColor: const Color.fromARGB(255, 105, 95, 110),
          unselectedItemColor: const Color.fromARGB(255, 237, 232, 221),
          items: const[
            BottomNavigationBarItem(
              icon:
                  Icon(Icons.home_filled, color: Color.fromARGB(255, 237, 232, 221)),
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