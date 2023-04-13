import 'package:fluter_validation/utils/app_alerts.dart';
import 'package:fluter_validation/utils/app_field_validator.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? name, mobile, country, email, password, confirm_password;
  final formKey = GlobalKey<FormState>();

  onTapRegisterButton() {
    if (FieldValidator.validateAndSave(this)) {
      print('got it');
      AppAlerts.showSnackInfo(context, 'You have successfully registered...');
      formKey.currentState!.reset();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 120),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Register",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  key: const Key('name'),
                  decoration: InputDecoration(
                    labelText: "Name",
                    hintText: "Enter your name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: FieldValidator.validateName,
                  onSaved: (String? value) => name = value,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  key: const Key('email'),
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Enter your email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: FieldValidator.validateEmail,
                  onSaved: (String? value) => email = value,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  key: const Key('password'),
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: FieldValidator.validatePassword,
                  onSaved: (String? value) => password = value,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  key: const Key('confirm_password'),
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    hintText: "Enter your confirm password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (String? value) {
                    final form = formKey.currentState;
                    form!.save();
                    return FieldValidator.validateConfirmPassword(
                        password!, confirm_password!);
                  },
                  onSaved: (String? value) => confirm_password = value,
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: onTapRegisterButton,
                    style: ButtonStyle(
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(color: Colors.white)))),
                    child: const Text(
                      "REGISTER",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
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
}
