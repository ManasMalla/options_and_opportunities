import 'package:flutter/material.dart';
import 'package:options_and_opportunities/main.dart';

class LoginScreen extends StatefulWidget {
  final String title;

  const LoginScreen({super.key, required this.title});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var signInState = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(
          // selectedIndex: destination == Destinations.Home ? 0 : 2,
          // onDestinationSelected: (dest) {
          //   destination =
          //       dest == 0 ? Destinations.Home : Destinations.MyApplication;
          //   setState(() {});
          // },
          children: const [
            NavigationDrawerDestination(
              icon: Icon(Icons.home),
              label: Text("Home"),
            ),
            // NavigationDrawerDestination(
            //   icon: Icon(Icons.person_outline),
            //   label: Text("My Profile"),
            // ),
            // NavigationDrawerDestination(
            //   icon: Icon(Icons.task_alt),
            //   label: Text("My Application"),
            // ),
            // NavigationDrawerDestination(
            //   icon: Icon(Icons.wallet_outlined),
            //   label: Text("Wallet"),
            // ),
            NavigationDrawerDestination(
              icon: Icon(Icons.info_outline),
              label: Text("About Us"),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.people_outline),
              label: Text("Our Team"),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.question_answer_outlined),
              label: Text("FAQ"),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.task_outlined),
              label: Text("Terms and Conditions"),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.share_outlined),
              label: Text("Refer a friend"),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.contact_page_outlined),
              label: Text("Contact Us"),
            ),
          ]),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            ReferAdCard(),
            SizedBox(
              height: 24,
            ),
            TypesOfServies(),
            SizedBox(
              height: 24,
            ),
            Divider(),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                signInState
                    ? IconButton(
                        onPressed: () {
                          signInState = !signInState;
                          setState(() {});
                        },
                        icon: signInState
                            ? Icon(Icons.arrow_back_ios)
                            : Icon(Icons.arrow_forward_ios))
                    : SizedBox(),
                signInState ? Spacer() : SizedBox(),
                Text(
                  signInState ? "Sign in" : "Sign in as ",
                  style: signInState
                      ? Theme.of(context).textTheme.headlineMedium
                      : Theme.of(context).textTheme.titleMedium,
                ),
                signInState ? Spacer() : SizedBox(),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            AnimatedSwitcher(
              duration: Duration(seconds: 2),
              child: signInState
                  ? Column(
                      children: [
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        FilledButton(
                          onPressed: () {
                            if (emailController.text == "admin@spotmies.com" &&
                                passwordController.text == "admin") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyHomePage(
                                      title: "Options and Opportunities"),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Invalid Credentials"),
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Sign in",
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        FilledButton(
                          onPressed: () {
                            signInState = !signInState;
                            setState(() {});
                          },
                          child: Text(
                            "Existing Customer",
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text("or,"),
                        SizedBox(
                          height: 12,
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: Text("Become an Agent"),
                        ),
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
