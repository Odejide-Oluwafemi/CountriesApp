import 'package:countries_app/cubit/app_cubits.dart';
import 'package:countries_app/cubit/app_cubits_logic.dart';
import 'package:countries_app/cubit/app_cubits_states.dart';
import 'package:countries_app/internals/country_model.dart';
import 'package:countries_app/internals/data_service.dart';
import 'package:countries_app/misc/global.dart';
import 'package:countries_app/widgets/logo_text.dart';
import 'package:countries_app/widgets/my_bottom_sheet.dart';
import 'package:countries_app/widgets/ordered_list_view.dart';
import 'package:countries_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.0),
        elevation: 0.0,
        title: Container(
          margin: const EdgeInsets.only(top: 18),
          child: LogoText(),
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
      body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
        if (state is HomePageState) {
          List<Country> countries = state.countries;
          //print("HomePage First Item: ${countries[0].capital}");
          return Container(
            height: double.maxFinite,
            padding:
                const EdgeInsets.only(/* left: 10.0, right: 10.0, */ top: 3.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: SearchBar(
                    hintText: "Search Country",
                    prefixIcon: Icon(Icons.search, size: 22),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyBottomSheet(
                        text: "EN",
                        icon: Icon(Icons.favorite, size: 24),
                      ),
                      MyBottomSheet(
                        text: "Filter",
                        icon: Icon(Icons.favorite, size: 24),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Expanded(
                  child: Container(
                    child: OrderedListView(
                      children: List.generate(5, (index) {
                        var currentCountry = countries[index];

                        return ListTile(
                          leading: Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: NetworkImage(
                                  currentCountry.flags!["png"].toString(),
                                ),
                              ),
                            ),
                          ),
                          horizontalTitleGap: 24,
                          title: Text(
                            currentCountry.officialName!,
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.overline!.color,
                              fontSize: 15,
                            ),
                          ),
                          subtitle: Text(currentCountry.capital!.first),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(child: Text("Something Went Wrong!"));
        }
      }),
    );
  }
}


/*
Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(
              hintText: "Search Country",
              prefixIcon: Icon(Icons.search, size: 22),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyBottomSheet(
                    text: "EN",
                    icon: Icon(Icons.favorite, size: 24),
                  ),
                  MyBottomSheet(
                    text: "Filter",
                    icon: Icon(Icons.favorite, size: 24),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
*/