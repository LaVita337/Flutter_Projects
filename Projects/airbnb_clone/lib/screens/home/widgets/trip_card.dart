// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TripCard extends StatelessWidget {
  TripCard({super.key});

  final Image img_0 = Image.asset('images/seoul.webp');
  final Image img_1 = Image.asset('images/busan.webp');
  final Image img_2 = Image.asset('images/chuncheon.webp');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30, left: 30, right: 30),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/seoul');
            },
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Stack(
                children: <Widget>[
                  Container(
                      height: 380,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: img_0.image, fit: BoxFit.cover),
                      )),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Seoul, Republic of Korea',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '5.0',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '15km',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '6월 1-15일',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        r'97.67$',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '/1day',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ]),
          ),
          SizedBox(
            height: 30,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(
              children: <Widget>[
                Container(
                    height: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: img_1.image, fit: BoxFit.cover),
                    )),
                Positioned(
                  top: 20,
                  right: 20,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Busan, Republic of Korea',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '5.0',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Text(
                  '330km',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '9월 1-15일',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      r'97.67$',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      '/1day',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            )
          ]),
          SizedBox(
            height: 30,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(
              children: <Widget>[
                Container(
                    height: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: img_2.image, fit: BoxFit.cover),
                    )),
                Positioned(
                  top: 20,
                  right: 20,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'chuncheon, Republic of Korea',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '5.0',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Text(
                  '70km',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '7월 1-15일',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      r'50.67$',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      '/1day',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            )
          ]),
          SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }
}
