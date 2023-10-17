import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled1/Screens/HomeScreen.dart';
import '../ThemeConfig/Colors.dart';
import '../widgets/Routing.dart';
import '../widgets/category_item.dart';
import '../widgets/custom_textbox.dart';
import '../widgets/data.dart';
import '../widgets/list.dart';
import 'BottomNavbar.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

List<String> _getUniqueLocations(List<dynamic> properties) {
  List<String> locations = properties
      .map((property) => property["location"])
      .cast<String>()
      .toList();
  Set<String> uniqueLocations = Set.from(locations);
  return uniqueLocations.toList();
}

List<String> _getUniquePrices(List<dynamic> properties) {
  List<String> prices =
      properties.map((property) => property["price"]).cast<String>().toList();
  Set<String> uniqueLocations = Set.from(prices);
  return uniqueLocations.toList();
}

class _FilterScreenState extends State<FilterScreen> {
  String _selectedLocation = 'Select Location';
  String _selectedPrice = 'Select Price';
  final List<String> _locations = ["Select Location"];
  final List<String> _prices = ["Select Price"];

  @override
  void initState() {
    super.initState();
    _locations.addAll(_getUniqueLocations(populars));
    _prices.addAll(_getUniquePrices(populars));
  }

  List<dynamic> _getFilteredProperties() {
    return populars
        .where((property) =>
            (_selectedLocation == 'Select Location' ||
                property["location"] == _selectedLocation) &&
            (_selectedPrice == 'Select Price' ||
                property["price"] == _selectedPrice))
        .toList();
  }

  void _clearFilters() {
    setState(() {
      _selectedLocation = 'Select Location';
      _selectedPrice = 'Select Price';
    });
  }

  bool display = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: AppColor.appBgColor,
            pinned: true,
            snap: true,
            floating: true,
            title: _buildHeader(),
            leading: IconButton(
              icon: Icon(
                FontAwesomeIcons.backward,
                color: kfroColor,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  SlidePageRoute(
                    page: RootApp(),
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(child: _buildBody()),
        ],
      ),
    );
  }

  _buildHeader() {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Properties",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColor.secondary,
            ),
            child: IconButton(
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              icon: const Icon(Icons.filter_list_rounded, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        _buildFilter(),
        const SizedBox(
          height: 10,
        ),
        _buildCategories(),
        const SizedBox(
          height: 20,
        ),
        _buildLists(),
        const SizedBox(
          height: 55,
        ),
      ],
    );
  }

  Container _buildFilter() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: _clearFilters,
                  icon: Icon(Icons.clear),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColor.secondary,
                  ),
                  child: Center(
                    child: _buildFilterOption(_locations, _selectedLocation,
                        (value) {
                      setState(() {
                        _selectedLocation = value!;
                      });
                    }),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColor.secondary,
                  ),
                  child: Center(
                    child: _buildFilterOption(_prices, _selectedPrice, (value) {
                      setState(() {
                        _selectedPrice = value!;
                      });
                    }),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColor.secondary,
                  ),
                  child: const Center(
                    child: Text('City'),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColor.secondary,
                  ),
                  child: const Center(
                    child: Text('Area'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColor.secondary,
                  ),
                  child: const Center(
                    child: Text('Type'),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColor.secondary,
                  ),
                  child: const Center(
                    child: Text('Bedrooms'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          const Expanded(
            child: Material(
              child: CustomTextBox(
                hint: "Search",
                prefix: Icon(Icons.search, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColor.secondary,
            ),
            child: IconButton(
              onPressed: () {
                setState(() {
                  display = !display;
                });
              },
              icon: const Icon(
                Icons.filter_list_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  int _selectedCategory = 0;
  Widget _buildCategories() {
    List<Widget> lists = List.generate(
      categories.length,
      (index) => CategoryItem(
        data: categories[index],
        selected: index == _selectedCategory,
        onTap: () {
          setState(() {
            _selectedCategory = index;
          });
        },
      ),
    );
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }

  Widget _buildLists() {
    List<dynamic> filteredProperties = _getFilteredProperties();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: filteredProperties.length,
        itemBuilder: (context, index) {
          return ListDisplay(
            data: filteredProperties[index],
            index: index,
          );
        },
      ),
    );
  }

  Widget _buildFilterOption(
    List<String> options,
    String selected,
    void Function(String?) onOptionSelected,
  ) {
    return DropdownButton<String>(
      value: selected,
      items: options.map((option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Center(
            child: Text(option),
          ),
        );
      }).toList(),
      onChanged: onOptionSelected,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 13,
        decoration: TextDecoration.none,
      ),
    );
  }
}
