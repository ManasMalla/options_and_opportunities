import 'package:flutter/material.dart';
import 'package:options_and_opportunities/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Options & Opportunties',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const LoginScreen(title: 'Options & Opportunities'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Destinations { MyApplication, Home, Team }

class _MyHomePageState extends State<MyHomePage> {
  var destination = Destinations.Home;
  var teamState = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(
          selectedIndex: destination == Destinations.Home
              ? 0
              : destination == Destinations.Team
                  ? 5
                  : 2,
          onDestinationSelected: (dest) {
            destination = dest == 0
                ? Destinations.Home
                : dest == 2
                    ? Destinations.MyApplication
                    : Destinations.Team;
            setState(() {});
          },
          children: const [
            NavigationDrawerDestination(
              icon: Icon(Icons.home),
              label: Text("Home"),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.person_outline),
              label: Text("My Profile"),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.task_alt),
              label: Text("My Application"),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.wallet_outlined),
              label: Text("Wallet"),
            ),
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
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 54),
          child: Column(
            children: [
              Container(
                color: Theme.of(context).colorScheme.primary,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Complete your profile and get rewarded\nwith cashback points",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                    ),
                    IconButton(
                      color: Theme.of(context).colorScheme.onPrimary,
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right_rounded),
                    ),
                  ],
                ),
              ),
              const LinearProgressIndicator(
                value: 0.5,
              ),
            ],
          ),
        ),
      ),
      body: destination == Destinations.Team
          ? Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(children: [
                Text(
                  "Team",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(
                  height: 24,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 24,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        teamState = index == teamState ? -1 : index;
                        setState(() {});
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Michaelangelo Muchlongername",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                          Text("CEO"),
                          teamState == index
                              ? Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullamco laboriosam. Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullamco laboriosam. Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullamco laboriosam. ")
                              : SizedBox(),
                        ],
                      ),
                    );
                  },
                  itemCount: 6,
                ),
              ]),
            )
          : destination == Destinations.Home
              ? Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          ClipOval(
                            child: Image.network(
                              "https://github.com/ManasMalla.png",
                              height: 100,
                              width: 100,
                            ),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Welcome"),
                              Text(
                                "Manas Malla",
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              const Text("12-05-1981")
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Card(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Personal Loan",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Status: ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                          Text("Pending"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Ref ID: ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                          Text("1414"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Applied on: ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                          Text("11 Nov 2023"),
                                        ],
                                      ),
                                    ],
                                  ),
                                  VerticalDivider(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Credit Card",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Status: ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                          Text("Pending"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Ref ID: ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                          Text("1415"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Applied on: ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                          Text("12 Nov 2023"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "What would you like to apply for today",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TypesOfServies(),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Offers",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      ReferAdCard(),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "My Applications",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemBuilder: (context, index) {
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 24.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              index % 3 != 0
                                                  ? "Personal Loan"
                                                  : "Credit Card",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                            ),
                                            Text("Status: Pending"),
                                            Text("Ref ID: ${1414 + index}"),
                                            Text("Applied on: 11 Nov 2023"),
                                          ],
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.delete_outline),
                                        )
                                      ]),
                                ),
                              );
                            },
                            itemCount: 8,
                          ),
                        ],
                      )),
                ),
    );
  }
}

class TypesOfServies extends StatelessWidget {
  const TypesOfServies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Personal Loan",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            shape: BoxShape.circle),
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.payment),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Checkbox(value: false, onChanged: (_) {}),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: 10,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class ReferAdCard extends StatelessWidget {
  const ReferAdCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: double.infinity,
        height: 140,
        child: Stack(children: [
          Image.network(
            "https://brollyacademy.com/wp-content/uploads/2023/09/refer-a-friend-700px.png",
            width: double.infinity,
            height: 140,
            fit: BoxFit.cover,
          ),
        ]),
      ),
    );
  }
}
