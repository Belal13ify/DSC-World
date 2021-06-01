import 'package:dsc_world/screens/home.dart';
import 'package:flutter/material.dart';
import '../widgets/single_country_container.dart';
import 'package:get/get.dart';

class Countries extends StatelessWidget {
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
                        Get.off(() => HomeScreen());
                      },
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  Get.arguments[0],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      // color: Color(0xff043551),
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 35,
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: Get.arguments[1].length,
                  itemBuilder: (BuildContext context, int index) {
                    var name = Get.arguments[1][index];
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
