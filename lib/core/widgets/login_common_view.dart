// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tezda_test/core/models/user.dart';
import 'package:tezda_test/screens/confirm/confirm_screen.dart';
import 'package:tezda_test/screens/home/home_screen.dart';

abstract class LoginCommonView extends StatefulWidget {
  const LoginCommonView({super.key});

  /// Based on the user's data from Firebase,
  /// this code is checked every time the user opens the app & on login.
  /// If the email is verified, they are directed to the Home page.
  /// Otherwise, they are directed to the confirmation page.
  static void confirmEmailRoute(BuildContext context, TezdaUser user) {
    if (user.emailVerified == true) {
      HomeScreen.show(context);
    } else {
      ConfirmScreen.showView(context);
    }
  }
}
