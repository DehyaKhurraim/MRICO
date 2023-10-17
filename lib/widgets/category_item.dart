import 'package:flutter/material.dart';

import '../ThemeConfig/Colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.data,
    this.selected = false,
    this.onTap,
  }) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final data;
  final bool selected;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
        margin: const EdgeInsets.only(right: 10),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: selected ? kfroColor : AppColor.cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.1),
              spreadRadius: .5,
              blurRadius: .5,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(data["icon"],
                size: 25, color: selected ? Colors.white : Colors.black),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: Text(
                data["name"],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 13,
                    color: selected ? Colors.white : AppColor.darker,
                    decoration: TextDecoration.none),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
