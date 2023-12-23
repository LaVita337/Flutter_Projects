import 'package:flutter/material.dart';

class TripSearchBar extends StatelessWidget {
  TripSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        decoration: BoxDecoration(
            boxShadow: const [],
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: Colors.grey, width: 0.2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.search),
                SizedBox(
                  width: 5,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 230,
                      child: TextField(
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '여행지를 입력하세요',
                          hintStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        '언제.언디서나 게스트를 추가하세요',
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 25,
            ),
            Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  'images/filter.png',
                  height: 20,
                  width: 20,
                ))
          ],
        ),
      ),
    );
  }
}
