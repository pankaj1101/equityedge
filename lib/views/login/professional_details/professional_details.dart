import 'package:equityedge/res/colors/AppColors.dart';
import 'package:equityedge/utils/route/routes_names.dart';
import 'package:equityedge/views/login/components/continue_button.dart';
import 'package:equityedge/views/login/components/custom_stepper.dart';
import 'package:equityedge/views/login/components/custom_textform_field.dart';
import 'package:flutter/material.dart';

class ProfessionDetails extends StatefulWidget {
  const ProfessionDetails({super.key});

  @override
  State<ProfessionDetails> createState() => _ProfessionDetailsState();
}

class _ProfessionDetailsState extends State<ProfessionDetails> {
  List<String> productsList = [
    "Credit Card",
    "Personal Loan",
    "Auto Loans",
    "Home Loans",
    "Insurance",
    "Other",
    "None"
  ];

  List<String> selectedProducts = [];

  TextEditingController _selfEmployed = TextEditingController();
  TextEditingController _workExperience = TextEditingController();

  List<String> _selfEmployeedList = [
    "Bank Employee",
    "Student",
    "Financial Advisor",
    "Sales Manager",
    "DSA",
    "Influencer",
    "other"
  ];

  List<String> _workExpList = [
    "< 01 years",
    "1 years",
    "2 years",
    "3 years",
    "3-5 years",
    "5-10 years",
    "10 years+",
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Enter Professional Details',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomStepper(selectedIndexList: [0, 1]),
            SizedBox(height: size.height * 0.05),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: 'Your Occupation',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      children: [
                        TextSpan(
                          text: '*',
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  CustomTextFormField(
                    hint: 'Eg : Self Employed',
                    controller: _selfEmployed,
                    isDropdown: true,
                    onTap: () {
                      _showBottomSheet(
                        context,
                        'Occupation',
                        _selfEmployeedList,
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  Text.rich(
                    TextSpan(
                      text: 'Your Work Experience',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      children: [
                        TextSpan(
                          text: '*',
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  CustomTextFormField(
                    hint: 'Eg : 2-3 Years',
                    controller: _selfEmployed,
                    isDropdown: true,
                    onTap: () {
                      _showBottomSheet(
                        context,
                        'Work Experience',
                        _workExpList,
                      );
                    },
                  ),
                  SizedBox(height: 15),
                  Text.rich(
                    TextSpan(
                      text:
                          'Which of the following products have you sold in past?',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      children: [
                        TextSpan(
                          text: '*',
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    children: List.generate(
                      productsList.length,
                      (index) => InkWell(
                        onTap: () {
                          if (selectedProducts.contains(productsList[index])) {
                            selectedProducts.remove(productsList[index]);
                          } else {
                            selectedProducts.add(productsList[index]);
                          }
                          setState(() {});
                        },
                        child: Chip(
                          key: ValueKey(productsList[index]),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(
                              color:
                                  selectedProducts.contains(productsList[index])
                                      ? Colors.lightBlue
                                      : Colors.grey.shade200,
                            ),
                          ),
                          label: Text(
                            productsList[index],
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Colors.black54,
                                ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Column(
          children: [
            Divider(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ContinueButton(
                onTap: () {
                  Navigator.pushNamed(
                      context, AppRouterName.varifyYourIdentity);
                },
                backgroundColor: AppColors.black26,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(
      BuildContext context, String title, List<String> menuList) {
    // String? selectedValue;
    List<bool> isSelectedList =
        List.generate(menuList.length, (index) => false);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      showDragHandle: true,
      useSafeArea: true,
      enableDrag: true,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      builder: (BuildContext context) {
        return Wrap(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.work_outline_rounded,
                      ),
                      SizedBox(width: 10),
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
                Divider(color: AppColors.borderColor),
                Material(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: menuList.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: RadioListTile(
                          tileColor: AppColors.lightGrey200,
                          contentPadding: EdgeInsets.symmetric(vertical: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          value: menuList[index],
                          title: Text(
                            menuList[index],
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          onChanged: (value) {
                            setState(() {
                              print('Selected Value:$value');
                              selectedValue = value.toString();
                            });
                          },
                          groupValue: selectedValue,
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 10);
                    },
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Column(
                    children: [
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ContinueButton(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          backgroundColor: AppColors.blue,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
