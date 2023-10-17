import 'package:flutter/material.dart';
import 'package:untitled1/Screens/PropertiesSeeAllScreen.dart';
import '../ThemeConfig/Colors.dart';
import '../widgets/custom_image.dart';
import '../widgets/data.dart';
import 'HomeScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
            automaticallyImplyLeading: false,
            title: _buildHeader(),
          ),
          SliverToBoxAdapter(child: _buildBody()),
        ],
      ),
    );
  }

  _buildHeader() {
    return const Text(
      "Settings",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: Colors.black,
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
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomImage(
                profile,
                width: 100,
                height: 100,
                trBackground: true,
                borderColor: AppColor.primary,
                radius: 10,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Owais Nasar",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        Card(
          margin: const EdgeInsets.all(20),
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 255, 239, 191),
                          child: Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 235, 176, 0),
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.w100,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 193, 227, 255),
                          child: Icon(
                            Icons.notifications,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Notification',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.w100,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios, color: Colors.black),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 206, 255, 207),
                          child: Icon(
                            Icons.lock,
                            color: Colors.green,
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Change Password',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.w100,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios, color: Colors.black),
                  ],
                ),
              ],
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.all(20),
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 211, 211, 211),
                          child: Icon(
                            Icons.star_half,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Appearance',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.w100,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 244, 197, 194),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Favorites',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.w100,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios, color: Colors.black),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 241, 241, 241),
                          child: Icon(
                            Icons.shield,
                            color: Colors.grey,
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Privacy Policy',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.w100,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios, color: Colors.black),
                  ],
                ),
              ],
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.all(20),
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 239, 237, 237),
                          child: Icon(
                            Icons.logout,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Log Out',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.w100,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
