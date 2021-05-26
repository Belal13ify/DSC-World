import 'package:flutter/material.dart';

class ContinentContainer extends StatelessWidget {
  final String continent;
  final String imagePath;
  VoidCallback pressed;
  ContinentContainer(
      {required this.continent,
      required this.imagePath,
      required this.pressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressed,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Card(
          color: Color(0xff043551),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 35,
                child: Image.asset(imagePath),
              ),
              Text(continent,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
