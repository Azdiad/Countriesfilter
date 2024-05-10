import 'package:countries_task/model/countries_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:countries_task/controller/fetchedcountries_provider.dart';
import 'package:countries_task/controller/internet_provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Map<String, bool> expandedState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var fetchedProvider =
          Provider.of<FetchedCountriesProvider>(context, listen: false);
      fetchedProvider.fetchCountriesDetails().then((_) {
        setState(() {
          expandedState = fetchedProvider
              .groupedCountriesByContinent()
              .keys
              .fold<Map<String, bool>>({}, (Map<String, bool> map, String key) {
            map[key] = false;
            return map;
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final internetcheckprovider =
        Provider.of<InternetConnectivityProvider>(context)
            .getInternetConnectivity(context);
    final fetchedprovidder = Provider.of<FetchedCountriesProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Continents",
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  onChanged: (value) => fetchedprovidder.setSearchQuery(value),
                  controller: fetchedprovidder.searchcontroller,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.search_outlined),
                    filled: true,
                    fillColor: Color.fromARGB(255, 245, 242, 242),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    hintText: "Search for Countries",
                    hintStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    )),
                  ),
                ),
              ),
              Consumer<FetchedCountriesProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (provider.countriesDetails.isEmpty) {
                    return const Center(child: Text("No continents found."));
                  }

                  var continentsData = provider.groupedCountriesByContinent();
                  var continents = continentsData.keys.toList();

                  return ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {
                      provider.toggleContinentExpansion(continents[index]);
                    },
                    children:
                        continents.map<ExpansionPanel>((String continent) {
                      return ExpansionPanel(
                        backgroundColor: Colors.white,
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                                height: 80,
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: Text(
                                    continent,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 3),
                                  ),
                                )),
                          );
                        },
                        body: Column(
                          children: continentsData[continent]!
                              .map((country) => ListTile(
                                    onTap: () => _showCountryDetailsPopup(
                                        context, country),
                                    title: Text(country.name.common,
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.black)),
                                    subtitle: Column(
                                      children: [
                                        Text(
                                            "Population: ${country.population}"),
                                        Text(
                                            "Capital: ${country.capital?.join(', ')}"),
                                        Text("Region: ${country.region}"),
                                        Text(
                                            "Subregion: ${country.subregion ?? 'N/A'}"),
                                        if (country.coatOfArms.png != null)
                                          Image.network(country.coatOfArms.png!,
                                              height: 100),
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                        isExpanded: provider.isContinentExpanded(continent),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCountryDetailsPopup(BuildContext context, CountriesModel country) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(country.name.common),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                if (country.flags.png != null)
                  Image.network(country.flags.png!, height: 50),
                Text("Population: ${country.population}"),
                Text("Capital: ${country.capital?.join(', ') ?? 'N/A'}"),
                Text("Region: ${country.region}"),
                Text("Subregion: ${country.subregion ?? 'N/A'}"),
                if (country.coatOfArms.png != null)
                  Image.network(country.coatOfArms.png!, height: 100),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
