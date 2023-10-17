import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled1/Screens/Filter.dart';
import '../ThemeConfig/Colors.dart';
import '../widgets/Routing.dart';
import '../widgets/category_item.dart';
import 'package:searchable_listview/searchable_listview.dart';
import '../widgets/data.dart';
import '../widgets/list.dart';
import 'EmptyView.dart';

class PropertiesSeeAllScreen extends StatefulWidget {
  const PropertiesSeeAllScreen({Key? key}) : super(key: key);

  @override
  State<PropertiesSeeAllScreen> createState() => _PropertiesSeeAllScreenState();
}

class _PropertiesSeeAllScreenState extends State<PropertiesSeeAllScreen> {
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
                Navigator.pop(context);
              },
            ),
          ),
          SliverToBoxAdapter(
            child: _buildBody(),
          ),
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
                  if (display == false) {
                    Navigator.push(
                      context,
                      SlidePageRoute(
                        page: FilterScreen(),
                      ),
                    );
                  }
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
          height: 10,
        ),
        _buildCategories(),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: SearchableList<Map<String, dynamic>>(
            initialList: populars,
            builder: (property) {
              final index = populars.indexOf(property);
              return ListDisplay(data: property, index: index);
            },
            filter: (value) => populars
                .where((property) =>
                    property['name']
                        .toLowerCase()
                        .contains(value.toLowerCase()) ||
                    property['location']
                        .toLowerCase()
                        .contains(value.toLowerCase()) ||
                    property['price']
                        .toLowerCase()
                        .contains(value.toLowerCase()))
                .toList(),
            emptyWidget: const EmptyView(),
            inputDecoration: InputDecoration(
              hintText: "Search",
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.blue,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ],
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
}
