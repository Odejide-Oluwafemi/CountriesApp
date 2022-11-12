import 'package:countries_app/internals/country_model.dart';
import 'package:countries_app/misc/global.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Country country;
  const DetailPage(this.country, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              color: Colors.amber,
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, pageIndex) {
                  // Images (Flag, Map, CoatOfArms, etc)
                  List<String> images = [
                    country.flags!["png"],
                    country.coatOfArms!["png"],
                    // Center(child: Text("Flag")),
                    // Center(child: Text("Map")),
                    // Center(child: Text("Coat of Arm")),
                  ];
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
                color: Colors.red,
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
                      value: country.languages.!,
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
