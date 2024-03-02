import 'package:equityedge/res/colors/AppColors.dart';
import 'package:equityedge/utils/route/routes_names.dart';
import 'package:equityedge/views/login/components/continue_button.dart';
import 'package:equityedge/views/login/components/custom_stepper.dart';
import 'package:equityedge/views/login/components/custom_textform_field.dart';
import 'package:flutter/material.dart';

class VarifyYourIdentity extends StatefulWidget {
  const VarifyYourIdentity({super.key});

  @override
  State<VarifyYourIdentity> createState() => _VarifyYourIdentityState();
}

class _VarifyYourIdentityState extends State<VarifyYourIdentity> {
  TextEditingController _panController = TextEditingController();

  List<String> productsList = [
    "Friends/Family",
    "Youtube",
    "Facebook",
    "Instagram",
    "Others",
  ];

  List<String> selectedProducts = [];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Verify Your Identity',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomStepper(selectedIndexList: [0, 1, 2]),
            SizedBox(height: size.height * 0.05),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.verified_rounded,
                              color: Colors.green,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'ACCOUNT VERIFICATION',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.02),
                        Text(
                          'Account verification can help you sell more on ZET.\nVerified account holders get exclusive support.',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.green,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Text(
                    'Enter PAN to verify your ZET account (optional)',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: 5),
                  CustomTextFormField(
                    hint: 'Eg: BHWIC2448S',
                    controller: _panController,
                    isDropdown: false,
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    'Help us give you the best experience on ZET',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 16, color: AppColors.violetColor),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Text.rich(
                    TextSpan(
                      text: 'How did you hear about ZET?',
                      style: Theme.of(context).textTheme.titleSmall,
                      children: [
                        TextSpan(
                          text: '*',
                          style: TextStyle(color: Colors.red, fontSize: 22),
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
                  Navigator.pushNamed(context, AppRouterName.bottomNavigation);
                },
                backgroundColor: AppColors.black26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
