import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tezda_test/core/models/user.dart';
import 'package:tezda_test/core/resources/assets.dart';
import 'package:tezda_test/core/routes/router.gr.dart';
import 'package:tezda_test/core/widgets/custom_loading_overlay.dart';
import 'package:tezda_test/core/widgets/tezda_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tezda_test/screens/confirm/bloc/confirm_bloc.dart';
import 'package:tezda_test/screens/login/login_screen.dart';

@RoutePage()
class ConfirmScreen extends StatelessWidget implements AutoRouteWrapper {
  const ConfirmScreen({super.key});

  static showView(
    BuildContext context,
  ) {
    context.router.navigate(const ConfirmRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: RxBlocBuilder<ConfirmBlocType, bool>(
          state: (bloc) => bloc.states.isLoading,
          builder: (context, snapshot, bloc) {
            return CustomLoadingOverLay(
              isLoading: snapshot.data ?? false,
              child: RxResultBuilder<ConfirmBlocType, TezdaUser>(
                buildLoading: (context, bloc) =>
                    const CircularProgressIndicator(),
                state: (bloc) => bloc.states.currentUser,
                buildSuccess: (context, user, bloc) {
                  return Stack(
                    children: [
                      _logout(context, bloc),
                      _info(user),
                      _resend(context, bloc),
                      RxBlocListener<ConfirmBlocType, String>(
                        state: (bloc) => bloc.states.errors,
                        listener: (_, snapShort) {
                          Fluttertoast.showToast(
                              msg: snapShort,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        },
                      ),
                      RxBlocListener<ConfirmBlocType, String>(
                        state: (bloc) => bloc.states.onEmailSent,
                        listener: (_, snapShort) {
                          Fluttertoast.showToast(
                              msg: snapShort,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        },
                      ),
                      RxBlocListener<ConfirmBlocType, bool>(
                        state: (bloc) => bloc.states.onSignout,
                        listener: (_, bool signOut) {
                          if (signOut == true) {
                            LoginScreen.showView(context);
                          }
                        },
                      ),
                      RxBlocListener<ConfirmBlocType, bool>(
                          state: (bloc) => bloc.states.onDoOver,
                          listener: (_, bool doOver) {
                            if (doOver) {
                              LoginScreen.showView(context);
                            }
                          }),
                    ],
                  );
                },
                buildError: (context, error, bloc) => const Text("Error"),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _info(TezdaUser user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.mailbox,
          width: 80,
          fit: BoxFit.cover,
        ),
        const Gap(8),
        Text(
          "Thanks!",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w900,
            fontSize: 40,
          ),
        ),
        Text(
          "Now check your email",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w900,
            fontSize: 40,
            height: 1,
          ),
        ),
        const Gap(8),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "We sent an email",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              TextSpan(
                text: " ${user.email} ",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: "to very your account",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Align _logout(BuildContext context, bloc) {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () => bloc.events.doOver(),
        child: Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            right: 16,
          ),
          child: FaIcon(
            FontAwesomeIcons.arrowRightFromBracket,
            color: Colors.red[700],
          ),
        ),
      ),
    );
  }

  Widget _resend(BuildContext context, bloc) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 20,
          right: 20,
        ),
        child: TezdaButton(
          onclick: () => bloc.events.sendEmail(),
          width: 150,
          backgroundColor: WidgetStateProperty.all<Color>(Colors.black),
          shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Resend",
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Gap(10),
              const FaIcon(
                FontAwesomeIcons.clockRotateLeft,
                color: Colors.white,
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) => RxBlocProvider<ConfirmBlocType>(
        create: (context) => ConfirmBloc(Provider.of(context, listen: false)),
        child: this,
      );
}
