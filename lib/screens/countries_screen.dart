// import 'package:dsc_world/screens/home.dart';
import 'package:dsc_world/Controllers/jsonData_controller.dart';
import 'package:flutter/material.dart';
import '../widgets/single_country_container.dart';
import 'package:get/get.dart';

// Countries screen to show the countries based on the pressed continent

class Countries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textController = TextEditingController();
    return GetBuilder<Data>(
      builder: (value) => Scaffold(
        appBar: AppBar(
            actions: [
              //triggering the search icon button in appbar
              IconButton(
                onPressed: () {
                  value.toggleSearch();
                  textController.text = '';
                  textController.clear();
                },
                icon: Icon(Icons.search),
                iconSize: 30,
              )
            ],
            title: Text(
              value.continentName,
              style: TextStyle(
                fontSize: 20,
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
              // checking if search field bool is active or not to either shows the search field or not
              value.searchIsActive
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        onChanged: (val) {
                          value.search(val);
                        },
                        controller: textController,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'Search for a Country',
                          hintStyle: TextStyle(fontSize: 16),

                          //triggering the clear icon button in search field to clear the text field and close the search option
                          suffixIcon: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              value.toggleSearch();
                              textController.text = '';
                              textController.clear();
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                          ),
                        ),
                      ),
                    )
                  : Container(), // shows empty container if no search query in the search field
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
                        var emoji = textController.text.isEmpty
                            ? value.emojies[index]
                            : value.emojiesFilter[index];
                        return CountryContainer(
                          countryName: name,
                          emoji: emoji,
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
