import 'package:airbnb_clone/screens/home/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 91,
        child: BottomAppBar(
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(children: [
                    Icon(
                      Icons.search,
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('탐색',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w500))
                  ]),
                  Column(children: [
                    Icon(
                      Icons.search,
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('위시리스트',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w500))
                  ]),
                  Column(children: [
                    Image.asset(
                      'images/airbnbLogo01.png',
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('여행',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w500))
                  ]),
                  Column(children: [
                    Image.asset(
                      'images/airbnbLogo02.png',
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('채팅',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w500))
                  ]),
                  Column(children: [
                    Image.asset(
                      'images/user.png',
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('프로필',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w500))
                  ]),
                ]),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            TripSearchBar(),
            CategoryNav(),
            SizedBox(
              height: 20,
            ),
            Divider(
              height: 0,
            ),
            TripCard(),
          ]),
        ),
      ),
    );
  }
}
