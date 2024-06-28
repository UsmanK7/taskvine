import 'package:flutter/material.dart';
import 'package:taskvine/components/app_text.dart';
import 'package:taskvine/const/const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //current day
                      AppText(
                        text: "Today",
                        fontWeight: FontWeight.w600,
                        font_size: 24,
                        color: HeadingTextBlack,
                      ),
                      AppText(
                          text: "Best platform for creating to-do lists",
                          color: subtitleTextBlack,
                          fontWeight: FontWeight.w300,
                          font_size: 14),
                    ],
                  ),
                  Icon(
                    size: 24,
                    Icons.settings,
                    color: Color(0xff767E8C),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
