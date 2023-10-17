import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../ThemeConfig/Colors.dart';
import '../widgets/custom_image.dart';
import '../widgets/data.dart';
import '../widgets/feature.dart';

class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({Key? key, required this.data, required this.index})
      : super(key: key);
  final data;
  final index;

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  double height = 0.0;
  bool isLiked = false;
  List<String> images = [];
  @override
  void initState() {
    super.initState();
    images = [
      widget.data["image"],
    ];
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Stack _buildBody(BuildContext context) {
    return Stack(
      children: [
        _buildSlider(context),
        _buildArrow(),
        _buildContainer(context),
      ],
    );
  }

  Positioned _buildContainer(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Column(
          children: [
            _buildToggle(),
            _buildDescription(context),
          ],
        ),
      ),
    );
  }

  Container _buildDescription(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.data["name"],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  widget.data["price"],
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColor.primary,
                    decoration: TextDecoration.none,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.place_outlined,
                  color: Colors.grey,
                  size: 13,
                ),
                const SizedBox(
                  width: 3,
                ),
                Expanded(
                  child: Text(
                    widget.data["location"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            _buildCategories(),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Description',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.w100,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                elevation: 5,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomImage(
                            profile,
                            width: 45,
                            height: 45,
                            trBackground: true,
                            borderColor: AppColor.primary,
                            radius: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Owais Nasar",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "Property Owner",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height / 23,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Get Schedule',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                backgroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 35, vertical: 10),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 23,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                backgroundColor: AppColor.secondary,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 35, vertical: 10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.call,
                                    size: 20,
                                  ),
                                  Text(
                                    'Call',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildToggle() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildFavorite(),
        ],
      ),
    );
  }

  Positioned _buildArrow() {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: _buildBack(),
      ),
    );
  }

  SizedBox _buildSlider(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.5,
          autoPlay: true,
          viewportFraction: 1,
          enableInfiniteScroll: false,
        ),
        items: images.map((image) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildFavorite() {
    void tap() {
      setState(() {
        widget.data["is_favorited"] = !widget.data["is_favorited"];
      });
    }

    return Material(
      borderRadius: BorderRadius.circular(20),
      color: AppColor.red,
      child: IconButton(
        onPressed: () => tap(),
        icon: Icon(
          widget.data["is_favorited"] ? Icons.favorite : Icons.favorite_border,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildBack() {
    return Material(
      borderRadius: BorderRadius.circular(20),
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new,
            color: Colors.black), // Wrap the icon with Icon widget
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildCategories() {
    List<Widget> lists = List.generate(
      feature.length,
      (index) => FeatureItem(
        data: feature[index],
      ),
    );
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(bottom: 5, left: 0),
      child: Row(
        children: lists,
      ),
    );
  }
}
