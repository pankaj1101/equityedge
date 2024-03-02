import 'package:equityedge/res/colors/AppColors.dart';
import 'package:equityedge/utils/route/routes_names.dart';
import 'package:flutter/material.dart';

class Leads extends StatelessWidget {
  const Leads({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {
        "name": "Ashish",
        "contryCode": "+91",
        "mobileNo": "9898989898",
        "bankName": "Kotak 811.",
        "imagePath": "assets/logo/kotak.png",
        "price": "275",
        "statusTitle": "Sale Completed",
        "statusSubtitle": "Compelete on 22-Nov-2022",
      },
      {
        "name": "Akash Singh Segnar",
        "contryCode": "+91",
        "mobileNo": "9898989897",
        "bankName": "Upstock",
        "price": "500",
        "imagePath": "",
        "statusTitle": "Sale Partly Completed",
        "statusSubtitle": "",
      },
      {
        "name": "Pankaj Ram",
        "contryCode": "+91",
        "mobileNo": "9898989899",
        "bankName": "Grow",
        "price": "400",
        "imagePath": "",
        "statusTitle": "Sale Completed",
        "statusSubtitle": "",
      }
    ];

    final dropDownItem = [
      {
        "title": "Lead Status",
        "icon": Icons.leaderboard,
      },
      {
        "title": "Brand",
        "icon": Icons.bar_chart_outlined,
      },
      {
        "title": "App Data",
        "icon": Icons.pages,
      },
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 240,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: const Color(0xFF062242),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text(
                          'My Leads',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '11',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ),
                        const Spacer(),
                        TextButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRouterName.blank);
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.lightBlue,
                          ),
                          icon: const Icon(
                            Icons.download,
                            size: 15,
                          ),
                          label: const Text('Download Report'),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          border: Border.all(
                            color: const Color.fromRGBO(158, 158, 158, 1)
                                .withOpacity(0.5),
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: const Row(
                        children: [
                          Expanded(
                            child: MyLeadItemCard(
                              title: 'Fulfilled',
                              count: '1',
                              icon: Icons.person_outline_outlined,
                              iconColor: Colors.green,
                            ),
                          ),
                          VerticalDivider(
                            thickness: 0.5,
                          ),
                          Expanded(
                            child: MyLeadItemCard(
                              title: 'Pending',
                              count: '0',
                              icon: Icons.pending_actions,
                              iconColor: Colors.orange,
                            ),
                          ),
                          VerticalDivider(
                            thickness: 0.5,
                          ),
                          Expanded(
                            child: MyLeadItemCard(
                              title: 'Rejected',
                              count: '5',
                              icon: Icons.remove_circle_outline,
                              iconColor: Colors.red,
                            ),
                          ),
                          VerticalDivider(
                            thickness: 0.5,
                          ),
                          Expanded(
                            child: MyLeadItemCard(
                              title: 'Expired',
                              count: '1',
                              icon: Icons.calendar_month,
                              iconColor: Colors.pink,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),

                    /* Search box */
                    TextFormField(
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: AppColors.white),
                      decoration: const InputDecoration(
                        // fillColor: Color(0xFF738297).withOpacity,
                        // filled: true,

                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 20,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        hintText: 'Search by Name or Number',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF7A8B9F),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                  ]),
            ),
            Expanded(
                child: Container(
              color: Colors.grey.shade100,
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    height: 80,
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 15,
                      bottom: 15,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: ListView.separated(
                        itemCount: dropDownItem.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, AppRouterName.blank);
                            },
                            child: IntrinsicWidth(
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  prefixIcon: Icon(Icons.person),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                                icon: Icon(Icons.keyboard_arrow_down_rounded),
                                hint: Text(
                                  dropDownItem[index]['title']!.toString(),
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                items: <String>['A', 'B', 'C', 'D']
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (_) {},
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 20);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                      child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return UserDetailsItemCard(
                        name: data[index]['name']!,
                        mobileNo:
                            "${data[index]['contryCode']!}-${data[index]['mobileNo']!}",
                        price: data[index]['price']!,
                        bankName: data[index]['bankName']!,
                        imagePath: data[index]['imagePath']!,
                        statusTitle: data[index]['statusTitle']!,
                        statusSubtitle: data[index]['statusSubtitle']!,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 10);
                    },
                    itemCount: data.length,
                  )),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class UserDetailsItemCard extends StatelessWidget {
  final String name, mobileNo, price, bankName, statusTitle;
  String? imagePath, statusSubtitle;

  UserDetailsItemCard({
    super.key,
    required this.name,
    required this.mobileNo,
    required this.price,
    required this.bankName,
    required this.statusTitle,
    this.imagePath,
    this.statusSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 150, 101, 158),
                border: Border.all(
                  width: 2,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'A',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    mobileNo,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: imagePath!.isNotEmpty,
              child: Image.asset(
                imagePath!,
                height: 25,
              ),
            )
          ],
        ),
        const SizedBox(height: 5),
        Text(
          bankName,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.blue,
              ),
        ),
        const SizedBox(height: 5),

        //
        SizedBox(
          height: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Row(
              children: [
                Container(
                  width: 3,
                  color: Colors.green,
                ),
                Expanded(
                  child: Container(
                    color: Colors.green.shade50,
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          statusTitle,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Visibility(
                          visible: statusSubtitle!.isNotEmpty,
                          child: Text(
                            statusSubtitle!,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.grey,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 10,
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.currency_rupee_sharp,
                  color: Colors.white,
                  size: 10,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Payment of ₹$price is completed',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class MyLeadItemCard extends StatelessWidget {
  final String title, count;
  final IconData icon;
  final Color iconColor;
  const MyLeadItemCard({
    super.key,
    required this.title,
    required this.count,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 18,
            ),
            const SizedBox(width: 5),
            Text(
              count,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.white,
                  ),
            )
          ],
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.grey,
              ),
        ),
      ],
    );
  }
}
