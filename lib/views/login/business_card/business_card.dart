import 'package:equityedge/res/colors/AppColors.dart';
import 'package:equityedge/utils/route/routes_names.dart';
import 'package:equityedge/views/login/components/continue_button.dart';
import 'package:equityedge/views/login/components/custom_stepper.dart';
import 'package:equityedge/views/login/components/custom_textform_field.dart';
import 'package:flutter/material.dart';

class BusinessCardView extends StatefulWidget {
  const BusinessCardView({super.key});

  @override
  State<BusinessCardView> createState() => _BusinessCardViewState();
}

class _BusinessCardViewState extends State<BusinessCardView> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailIdController = TextEditingController();
  TextEditingController _pinCodeController = TextEditingController();

  // int selectedIndex = 1;

  // List<int> selectedIndexList = [0, 1];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Create Your Business Card',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomStepper(selectedIndexList: [0]),
              SizedBox(height: size.height * 0.02),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /* ATM CARD */
                    Container(
                      width: double.infinity,
                      height: 200,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.violetColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height * 0.01),
                          Text(
                            'Your Name',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Text(
                            'Financial Advisor',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Icon(
                                Icons.call,
                                size: 15,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                '+91 9971532648',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.01),
                          Row(
                            children: [
                              Icon(
                                Icons.email,
                                size: 15,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Your Email ID',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'CREDIT CARD',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Colors.lightBlue,
                                    ),
                              ),
                              CircleAvatar(
                                radius: 2,
                                backgroundColor: Colors.lightBlue,
                              ),
                              Text(
                                'PERSONAL LOAN',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Colors.lightBlue,
                                    ),
                              ),
                              CircleAvatar(
                                radius: 2,
                                backgroundColor: Colors.lightBlue,
                              ),
                              Text(
                                'PAY LATER',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Colors.lightBlue,
                                    ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text.rich(
                      TextSpan(
                        text: 'Your Name',
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
                    SizedBox(height: size.height * 0.0012),
                    CustomTextFormField(
                      hint: 'Eg: Amam Singh',
                      controller: _nameController,
                      isDropdown: false,
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text: 'As mentioned on PAN Card',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        text: 'Your Email ID',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.0012),
                    CustomTextFormField(
                      hint: 'Eg : name@email.com',
                      controller: _emailIdController,
                      isDropdown: false,
                    ),
                    SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        text: 'Current PIN Code',
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
                    SizedBox(height: size.height * 0.0012),
                    CustomTextFormField(
                      hint: 'Eg: 560035',
                      controller: _pinCodeController,
                      isDropdown: false,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRouterName.blank);
                          },
                          icon: Icon(
                            Icons.card_giftcard,
                            size: 22,
                            color: AppColors.blue,
                          ),
                          label: Text(
                            'Have a referral code?',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: AppColors.blue,
                                ),
                          ),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(0),
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
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
                  Navigator.pushNamed(context, AppRouterName.professionDetails);
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
