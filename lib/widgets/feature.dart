import 'package:flutter/material.dart';

import '../ThemeConfig/Colors.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({
    Key? key,
    required this.data,
    this.onTap,
  }) : super(key: key);

  final data;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
        margin: EdgeInsets.only(right: 10),
        width: 110,
        height: 100,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 219, 231, 244),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.1),
              spreadRadius: .5,
              blurRadius: .5,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Color.fromARGB(255, 191, 217, 243),
              child: Icon(
                data["icon"],
                color: Color.fromARGB(255, 43, 126, 209),
                size: 20,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: Text(
                data["name"],
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w100,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
