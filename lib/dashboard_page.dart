import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hope_for_humaninty/home.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ForDashBoardScreen;

    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Logout Successfull"),
              ),
            );
          },
          child: const Text('LOGOUT'),
        ),
      ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello ${args.userName}, welcome to hope for humanity!',
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Your Account Will be Deleted if you click this button'),
            ElevatedButton(
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Delete Account?'),
                      content: const Text(
                          'If you dont want to delete, click cancel'),
                      actions: [
                        OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              args.signupDetails.removeAt(args.index);
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK')),
                      ],
                    );
                  },
                );
              },
              child: const Text('DELETE'),
            ),
          ],
        ),
      ),
    );
  }
}
