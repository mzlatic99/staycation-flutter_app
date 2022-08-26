import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../theme.dart';
import '../../assets.dart';
import '../../router.dart';

import '../../shared/book_stay_button.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final _auth = FirebaseAuth.instance;
  var _checkAccepted = false;
  var _email = '';
  var _password = '';
  var _message = '';
  var _isLoading = false;
  var _falseCheckColor = ThemeColors.teal800;

  void _saveForm(dynamic email, dynamic password, BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    FocusScope.of(context).unfocus();

    if (email == '') {
      _message = 'Please enter a email.';
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _message,
          ),
          backgroundColor: ThemeColors.coral500,
        ),
      );
    } else if (password == '') {
      _message = 'Please enter a password.';
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _message,
          ),
          backgroundColor: ThemeColors.coral500,
        ),
      );
    } else if (_checkAccepted == false) {
      _message = 'Please accept the checkbox.';
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _message,
          ),
          backgroundColor: ThemeColors.coral500,
        ),
      );
    } else {
      try {
        final UserCredential userCredential = await _auth
            .signInWithEmailAndPassword(email: email, password: password);
        if (userCredential != null) {
          await router.navigateTo(context, Routes.homeScreen, null);
        }

        setState(() {
          _isLoading = false;
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          setState(() {
            _message = 'No user found for that email.';
            _isLoading = false;
          });
        } else if (e.code == 'wrong-password') {
          setState(() {
            _message = 'Wrong password provided for that user.';
            _isLoading = false;
          });
        } else if (e.code == 'invalid-email') {
          setState(() {
            _message = 'The email address is badly formatted.';
            _isLoading = false;
          });
        } else {
          _message = 'Error';
          _isLoading = false;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _message,
            ),
            backgroundColor: ThemeColors.coral500,
          ),
        );
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            Assets.images.authbg,
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          LoadingOverlay(
            isLoading: _isLoading,
            opacity: 0.3,
            progressIndicator: const CircularProgressIndicator(),
            color: ThemeColors.mint500,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              child: Dialog(
                backgroundColor: ThemeColors.white,
                elevation: 8,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Staycation',
                            style: textTheme.headline5,
                          ),
                          Text(
                            'Get started for free',
                            style: textTheme.bodyText2!
                                .copyWith(color: ThemeColors.grey500),
                          ),
                        ],
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                        onChanged: (v) {
                          _email = v;
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                        onChanged: (v) {
                          _password = v;
                        },
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        title: Text(
                          "I accept the Terms and Conditions",
                          style: textTheme.bodyText1!
                              .copyWith(color: _falseCheckColor),
                        ),
                        value: _checkAccepted,
                        activeColor: ThemeColors.mint400,
                        onChanged: (v) {
                          setState(() {
                            _checkAccepted = v!;
                          });
                        },
                      ),
                      BookStayButton(
                        function: () {
                          _saveForm(_email, _password, context);
                        },
                        title: 'LOG IN',
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
