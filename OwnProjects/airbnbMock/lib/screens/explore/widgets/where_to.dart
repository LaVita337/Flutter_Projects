import 'package:flutter/material.dart';

class WhereTo extends StatelessWidget {
  const WhereTo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        decoration: BoxDecoration(
            boxShadow: const [],
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: Colors.grey, width: 0.2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Icon(Icons.search),
                SizedBox(
                  width: 5,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 210,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '어디로 가시나요?',
                          hintStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 25,
            ),
            Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20)),
                child: Image.asset(
                  'assets/images/filter.png',
                  height: 20,
                  width: 20,
                ))
          ],
        ),
      ),
    );
  }
}
