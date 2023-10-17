import 'package:flutter/material.dart';
import '../ThemeConfig/Colors.dart';

class DetailWidget extends StatefulWidget {
  const DetailWidget({super.key});

  @override
  State<DetailWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  String dropdownvalue = items.first;
  int navindex = 0;
  List<bool> isSelected1 = <bool>[true, false];
  List<bool> isSelected2 = <bool>[true, false, false];
  List<bool> isSelected3 = <bool>[
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  static List<String> items = <String>[
    "Karachi",
    "Lahore",
    "Islamabad",
    "Quetta"
  ];
  String selectedPropertyType = "Homes";

  void _onItemTapped(int index) {
    setState(() {
      navindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: AppColor.appBgColor,
          pinned: true,
          snap: true,
          floating: true,
          title: _buildHeader(),
          automaticallyImplyLeading: false,
        ),
        SliverToBoxAdapter(child: _buildBody())
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  _buildHeader() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                isSelected1 =
                    List.generate(isSelected1.length, (index) => index == 0);
                isSelected2 =
                    List.generate(isSelected2.length, (index) => index == 0);
                isSelected3 =
                    List.generate(isSelected3.length, (index) => index == 0);
                dropdownvalue = items.first;
                selectedPropertyType = "Homes";
              });
            },
            child: const Text(
              'Clear All',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  _buildBody() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _poster(),
          _option(),
          _property(),
          _dropdown(),
        ],
      ),
    );
  }

  Container _dropdown() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Icon(
                Icons.add_location,
                size: 25,
              ),
              Text(
                'City',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide:
                      const BorderSide(color: Color.fromRGBO(184, 142, 97, 1)),
                ),
                filled: true,
                fillColor: const Color.fromRGBO(239, 239, 239, 1),
              ),
              icon: null,
              items: items
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ))
                  .toList(),
              value: dropdownvalue,
              onChanged: (val) => {
                setState(() {
                  dropdownvalue = val.toString();
                }),
              },
            ),
          )
        ],
      ),
    );
  }

  Container _property() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Icon(
                Icons.home_outlined,
                size: 30,
              ),
              Text(
                'Select Property Type',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: Colors.black),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textButton(0, 'Homes'),
                    textButton(1, 'Plots'),
                    textButton(2, 'Commercial'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _propertyContent(),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  _propertyContent() {
    if (selectedPropertyType == "Homes") {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                outlineButton2(0, 'House'),
                outlineButton2(1, 'Flat'),
                outlineButton2(2, 'Room'),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                outlineButton2(3, 'Upper Portion'),
                outlineButton2(4, 'Lower Portion'),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                outlineButton2(5, 'PentHouse'),
              ],
            ),
          ),
        ],
      );
    } else if (selectedPropertyType == "Plots") {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                outlineButton2(6, 'Residential'),
                outlineButton2(7, 'Commercial'),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                outlineButton2(8, 'Semi Commercial'),
              ],
            ),
          ),
        ],
      );
    } else if (selectedPropertyType == "Commercial") {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                outlineButton2(9, 'Shops'),
                outlineButton2(10, 'Showrooms'),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                outlineButton2(11, 'Farmhouse'),
              ],
            ),
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Container _option() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Choose',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                outlineButton(0, 'Rent'),
                outlineButton(1, 'Sell'),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Container _poster() {
    return Container(
      margin: const EdgeInsets.only(left: 50),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color.fromRGBO(11, 73, 62, 1),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Post Ad',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            const Text(
              'lourdkf ismda cdfwef',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            const Text(
              'csakrusadh',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 50,
                top: 10,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  'assets/IMAGE.png',
                  width: 200,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget outlineButton(int index, String text) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          isSelected1 = isSelected1.map((state) => false).toList();
          isSelected1[index] = true;
        });
      },
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        side: BorderSide(
          width: 2.0,
          color: isSelected1[index]
              ? const Color.fromRGBO(184, 142, 97, 1)
              : Colors.transparent,
        ),
        backgroundColor: isSelected1[index]
            ? const Color.fromRGBO(232, 206, 169, 1)
            : const Color.fromRGBO(229, 229, 229, 1),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget textButton(int index, String text) {
    return TextButton(
      onPressed: () {
        setState(() {
          isSelected2 = isSelected2.map((state) => false).toList();
          isSelected2[index] = true;
          selectedPropertyType = text;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 3,
              color: isSelected2[index]
                  ? const Color.fromRGBO(184, 142, 97, 1)
                  : Colors.transparent,
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: isSelected2[index]
                ? const Color.fromRGBO(184, 142, 97, 1)
                : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget outlineButton2(int index, String text) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          isSelected3 = isSelected3.map((state) => false).toList();
          isSelected3[index] = true;
        });
      },
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        side: BorderSide(
          width: 2.0,
          color: isSelected3[index]
              ? const Color.fromRGBO(184, 142, 97, 1)
              : Colors.transparent,
        ),
        backgroundColor: isSelected3[index]
            ? const Color.fromRGBO(232, 206, 169, 1)
            : const Color.fromRGBO(229, 229, 229, 1),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
