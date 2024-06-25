import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage(
      {required this.switchToLoginScreen,
      required this.switchToSignupScreen,
      super.key});

  final void Function(BuildContext) switchToLoginScreen;
  final void Function(BuildContext) switchToSignupScreen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        body: Stack(
          children: [
            // Background image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/smiley_face_hope.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Gradient overlay
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(52, 167, 81, 0.815),
                    Color.fromRGBO(52, 167, 81, 1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            // Front elements like button, text, etc.
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.sp,
                  children: [
                    const SizedBox(height: 150),
                    Container(
                      width: 130,
                      height: 130,
                      alignment: Alignment.center,

                      // padding:
                      //     const EdgeInsets.symmetric(horizontal: 45, vertical: 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(31.03),
                      ),
                      child: Text(
                        'H',
                        style: GoogleFonts.caveatBrush(
                          color: const Color.fromRGBO(52, 167, 81, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 113,
                          height: 1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'HOPE FOR',
                            style: GoogleFonts.poppins(
                              fontSize: 36,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              height: 1,
                            ),
                          ),
                          Text(
                            'HUMANITY',
                            style: GoogleFonts.poppins(
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 80),
                    Column(
                      children: [
                        Text(
                          'Welcome to ',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 29.18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'hope for humanity',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 29.18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                textStyle: const TextStyle(fontSize: 15),
                              ),
                              onPressed: () {
                                switchToLoginScreen(context);
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //       builder: (context) => const LoginPage()),
                              },
                              child: const Text('Login'),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                textStyle: const TextStyle(fontSize: 15),
                              ),
                              onPressed: () {
                                switchToSignupScreen(context);
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //     builder: (context) => const SignupPage(
                                //       switchToLoginScreen: switchToLoginScreen,
                                //       switchToHomeScreen: switchToHomeScreen,
                                //       addNewSignupDetail: addNewSignupDetail,
                                //       saveIntosp: saveIntosp,
                                //       signupDetails: signupDetails,
                                //     ),
                                //   ),
                                // );
                              },
                              child: const Text('Signup'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
