import 'package:equityedge/utils/route/routes_names.dart';
import 'package:equityedge/views/blank/blank_screen.dart';
import 'package:equityedge/views/bottom_bar/bottom_app_bar.dart';
import 'package:equityedge/views/home/home.dart';
import 'package:equityedge/views/leads/leads.dart';
import 'package:equityedge/views/login/business_card/business_card.dart';
import 'package:equityedge/views/login/login.dart';
import 'package:equityedge/views/login/professional_details/professional_details.dart';
import 'package:equityedge/views/login/varify_your_identity/varify_your_identity.dart';
import 'package:equityedge/views/products/products.dart';
import 'package:equityedge/views/trainings/training.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterName.login:
        return MaterialPageRoute(builder: (_) => LoginView());

      case AppRouterName.businessCardView:
        return MaterialPageRoute(builder: (_) => BusinessCardView());

      case AppRouterName.professionDetails:
        return MaterialPageRoute(builder: (_) => ProfessionDetails());

      case AppRouterName.varifyYourIdentity:
        return MaterialPageRoute(builder: (_) => VarifyYourIdentity());

      case AppRouterName.bottomNavigation:
        return MaterialPageRoute(builder: (_) => CustomButtonAppBar());

      case AppRouterName.home:
        return MaterialPageRoute(builder: (_) => Home());

      case AppRouterName.product:
        return MaterialPageRoute(builder: (_) => Products());

      case AppRouterName.training:
        return MaterialPageRoute(builder: (_) => Training());

      case AppRouterName.lead:
        return MaterialPageRoute(builder: (_) => Leads());

      case AppRouterName.blank:
        return MaterialPageRoute(builder: (_) => BlankScreen());

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Page Not found',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Go Back'),
                  ),
                ],
              ),
            ),
          ),
        );
    }
  }
}
