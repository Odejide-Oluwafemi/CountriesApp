import 'package:countries_app/cubit/app_cubits.dart';
import 'package:countries_app/internals/country_model.dart';
import 'package:countries_app/misc/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatelessWidget {
  final Country country;
  const DetailPage(this.country, {super.key});

  @override
  Widget build(BuildContext context) {
    String stringFromMap(Map map, {bool isNested = false}) {
      String result = "";
      if (!isNested) {
        map.forEach((key, value) {
          int count = 0;
          String suf = count == 0
              ? ""
              : count == 1
                  ? ","
                  : "and";
          result += value + suf;
        });
      } else {
        map.forEach((key, fvalue) {
          (fvalue as Map<String, dynamic>).forEach((key, value) {
            int count = 0;
            String suf = count == 0
                ? ""
                : count == 1
                    ? ","
                    : "and";
            if (key == "name") {
              result += value;
            } else {
              result += "($value)$suf ";
            }
            count++;
          });
        });
      }
      return result;
    }

    String stringFromList(List list) {
      String result = "";
      list.forEach((element) {
        int count = 0;
        String suf = count == 0
            ? ""
            : count == 1
                ? ","
                : "and";
        result += element + suf;
      });
      return result;
    }

    List<String> images = [
      country.flags!["png"],
      country.coatOfArms!["png"],
      country.flags!["png"].toString(),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_sharp,
            color: currentTheme.isDark ? Colors.white : Colors.black87,
          ),
          onPressed: () => BlocProvider.of<AppCubits>(context).homePage(),
        ),
        centerTitle: true,
        backgroundColor: Colors.white.withOpacity(0.0),
        elevation: 0.0,
        title: Text(
          country.officialName!,
          style: TextStyle(
            color: Theme.of(context).textTheme.overline!.color,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () => currentTheme.switchTheme(),
              icon: Icon(
                Icons.wb_sunny_outlined,
                color: Theme.of(context).textTheme.overline!.color,
                size: 24,
              ),
            ),
          )
        ],
      ),
      body: Container(
        // color: Colors.purple,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // TOP IMAGES
            Container(
              height: 212,
              // color: Colors.amber,
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: images.length,
                itemBuilder: (context, pageIndex) {
                  // Images (Flag, Map, CoatOfArms, etc)

                  return Column(
                    children: [
                      Expanded(
                        child: Container(
                          // color: Colors.pink,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(images[pageIndex]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Wrap(
                        spacing: 4.4,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        runAlignment: WrapAlignment.center,
                        children: List.generate(
                          images.length,
                          (dotIndex) => Container(
                            width: pageIndex == dotIndex ? 13 : 5,
                            height: pageIndex == dotIndex ? 6 : 5,
                            decoration: BoxDecoration(
                              color:
                                  Theme.of(context).textTheme.overline!.color,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                // color: Colors.red,
                padding: const EdgeInsets.only(top: 25),
                child: ListView(
                  children: [
                    ListItem(
                      title: "Population",
                      value: country.population!.toString(),
                    ),
                    ListItem(
                      title: "Region",
                      value: country.region!,
                    ),
                    ListItem(
                      title: "SubRegion",
                      value: country.subRegion!,
                    ),
                    ListItem(
                      title: "Capital",
                      value: country.capital!.first,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ListItem(
                      title: "Languages",
                      value: stringFromMap(country.languages!),
                    ),
                    ListItem(
                      title: "Independent",
                      value: country.isIndependent!.toString().toUpperCase(),
                    ),
                    ListItem(
                      title: "Is a UN Member",
                      value: country.isUNMember!.toString().toUpperCase(),
                    ),
                    ListItem(
                      title: "Is LandLocked",
                      value: country.isLandLocked!.toString().toUpperCase(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ListItem(
                      title: "Currencies",
                      value: stringFromMap(country.currency!, isNested: true),
                    ),
                    ListItem(
                      title: "Continent",
                      value: stringFromList(country.continents!),
                    ),
                    ListItem(
                      title: "TimeZone",
                      value: stringFromList(country.timezones!),
                    ),
                    ListItem(
                      title: "Week Starts on",
                      value: country.weekStartOn!.replaceFirst(
                          country.weekStartOn![0],
                          country.weekStartOn![0].toUpperCase()),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ListItem(
                        title: "Car Sign",
                        value: stringFromList(
                          country.carDetails!["signs"],
                        )),
                    ListItem(
                      title: "Car Side",
                      value: country.carDetails!["side"].replaceFirst(
                          country.carDetails!["side"][0],
                          country.carDetails!["side"][0].toUpperCase()),
                    ),
                    ListItem(
                      title: "Land Area (km2)",
                      value: country.landArea!.toStringAsFixed(2),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final String value;
  const ListItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListTile(
        leading: Text(
          "$title:",
          style: TextStyle(
            color: Theme.of(context).textTheme.overline!.color,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        title: Text(
          value,
          style: TextStyle(
            color: Theme.of(context).textTheme.overline!.color,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
