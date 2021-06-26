import 'package:flutter/material.dart';

//this is a class widget to show the continent container instead of creating it many times
class ContinentContainer extends StatelessWidget {
  final String continent;
  final String imagePath;
  final VoidCallback pressed;
  ContinentContainer(
      {required this.continent,
      required this.imagePath,
      required this.pressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressed,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.4,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          color: Color(0xff043551),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 30,
              child: Image.asset(imagePath),
            ),
            Text(continent,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
