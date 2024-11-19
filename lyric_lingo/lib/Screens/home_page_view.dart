import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget
{
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 53, 45, 57),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 53, 45, 57),
        leading: IconButton(
          icon: SizedBox(
          width: 40,  // Set the desired width of the icon
          height: 40, // Set the desired height of the icon
          child: Image.asset(
            'assets/lyric_lingo_logo.png',
            fit: BoxFit.contain,  // Ensures the image fits within the box
          ),
        ),
        onPressed: () {
            
        }),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(12.0),
            color:const  Color.fromARGB(255, 105, 95, 110),
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
                  color: Color.fromARGB(255, 237, 232, 221),
                  icon: const Icon(Icons.arrow_forward_ios_rounded)),
              ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(12.0),
              color:const  Color.fromARGB(255, 105, 95, 110),
              child: const Text(
              'weekly playlist',
              style: TextStyle(
                color: Color.fromARGB(255, 237, 232, 221), 
                fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(12.0),
              color:const  Color.fromARGB(255, 105, 95, 110),
              child: const Text(
              'artist highlight',
              style: TextStyle(color: Color.fromARGB(255, 237, 232, 221), fontSize: 20),
              ),
            ),
      ],),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 53, 45, 57),
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(
        color:  Color.fromARGB(255, 105, 95, 110),
        ),
        selectedItemColor: const Color.fromARGB(255, 105, 95, 110),
        unselectedItemColor: const Color.fromARGB(255, 237, 232, 221),
        items: const [
          BottomNavigationBarItem (
            icon: Icon(Icons.home, color: Color.fromARGB(255, 237, 232, 221)),
            label: 'Home', 
          ),
          BottomNavigationBarItem (
             icon: Icon(Icons.search, color: Color.fromARGB(255, 237, 232, 221)),
            label: 'Search',
          ),
          BottomNavigationBarItem (
             icon: Icon(Icons.sports_baseball_rounded, color: Color.fromARGB(255, 237, 232, 221)),
            label: 'Exercises',
          ),
          BottomNavigationBarItem (
             icon: Icon(Icons.person, color: Color.fromARGB(255, 237, 232, 221)),
            label: 'Profile',
          ),
        ]
      ),
    );
  }
}