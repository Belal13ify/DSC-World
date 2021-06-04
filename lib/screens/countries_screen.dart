// import 'package:dsc_world/screens/home.dart';
import 'package:dsc_world/Controllers/jsonData_controller.dart';
import 'package:flutter/material.dart';
import '../widgets/single_country_container.dart';
import 'package:get/get.dart';

class Countries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Data>(
      builder: (value) => Scaffold(
        appBar: AppBar(
            title: Text(
              value.continentName,
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            backgroundColor: Color(0xffF44236),
            centerTitle: true),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            children: [
              Expanded(
                child: GetBuilder<Data>(
                  builder: (value) => ListView.builder(
                      itemCount: value.countries.length,
                      itemBuilder: (BuildContext context, int index) {
                        var name = value.countries[index];
                        return CountryContainer(
                          countryName: name,
                        );
                      }),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
