// import 'package:dsc_world/screens/home.dart';
import 'package:dsc_world/Controllers/jsonData_controller.dart';
import 'package:flutter/material.dart';
import '../widgets/single_country_container.dart';
import 'package:get/get.dart';

class Countries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textController = TextEditingController();
    return GetBuilder<Data>(
      builder: (value) => Scaffold(
        appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  textController.text = '';
                  textController.clear();
                  value.toggleSearch();
                },
                icon: Icon(Icons.search),
                iconSize: 30,
              )
            ],
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
              value.searchIsActive
                  ? TextField(
                      onChanged: (val) {
                        value.search(val);
                        // print(val.toLowerCase());
                      },
                      controller: textController,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Search for a Country',
                        hintStyle: TextStyle(),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            textController.text = '';
                            textController.clear();
                            value.toggleSearch();

                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                    )
                  : Container(),
              Expanded(
                child: GetBuilder<Data>(
                  builder: (value) => ListView.builder(
                      itemCount: textController.text.isEmpty
                          ? value.countries.length
                          : value.countriesFilter.length,
                      itemBuilder: (BuildContext context, int index) {
                        var name = textController.text.isEmpty
                            ? value.countries[index]
                            : value.countriesFilter[index];
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
