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
        actions: const <Widget>[
          Icon(Icons.search),
          Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),
          Icon(Icons.more_vert),
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
