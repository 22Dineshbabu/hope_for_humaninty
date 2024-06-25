import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hope_for_humaninty/form_field_layout.dart';
import 'package:hope_for_humaninty/home.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>(debugLabel: 'login');
final GlobalKey<FormState> _formKey2 =
    GlobalKey<FormState>(debugLabel: 'forgot');

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();
  final focusNodeA = FocusNode();
  final focusNodeB = FocusNode();
  final focusNodeC = FocusNode();

  final emailEditController = TextEditingController();
  final passwordEditController = TextEditingController();
  final confirmPasswordEditController = TextEditingController();

  final passwordEditController1 = TextEditingController();

  late bool isObsecured;
  late bool isObsecured1;
  late bool isObsecured2;

  @override
  void initState() {
    isObsecured = true;
    isObsecured1 = true;
    isObsecured2 = true;
    super.initState();
  }

  @override
  void dispose() {
    passwordEditController.dispose();
    emailEditController.dispose();
    confirmPasswordEditController.dispose();
    passwordEditController1.dispose();
    super.dispose();
  }

  void forgotPassword(ForLoginScreen args) {
    int index = -1;
    for (int i = 0; i < args.signupDetails.length; i++) {
      if (emailEditController.text == args.signupDetails[i].email) {
        index = i;
        break;
      }
    }
    if (index == -1) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Invalid email'),
            content: const Text(
                'Looks like you have not registered. Please consider sign up!'),
            actions: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text('Ok'),
                  ),
                ],
              ),
            ],
          );
        },
      );
      return;
    }
    if (passwordEditController1.text == args.signupDetails[index].password) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Same Password'),
            content: const Text(
                'You have entered Previous password. Please enter the different password'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text('Ok'),
              ),
            ],
          );
        },
      );
      return;
    }

    args.upadateSignupDetail(index, passwordEditController1.text);
    args.saveIntosp();
    return Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ForLoginScreen;
    Widget? passwordVisibleIcon = IconButton(
      onPressed: () {
        setState(() {
          isObsecured = !isObsecured;
        });
      },
      icon: isObsecured
          ? const Icon(Icons.visibility_off)
          : const Icon(Icons.visibility),
    );

    return GestureDetector(
      onTap: () {
        focusNode1.unfocus();
        focusNode2.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(52, 167, 81, 1),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(13.85),
                    ),
                    child: Center(
                      child: Text(
                        'H',
                        style: GoogleFonts.caveatBrush(
                          color: const Color.fromRGBO(52, 167, 81, 1),
                          fontSize: 50.38,
                          fontWeight: FontWeight.w400,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    'Sign in to your account',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 26.72,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FormFieldLayout(
                          isSame: passwordEditController,
                          focusNode: focusNode1,
                          title: 'Email',
                          controller: emailEditController,
                          hintText: 'eg. \'abc@email.com\'',
                          isObsecured: false,
                          passwordVisibleIcon: null,
                        ),
                        FormFieldLayout(
                          isSame: passwordEditController,
                          focusNode: focusNode2,
                          title: 'Password',
                          controller: passwordEditController,
                          hintText: '********',
                          isObsecured: isObsecured,
                          passwordVisibleIcon: passwordVisibleIcon,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              backgroundColor:
                                  const Color.fromRGBO(0, 177, 64, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              bool validation =
                                  _formKey.currentState!.validate();

                              if (validation) {
                                int index = -1;
                                for (int i = 0;
                                    i < args.signupDetails.length;
                                    i++) {
                                  if (emailEditController.text ==
                                      args.signupDetails[i].email) {
                                    index = i;
                                    break;
                                  }
                                }
                                if (index == -1) {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return AlertDialog(
                                        title: const Text('Invalid email'),
                                        content: const Text(
                                            'Looks like you have not registered. Please sign up!'),
                                        actions: [
                                          Row(
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(ctx);
                                                },
                                                child: const Text('Ok'),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    args.switchToSignupPage(
                                                        context);
                                                  },
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.green,
                                                    foregroundColor:
                                                        Colors.white,
                                                  ),
                                                  child: const Text('Signup'))
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  return;
                                } else if (passwordEditController.text !=
                                    args.signupDetails[index].password) {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return AlertDialog(
                                        title: const Text('Wrong password'),
                                        content: const Text(
                                            'You have entered wrong password. Please enter the correct password'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(ctx);
                                            },
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  return;
                                }
                                // widget.switchToDashboardScreen(widget.signupDetails[index]);
                                showDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return AlertDialog(
                                      title: const Text('Signup Success!'),
                                      content: const Text(
                                          'Welcome to your Dashboard'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(ctx);
                                            args.switchToDashboardScreen(
                                                context,
                                                args.signupDetails[index],
                                                index);
                                          },
                                          child: const Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            child: Text(
                              'SIGN IN',
                              style: GoogleFonts.poppins(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (ctx) {
                          return StatefulBuilder(builder:
                              (BuildContext context, StateSetter mystate) {
                            Widget? passwordVisibleIcon1 = IconButton(
                              onPressed: () {
                                mystate(() {
                                  isObsecured1 = !isObsecured1;
                                });
                              },
                              icon: isObsecured1
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                            );
                            Widget? passwordVisibleIcon2 = IconButton(
                              onPressed: () {
                                mystate(() {
                                  isObsecured2 = !isObsecured2;
                                });
                              },
                              icon: isObsecured2
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                            );

                            return Form(
                              key: _formKey2,
                              child: GestureDetector(
                                onTap: () {
                                  focusNodeA.unfocus();
                                  focusNodeB.unfocus();
                                  focusNodeC.unfocus();
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(30),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Forgot your password?',
                                        style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      FormFieldLayout(
                                        isSame: emailEditController,
                                        title: 'Email',
                                        controller: emailEditController,
                                        hintText: "eg: abc12@gmail.com",
                                        isObsecured: false,
                                        passwordVisibleIcon: null,
                                        focusNode: focusNodeA,
                                      ),
                                      FormFieldLayout(
                                        isSame: passwordEditController1,
                                        title: 'Password',
                                        controller: passwordEditController1,
                                        hintText: "*******",
                                        isObsecured: isObsecured1,
                                        passwordVisibleIcon:
                                            passwordVisibleIcon1,
                                        focusNode: focusNodeB,
                                      ),
                                      FormFieldLayout(
                                        isSame: passwordEditController1,
                                        title: 'Confirm Password',
                                        controller:
                                            confirmPasswordEditController,
                                        hintText: "*******",
                                        isObsecured: isObsecured2,
                                        passwordVisibleIcon:
                                            passwordVisibleIcon2,
                                        focusNode: focusNodeC,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          OutlinedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Cancel'),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          SizedBox(
                                            width: 100,
                                            child: TextButton(
                                              onPressed: () {
                                                bool validation = _formKey2
                                                    .currentState!
                                                    .validate();
                                                if (validation) {
                                                  forgotPassword(args);
                                                }
                                              },
                                              style: TextButton.styleFrom(
                                                backgroundColor: Colors.green,
                                                foregroundColor: Colors.white,
                                              ),
                                              child: const Text(
                                                'Save',
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                        },
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.poppins(
                        color: const Color.fromRGBO(0, 177, 64, 1),
                      ),
                    ),
                  ),
                  Text(
                    'Or Sign in with',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: const Color.fromRGBO(136, 136, 136, 1),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('IconButton')],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.only(left: 5),
                          ),
                          onPressed: () {
                            args.switchToSignupPage(context);
                          },
                          child: Text(
                            'SIGN UP',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(0, 177, 64, 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
