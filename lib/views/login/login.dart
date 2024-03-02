import 'package:equityedge/res/colors/AppColors.dart';
import 'package:equityedge/utils/route/routes_names.dart';
import 'package:equityedge/views/login/components/continue_button.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _mobileNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      /* Appbar */
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, AppRouterName.blank);
            },
            icon: Icon(
              Icons.call,
              size: 20,
              color: AppColors.blue,
            ),
            label: Text(
              'Need help?',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.blue,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: size.height * 0.02),

          /* Profile Photo */
          CircleAvatar(
            radius: 50,
            backgroundImage: const NetworkImage(
              'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Text(
            'Varify your phone number',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: size.height * 0.05),

          /* phone no. field */
          Container(
            height: 60,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(color: Colors.grey.shade400),
                    ),
                  ),
                  child: Text(
                    '+91',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.lightGrey,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: _mobileNoController,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                    decoration: InputDecoration(
                      hintText: '900 000 0000',
                      hintStyle:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: AppColors.lightGrey,
                                fontWeight: FontWeight.normal,
                              ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      /* bottom navigation */
      bottomNavigationBar: Container(
        height: 150,
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text.rich(
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
              TextSpan(
                text: 'By clicking continue, you are agreeing to the',
                children: [
                  TextSpan(
                    text: ' Terms of use',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextSpan(text: ' and'),
                  TextSpan(
                    text: ' Privacy Policy',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.01),

            /* continue button */
            ContinueButton(
              onTap: () {
                Navigator.pushNamed(context, AppRouterName.businessCardView);
              },
              backgroundColor: AppColors.black26,
            ),
          ],
        ),
      ),
    );
  }
}
