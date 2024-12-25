import 'package:flutter/material.dart';
import 'logicUI/auth_logic_ui.dart';
import 'widgets/input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthLogicUi authLogicUi = AuthLogicUi();
  //
  final _controllerUsername = TextEditingController();
  final _focusNodeUsername = FocusNode();
  final _controllerPassword = TextEditingController();
  final _focusNodePassword = FocusNode();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var screenDevice = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/tuyensinh.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: screenDevice.height * 0.15,
              bottom: screenDevice.height * 0.15,
              left: screenDevice.width * 0.12,
              right: screenDevice.width * 0.12,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                      spreadRadius: 0,
                      color: Colors.grey.shade300,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 35),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            //--- field email ---
                            UsernameFied(
                              title: 'Username',
                              hintText: 'Type your username',
                              prefixIcon: const Icon(
                                Icons.person_2_outlined,
                                size: 20,
                                color: Colors.black38,
                              ),
                              controller: _controllerUsername,
                              focusNode: _focusNodeUsername,
                            ),
                            // const Gap(20),

                            //--- field password ---
                            PasswordFieldLoginPage(
                              title: 'Password',
                              hintText: 'Type your password',
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                size: 20,
                                color: Colors.black38,
                              ),
                              controller: _controllerPassword,
                              focusNode: _focusNodePassword,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            authLogicUi.handleLogin(
                              _controllerUsername.text,
                              _controllerPassword.text,
                              context,
                            );
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                              colors: [
                                Colors.blue,
                                Colors.purpleAccent,
                              ],
                            ),
                          ),
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
