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
      child: Card(
        color: Color(0xff043551),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
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
