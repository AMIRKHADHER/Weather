import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:weather/presentation/screens/weather_screen.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/routes.dart';
import '../../core/utils/validator.dart';
import 'background.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController? _emailController = TextEditingController();
  final TextEditingController? _passwordController = TextEditingController();
  bool passwordVisible = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  late double? sizeBetween;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    sizeBetween = height / 20;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Background(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: sizeBetween! * 5,
                        ),
                        buildEmailFormField(),
                        SizedBox(
                          height: sizeBetween! / 2,
                        ),
                        buildPasswordFormField(),
                        SizedBox(
                          height: sizeBetween!,
                        ),
                        SizedBox(
                          width: width * 0.8,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                onSurface: kPrimaryColor),
                            onPressed: /*isLoading! ? null : */ _validateAndSend,
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: width * 0.03),
                              child: const Text(
                                " Valider",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  // fontFamily: 'Gilroy bold',
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: sizeBetween! / 4,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      //  style: TextStyle(fontFamily: AppAssets.GILROY_light_FONT),
      controller: _passwordController,
      decoration: InputDecoration(
        fillColor: kInputColor,
        filled: true,
        contentPadding: EdgeInsets.only(bottom: 0),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              FocusScope.of(context).requestFocus(FocusNode());
              passwordVisible = !passwordVisible;
            });
          },
          icon: !passwordVisible
              ? Image.asset("assets/login/passwordVisibleHide.png")
              : Image.asset("assets/login/passwordVisible.png"),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, bottom: 0, top: 0),
          child: Image.asset("assets/login/password.png"),
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 20,
          minHeight: 20,
        ),
        labelText: " Mot de passe",
      ),
      obscureText: !passwordVisible,
      keyboardType: TextInputType.visiblePassword,
      autocorrect: false,
      validator: (value) => Validator.validatePassword(value!),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: _emailController,
      style: TextStyle(
          //fontFamily: AppAssets.GILROY_light_FONT,
          ),
      decoration: InputDecoration(
        fillColor: kInputColor,
        filled: true,
        contentPadding: EdgeInsets.all(0),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 2, right: 5, bottom: 0, top: 0),
          child: Image.asset(
            "assets/login/profile.png",
          ),
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 20,
          minHeight: 20,
        ),
        labelText: " Votre adresse email",
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      validator: (value) => Validator.validateEmail(value!),
    );
  }

  void _validateAndSend() {

    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_emailController!.text != "amirkhadher@gmail.com") {
        _passwordController!.clear();
        _emailController!.clear();
        /*WidgetsBinding.instance!.addPostFrameCallback((_) {
          showToast('email  est incorrecte',
              context: context,
              axis: Axis.horizontal,
              alignment: Alignment.center,
              position: StyledToastPosition.top,
              borderRadius: BorderRadius.zero,
              toastHorizontalMargin: 0,
              fullWidth: true,
              duration: Duration(seconds: 3),
              backgroundColor: kPrimaryColor);
        });*/
        CherryToast.info(
          animationDuration:const Duration(
            milliseconds: 1000,
          ),
           // themeColor:kPrimaryColor,
          title:  const Text("email  est incorrecte"),
        ).show(context);
      } else if (_passwordController!.text != "weather") {
        _passwordController!.clear();
        _emailController!.clear();
       /* WidgetsBinding.instance!.addPostFrameCallback((_) {
          showToast("mot de passe est incorrecte",
              context: context,
              axis: Axis.horizontal,
              alignment: Alignment.center,
              position: StyledToastPosition.top,
              borderRadius: BorderRadius.zero,
              toastHorizontalMargin: 0,
              fullWidth: true,
              duration: Duration(seconds: 3),
              backgroundColor: kPrimaryColor);
        });*/
        CherryToast.info(
          animationDuration:const Duration(
            milliseconds: 1000,
          ),
          title:  const Text("mot de passe est incorrecte"),
        ).show(context);
      }else{
        Navigator.pushNamed(
            context, Routes.weatherScreen,
            arguments:  const WeatherScreenParameters(
                userIdantidiant: "Amir"));
      }

    }
  }
}
