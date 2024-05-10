import 'package:flutter/material.dart';
import 'package:countries_task/model/countries_model.dart';
import 'package:countries_task/service/fetchcountries_service.dart';

class FetchedCountriesProvider extends ChangeNotifier {
  FetchCountriesService _fetchedCountriesService = FetchCountriesService();

  bool _isLoading = false;
  String _errorMessage = '';
  List<CountriesModel> _countriesDetails = [];
  bool _hasMoreData = true;
  int _currentPage = 1;
  final int _pageSize = 20;
  TextEditingController searchcontroller = TextEditingController();

  Map<String, bool> _expandedState = {};

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  List<CountriesModel> get countriesDetails => _countriesDetails;

  bool isContinentExpanded(String continent) =>
      _expandedState[continent] ?? false;

  void toggleContinentExpansion(String continent) {
    bool currentState = isContinentExpanded(continent);
    _expandedState[continent] = !currentState;
    notifyListeners();
  }

  Future<void> fetchCountriesDetails() async {
    _isLoading = true;
    _errorMessage = '';

    List<CountriesModel> response =
        await _fetchedCountriesService.fetchCountries();

    _countriesDetails = response;
    _initializeExpansionStates();

    _isLoading = false;
    notifyListeners();
  }

  void _initializeExpansionStates() {
    _expandedState.clear();
    for (var country in _countriesDetails) {
      for (var continent in country.continents) {
        if (!_expandedState.containsKey(continent.name)) {
          _expandedState[continent.name] = false;
        }
      }
    }
  }

  String _searchQuery = '';

  String get searchQuery => _searchQuery;

  void setSearchQuery(String value) {
    _searchQuery = value;
    notifyListeners();
  }

  Map<String, List<CountriesModel>> groupedCountriesByContinent() {
    Map<String, List<CountriesModel>> map = {};
    for (var country in _countriesDetails) {
      for (var continent in country.continents) {
        if (country.name.common
            .toLowerCase()
            .contains(_searchQuery.toLowerCase())) {
          if (!map.containsKey(continent.name)) {
            map[continent.name] = [];
          }
          map[continent.name]?.add(country);
        }
      }
    }
    return map;
  }
}
