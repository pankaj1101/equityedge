import 'package:equityedge/views/products/products.dart';
import 'package:equityedge/views/home/home.dart';
import 'package:equityedge/views/leads/leads.dart';
import 'package:equityedge/views/trainings/training.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButtonAppBar extends StatefulWidget {
  const CustomButtonAppBar({super.key});

  @override
  State<CustomButtonAppBar> createState() => _CustomButtonAppBarState();
}

class _CustomButtonAppBarState extends State<CustomButtonAppBar> {
  int selectedIndex = 0;

  List<Widget> widgetList = const [Home(), Products(), Training(), Leads()];

  onChange(int index) {
    selectedIndex = index;
    setState(() {});
  }

/*
 // {
    //   "icon": Icons.trending_up,
    //   "title": "Grow",
    // },

 */

  final List<Map<String, dynamic>> bottomNavItems = [
    {
      "icon": Icons.home,
      "title": "Home",
    },
    {
      "icon": Icons.grid_view_rounded,
      "title": "Products",
    },
    {
      "icon": Icons.school,
      "title": "Trainings",
    },
    {
      "icon": Icons.group,
      "title": "Leads",
    },
  ];

  List<IconData> bottomNavOutLineIcon = [
    Icons.home_outlined,
    Icons.grid_view_outlined,
    Icons.school_outlined,
    Icons.group_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* body */
      body: IndexedStack(children: [widgetList[selectedIndex]]),

      bottomNavigationBar: SizedBox(
        height: 60,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: bottomNavItems.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              final icon = bottomNavItems[index]["icon"];
              final title = bottomNavItems[index]["title"];

              return SizedBox(
                width:
                    MediaQuery.of(context).size.width / bottomNavItems.length,
                child: Column(
                  children: [
                    Visibility(
                      visible: selectedIndex == index,
                      child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 50,
                            height: 4,
                            decoration: BoxDecoration(
                              color: const Color(0xFF062242),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          Positioned(
                            top: 4,
                            child: SvgPicture.asset(
                              'assets/images/torch_effect.svg',
                              height: 50,
                              // color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () => onChange(index),
                      child: Column(
                        children: [
                          Icon(
                            selectedIndex == index
                                ? icon
                                : bottomNavOutLineIcon[index],
                            color: const Color(0xFF062242),
                          ),
                          Text(title)
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
