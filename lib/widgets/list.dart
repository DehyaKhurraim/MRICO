import 'package:flutter/material.dart';
import 'package:untitled1/Screens/Description.dart';

import '../ThemeConfig/Colors.dart';
import 'custom_image.dart';

class ListDisplay extends StatefulWidget {
  const ListDisplay({Key? key, required this.data, required this.index})
      : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final data;
  // ignore: prefer_typing_uninitialized_variables
  final index;

  @override
  State<ListDisplay> createState() => _ListDisplayState();
}

class _ListDisplayState extends State<ListDisplay> {
  @override
  Widget build(BuildContext context) {
    double imgHeight = MediaQuery.of(context).size.width / 4;

    return Stack(
      children: [
        widget.index % 2 != 0
            ? Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DescriptionScreen(
                            data: widget.data,
                            index: widget.index,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.8,
                      height: imgHeight / 1.25,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      padding: const EdgeInsets.all(10),
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
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildInfo(),
                          ),
                          _buildFavorite(),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: CustomImage(
                      widget.data["image"],
                      radius: 20,
                      height: MediaQuery.of(context).size.width / 4,
                      width: MediaQuery.of(context).size.width / 3,
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: CustomImage(
                      widget.data["image"],
                      radius: 20,
                      height: MediaQuery.of(context).size.width / 4,
                      width: MediaQuery.of(context).size.width / 3,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DescriptionScreen(
                                  data: widget.data,
                                  index: widget.index,
                                )),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.8,
                      height: imgHeight / 1.25,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      padding: const EdgeInsets.all(10),
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
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildInfo(),
                          ),
                          _buildFavorite(),
                        ],
                      ),
                    ),
                  ),
                ],
              )
      ],
    );
  }

  Widget _buildFavorite() {
    void tap() {
      setState(() {
        widget.data["is_favorited"] = !widget.data["is_favorited"];
      });
    }

    return CircleAvatar(
      backgroundColor: AppColor.red,
      child: IconButton(
        onPressed: () => tap(),
        icon: Icon(
          widget.data["is_favorited"] ? Icons.favorite : Icons.favorite_border,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.data["name"],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            decoration: TextDecoration.none,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.place_outlined,
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
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w100,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          widget.data["price"],
          style: const TextStyle(
            fontSize: 13,
            color: AppColor.primary,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.none,
          ),
        )
      ],
    );
  }
}
