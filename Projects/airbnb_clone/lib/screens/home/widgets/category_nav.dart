// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CategoryNav extends StatelessWidget {
  const CategoryNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 30),
      child: Column(children: [
        SizedBox(
          height: 43,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Column(children: [
                Image.asset('/images/fire.png', height: 20, width: 20),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Trending',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]),
              Column(children: [
                Image.asset('/images/palm-tree.png', height: 20, width: 20),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'island',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]),
              Column(children: [
                Image.asset('/images/cave.png', height: 20, width: 20),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Cave',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]),
              Column(children: [
                Image.asset('/images/cactus.png', height: 20, width: 20),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Desert',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]),
              Column(children: [
                Image.asset('/images/art.png', height: 20, width: 20),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Art',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]),
              Column(children: [
                Image.asset('/images/swimming-pool.png', height: 20, width: 20),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Swimming Pool',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]),
              Column(children: [
                Image.asset('/images/villa.png', height: 20, width: 20),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Villa',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]),
              Column(children: [
                Image.asset('/images/user.png', height: 20, width: 20),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'user',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]),
            ],
          ),
        )
      ]),
    );
  }
}
