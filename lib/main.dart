import 'package:flutter/material.dart';
import './screens/camera.dart';
import './screens/calls.dart';
import './screens/chats.dart';
import './screens/status.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp Clone Example',
      theme: ThemeData(
        primaryColor: const Color(0XFF25D366),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

const List<Tab> tabs = <Tab>[
  Tab(icon: Icon(Icons.camera_alt)),
  Tab(text: "CHATS"),
  Tab(text: "STATUS"),
  Tab(text: "CALLS"),
];

enum Options { group, broadcast, linked, starred, payments, settings }

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, initialIndex: 0, length: tabs.length);
  }

  Color maincolor = const Color(0XFF075E54);

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WhatsApp"),
        elevation: 0.8,
        backgroundColor: maincolor,
        foregroundColor: Colors.white70,
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _tabController,
          tabs: tabs,
          labelColor: Colors.white70,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton<Options>(
            onSelected: (Options result) {
              setState(() {});
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Options>>[
              PopupMenuItem<Options>(
                value: Options.group,
                child: TextButton(
                  child: const Text(
                    "New group",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () => print("New Group"),
                ),
              ),
              PopupMenuItem<Options>(
                value: Options.group,
                child: TextButton(
                  child: const Text(
                    "New broadcast",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () => print("New broadcast"),
                ),
              ),
              PopupMenuItem<Options>(
                value: Options.group,
                child: TextButton(
                  child: const Text(
                    "Linked devices",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () => print("Linked devices"),
                ),
              ),
              PopupMenuItem<Options>(
                value: Options.group,
                child: TextButton(
                  child: const Text(
                    "Starred messages",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () => print("Starred messages"),
                ),
              ),
              PopupMenuItem<Options>(
                value: Options.group,
                child: TextButton(
                  child: const Text(
                    "Payments",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () => print("Payments"),
                ),
              ),
              PopupMenuItem<Options>(
                value: Options.group,
                child: TextButton(
                  child: const Text(
                    "Settings",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () => print("Settings"),
                ),
              ),
            ],
          )
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          CameraScreen(),
          ChatScreen(),
          StatusScreen(),
          CallScreen(),
        ],
      ),
      floatingActionButton: _buttons(),
    );
  }

  Widget _buttons() {
    return _tabController.index == 1
        ? FloatingActionButton(
            backgroundColor: Colors.green,
            child: const Icon(
              Icons.message,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        : _tabController.index == 2
            ? FloatingActionButton(
                backgroundColor: Colors.green,
                child: const Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.white,
                ),
                onPressed: () {},
              )
            : _tabController.index == 3
                ? FloatingActionButton(
                    backgroundColor: Colors.green,
                    child: const Icon(
                      Icons.call,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  )
                : Container();
  }
}
