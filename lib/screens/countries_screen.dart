import 'package:flutter/material.dart';
import '../widgets/single_country_container.dart';

class Countries extends StatelessWidget {
  final String continent;
  final List countries;
  Countries({required this.continent, required this.countries});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: CircleAvatar(
                    backgroundColor: Color(0xff043551),
                    radius: 20,
                    child: BackButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  continent,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      color: Color(0xff043551),
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 35,
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: countries.length,
                  itemBuilder: (BuildContext context, int index) {
                    var name = countries[index];
                    return CountryContainer(
                      countryName: name,
                    );
                  }),
            ),
          ],
        ),
      )),
    );
  }
}
