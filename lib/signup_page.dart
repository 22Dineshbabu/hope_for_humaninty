import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hope_for_humaninty/Models/signup_details.dart';
import 'package:hope_for_humaninty/form_field_layout.dart';
import 'package:hope_for_humaninty/home.dart';
// import 'package:hope_for_humaninty/login_page.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>(debugLabel: 'signup');

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();
  final focusNode3 = FocusNode();
  final focusNode4 = FocusNode();

  final nameEditController = TextEditingController();
  final confirmPasswordEditController = TextEditingController();
  final emailEditController = TextEditingController();
  final passwordEditController = TextEditingController();

  late bool isObsecured;
  late bool isObsecured1;
  late bool isChecboxed;
  bool disabledSignup = true;
  @override
  void initState() {
    isObsecured = true;
    isObsecured1 = true;
    isChecboxed = false;
    super.initState();
  }

  void _showTermsAndConditions() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Your datas will be collected. If you are ok with that, then continue...',
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        isChecboxed = false;
                      });
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isChecboxed = true;
                      });
                      Navigator.pop(context);
                    },
                    child: const Text('Agree'),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  void addNewSignupDetail() {}

  @override
  void dispose() {
    nameEditController.dispose();
    confirmPasswordEditController.dispose();
    passwordEditController.dispose();
    emailEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ForSignupScreen;

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
    Widget? passwordVisibleIcon1 = IconButton(
      onPressed: () {
        setState(() {
          isObsecured1 = !isObsecured1;
        });
      },
      icon: isObsecured1
          ? const Icon(Icons.visibility_off)
          : const Icon(Icons.visibility),
    );

    Widget? checboxstatus = Row(
      children: [
        SizedBox(
          height: 20,
          width: 20,
          child: Checkbox(
            value: isChecboxed,
            // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onChanged: (ctx) {
              setState(() {
                isChecboxed = !isChecboxed;
              });
            },
          ),
        ),
        const Text('  I have read the '),
        TextButton(
          onPressed: _showTermsAndConditions,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.only(left: 0),
          ),
          child: const Text(
            'terms and conditions',
            style: TextStyle(
              color: Color.fromRGBO(52, 167, 81, 1),
            ),
          ),
        )
      ],
    );
    return GestureDetector(
      onTap: () {
        focusNode1.unfocus();
        focusNode2.unfocus();
        focusNode3.unfocus();
        focusNode4.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            const Spacer(),
            Container(
              width: 25,
              height: 25,
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(52, 167, 81, 1),
                  width: 0.93,
                ),
                borderRadius: BorderRadius.circular(6.41),
              ),
              child: Center(
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
                  child: Text(
                    'H',
                    style: GoogleFonts.caveatBrush(
                      color: const Color.fromRGBO(52, 167, 81, 1),
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                      height: 1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: Form(
            autovalidateMode: AutovalidateMode.disabled,
            key: _formKey,
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create your account',
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
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FormFieldLayout(
                          isSame: nameEditController,
                          focusNode: focusNode1,
                          title: 'Name',
                          controller: nameEditController,
                          hintText: 'ex: jon smith',
                          isObsecured: false,
                          passwordVisibleIcon: null,
                        ),
                        FormFieldLayout(
                          isSame: emailEditController,
                          focusNode: focusNode2,
                          title: 'Email',
                          controller: emailEditController,
                          hintText: 'ex: jon.smith@email.com',
                          isObsecured: false,
                          passwordVisibleIcon: null,
                          signupDetails: args.signupDetails,
                        ),
                        FormFieldLayout(
                          isSame: passwordEditController,
                          focusNode: focusNode3,
                          title: 'Password',
                          controller: passwordEditController,
                          hintText: '******',
                          isObsecured: isObsecured,
                          passwordVisibleIcon: passwordVisibleIcon,
                        ),
                        FormFieldLayout(
                          isSame: passwordEditController,
                          focusNode: focusNode4,
                          title: 'Confirm Password',
                          controller: confirmPasswordEditController,
                          hintText: '******',
                          isObsecured: isObsecured1,
                          passwordVisibleIcon: passwordVisibleIcon1,
                        ),
                        checboxstatus,
                        const SizedBox(
                          height: 7,
                        ),
                        SizedBox(
                          width: double.infinity,
                          // height: 45,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              disabledBackgroundColor:
                                  const Color.fromARGB(255, 97, 161, 107),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              backgroundColor:
                                  const Color.fromRGBO(0, 177, 64, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: !isChecboxed
                                ? () {
                                    ScaffoldMessenger.maybeOf(context)!
                                        .removeCurrentSnackBar();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content:
                                          Text('You have to check the box'),
                                      duration: Duration(seconds: 2),
                                    ));
                                  }
                                : () {
                                    bool validation =
                                        _formKey.currentState!.validate();

                                    if (validation && isChecboxed) {
                                      args.addNewSignupDetail(
                                        SignupDetails(
                                          name: nameEditController.text,
                                          email: emailEditController.text,
                                          password: passwordEditController.text,
                                        ),
                                      );
                                      args.saveIntosp();
                                      args.switchToLoginScreen(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('Signup Success'),
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                    }
                                  },
                            child: Text(
                              'SIGN UP',
                              style: GoogleFonts.poppins(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Text(
                            'Or Sign up with',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: const Color.fromRGBO(136, 136, 136, 1),
                            ),
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
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Have an account?',
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
                                  args.switchToLoginScreen(context);
                                },
                                child: Text(
                                  'SIGN IN',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
