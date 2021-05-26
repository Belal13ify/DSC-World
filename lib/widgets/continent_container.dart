import 'package:flutter/material.dart';

class ContinentContainer extends StatelessWidget {
  final String continent;
  final String imagePath;
  ContinentContainer({required this.continent, required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
