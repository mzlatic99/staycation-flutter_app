import 'package:flutter/material.dart';
import '../../assets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Staycaution'),
          actions: [Icon(Icons.search), Icon(Icons.more_vert)],
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Popular locations'),
                      TextButton(onPressed: () {}, child: Text('VIEW MORE'))
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.1,
                  child: GridView.count(
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    crossAxisCount: 2,
                    children: [
                      Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(Assets.images.london),
                                fit: BoxFit.cover,
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('London'),
                                Text('5103 properties')
                              ],
                            ),
                          )
                        ],
                      ),
                      Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              Assets.images.tokyo,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Tokyo'),
                                Text('5103 properties')
                              ],
                            ),
                          )
                        ],
                      ),
                      Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              Assets.images.barcelona,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Barcelona'),
                                Text('5103 properties')
                              ],
                            ),
                          )
                        ],
                      ),
                      Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              Assets.images.newYork,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('New York'),
                                Text('5103 properties')
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Homes guests love'),
                      TextButton(onPressed: () {}, child: Text('VIEW MORE'))
                    ],
                  ),
                ),
                SizedBox(
                  height: 316,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                Assets.images.barcelona,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text('Sugar & Spice Apartments'),
                            Text('Split'),
                            Text('EUR 75'),
                            Row(
                              children: [
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star)
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                Assets.images.barcelona,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text('Sugar & Spice Apartments'),
                            Text('Split'),
                            Text('EUR 75'),
                            Row(
                              children: [
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star)
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                Assets.images.barcelona,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text('Sugar & Spice Apartments'),
                            Text('Split'),
                            Text('EUR 75'),
                            Row(
                              children: [
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star)
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'My Bookings'),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: 'My Places')
        ]),
      ),
    );
  }
}
