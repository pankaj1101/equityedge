import 'package:flutter/material.dart';

class CustomStepper extends StatelessWidget {
  const CustomStepper({
    super.key,
    required this.selectedIndexList,
  });

  final List<int> selectedIndexList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: 5,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => Container(
          height: 5,
          width: size.width / 3 - 16,
          // margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: selectedIndexList.contains(index)
                ? Colors.green
                : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        separatorBuilder: (_, int index) {
          return SizedBox(width: 5);
        },
        itemCount: 3,
      ),
    );
  }
}
