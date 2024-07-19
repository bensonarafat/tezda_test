import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
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
import 'package:tezda_test/screens/register/bloc/register_bloc.dart';

@RoutePage()
class RegisterScreen extends StatelessWidget implements AutoRouteWrapper {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: RxBlocBuilder<RegisterBlocType, bool>(
        state: (bloc) => bloc.states.isLoading,
        builder: (context, snapshot, bloc) {
          return CustomLoadingOverLay(
            isLoading: snapshot.data == true,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 16,
                  bottom: 32,
                  right: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Back!",
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
                    const Gap(25),
                    Text(
                      "Create your Account",
                      style: GoogleFonts.roboto().copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const Gap(16),
                    RxBlocBuilder<RegisterBlocType, String?>(
                      state: (bloc) => bloc.states.errorEmail,
                      builder: (context, snapShort, bloc) {
                        return TezdaInputField(
                          errorText: snapShort.data,
                          onChange: (String? value) {
                            if (value != null) bloc.events.setEmail(value);
                          },
                          label: "Email Address",
                          labelStyle: GoogleFonts.roboto().copyWith(
                            fontSize: 18,
                          ),
                        );
                      },
                    ),
                    const Gap(32),
                    RxBlocBuilder<RegisterBlocType, String?>(
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
                          labelStyle: GoogleFonts.roboto(
                            fontSize: 18,
                          ),
                          obscureText: true,
                        );
                      },
                    ),
                    const Gap(8),
                    _signUpButton(context),
                    const Gap(18),
                    _login(context),
                    RxBlocListener<RegisterBlocType, String>(
                      state: (bloc) => bloc.states.errors,
                      listener: (context, error) {
                        Fluttertoast.showToast(
                            msg: error,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      },
                    ),
                    RxBlocListener<RegisterBlocType, TezdaUser>(
                        state: (bloc) => bloc.states.onRegistrationComplete,
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

  Widget _login(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.navigate(const LoginRoute()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account",
            style: GoogleFonts.roboto().copyWith(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(4),
          Text(
            "Login",
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

  Widget _signUpButton(BuildContext context) {
    return RxBlocBuilder<RegisterBlocType, bool?>(
      state: (bloc) => bloc.states.isSubmitEnabled,
      builder: (context, snapShot, bloc) {
        return TezdaButton(
          backgroundColor: WidgetStateProperty.all<Color>(Colors.black),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          onclick: () => (snapShot.data ?? false) ? bloc.events.register() : (),
          child: Text(
            "Sign Up",
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
  Widget wrappedRoute(BuildContext context) => RxBlocProvider<RegisterBlocType>(
        create: (context) => RegisterBloc(
          Provider.of(context, listen: false),
          Provider.of(context, listen: false),
        ),
        child: this,
      );
}
