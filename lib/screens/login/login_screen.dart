import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tezda_test/core/models/user.dart';
import 'package:tezda_test/core/routes/router.gr.dart';
import 'package:tezda_test/core/widgets/custom_loading_overlay.dart';
import 'package:tezda_test/core/widgets/login_common_view.dart';
import 'package:tezda_test/core/widgets/tezda_button.dart';
import 'package:tezda_test/core/widgets/tezda_input_field.dart';
import 'package:tezda_test/screens/login/bloc/login_bloc.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';

@RoutePage()
class LoginScreen extends StatelessWidget implements AutoRouteWrapper {
  const LoginScreen({super.key});

  static showView(BuildContext context) {
    context.router.pushAndPopUntil(const LoginRoute(),
        predicate: (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: RxBlocBuilder<LoginBlocType, bool>(
        state: (bloc) => bloc.states.isLoading,
        builder: (context, isLoading, bloc) {
          return CustomLoadingOverLay(
            isLoading: isLoading.data ?? false,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 16,
                  bottom: 16,
                  right: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome back",
                      style: GoogleFonts.roboto().copyWith(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const Gap(2),
                    Text(
                      "Hey, Good to see you again",
                      style: GoogleFonts.roboto().copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const Gap(32),
                    RxBlocBuilder<LoginBlocType, String?>(
                      state: (bloc) => bloc.states.errorEmail,
                      builder: (context, snapShort, bloc) {
                        return TezdaInputField(
                          errorText: snapShort.data,
                          onChange: (String? value) {
                            if (value != null) {
                              bloc.events.setEmail(value);
                            }
                          },
                          label: "Email Address",
                          labelStyle: GoogleFonts.roboto().copyWith(
                            fontSize: 18,
                          ),
                        );
                      },
                    ),
                    const Gap(16),
                    RxBlocBuilder<LoginBlocType, String?>(
                      state: (bloc) => bloc.states.errorPassword,
                      builder: (context, snapShort, bloc) {
                        return TezdaInputField(
                          errorText: snapShort.data,
                          onChange: (String? value) {
                            if (value != null) {
                              bloc.events.setPassword(value);
                            }
                          },
                          label: "Password",
                          suffixIcon: const Icon(Icons.remove_red_eye),
                          suffixIconAlt: const Icon(Icons.remove_red_eye_sharp),
                          labelStyle: GoogleFonts.roboto().copyWith(
                            fontSize: 18,
                          ),
                          obscureText: true,
                        );
                      },
                    ),
                    const Gap(8),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forgot Password",
                          style: GoogleFonts.roboto().copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const Gap(18),
                    loginButton(),
                    const Gap(18),
                    registerOption(context),
                    RxBlocListener<LoginBlocType, String>(
                        state: (bloc) => bloc.states.errors,
                        listener: (context, message) {
                          Fluttertoast.showToast(
                              msg: message,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }),
                    RxBlocListener<LoginBlocType, TezdaUser>(
                        bloc: bloc,
                        state: (bloc) => bloc.states.loginComplete,
                        listener: LoginCommonView.confirmEmailRoute),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget registerOption(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.navigate(const RegisterRoute()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "I don't have an account",
            style: GoogleFonts.roboto().copyWith(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(4),
          Text(
            "Sign Up",
            style: GoogleFonts.roboto().copyWith(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget loginButton() {
    return RxBlocBuilder<LoginBlocType, bool?>(
      state: (bloc) => bloc.states.isLoginEnabled,
      builder: (context, snapShot, bloc) {
        return TezdaButton(
          backgroundColor: WidgetStateProperty.all<Color>(Colors.black),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          onclick: () => (snapShot.data ?? false) ? bloc.events.login() : (),
          child: Text(
            "Login",
            style: GoogleFonts.roboto().copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => RxBlocProvider<LoginBlocType>(
        create: (context) => LoginBloc(Provider.of(
          context,
          listen: false,
        )),
        child: this,
      );
}
