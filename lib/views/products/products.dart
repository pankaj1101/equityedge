import 'package:equityedge/res/colors/AppColors.dart';
import 'package:equityedge/views/blank/blank_screen.dart';
import 'package:equityedge/components/icon_card_widget.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {
        "imagePath": "assets/icons/credit_card.svg",
        "title": "Credit Cards",
        "subtitle": "Earn upto ₹3550"
      },
      {
        "imagePath": "assets/icons/personal_loan.svg",
        "title": "Personal Loans",
        "subtitle": "Earn upto ₹3800"
      },
      {
        "imagePath": "assets/icons/emi_card.svg",
        "title": "Pay Later/EMl Cards",
        "subtitle": "Earn upto ₹700"
      },
      {
        "imagePath": "assets/icons/deposit.svg",
        "title": "Fixed Deposits",
        "subtitle": "Earn upto ₹400"
      },
      {
        "imagePath": "assets/icons/business_loans.svg",
        "title": "Business Loans",
        "subtitle": "Earn upto ₹525"
      },
      {
        "imagePath": "assets/icons/money_bag.svg",
        "title": "Money Bag",
        "subtitle": "Earn upto ₹525"
      },
      {
        "imagePath": "assets/icons/money_bag.svg",
        "title": "Money Bag",
        "subtitle": "Earn upto ₹525"
      }
    ];

    return Scaffold(
      /* AppBar */
      appBar: AppBar(
        title: const Text('Product Categories'),
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select from Categories to sell',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(),
              ),
              const SizedBox(height: 20),
              // GridTile()
              Material(
                child: GridView.builder(
                  itemCount: data.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 9 / 11,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return BlankScreen();
                            },
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Colors.lightBlue,
                          border: Border.all(
                            color: AppColors.borderColor,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconCardWidget(
                              iconPath: data[index]['imagePath']!,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              data[index]['title']!,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              data[index]['subtitle']!,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
