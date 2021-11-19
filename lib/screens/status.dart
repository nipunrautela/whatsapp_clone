import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfff2f2f2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            color: Colors.white,
            elevation: 0.0,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 3.0,
                bottom: 1.5,
              ),
              child: ListTile(
                leading: Stack(
                  children: <Widget>[
                    const CircleAvatar(
                      radius: 27,
                      backgroundImage: NetworkImage(
                          "https://cdn2.downdetector.com/static/uploads/c/300/a8d9c/whatsapp-messenger.png"),
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 1.0,
                      child: Container(
                        height: 20,
                        width: 20,
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 15,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  ],
                ),
                title: const Text(
                  "My status",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                subtitle: const Text("Tap to add status update"),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 15.0,
              top: 6.0,
              bottom: 6.0,
            ),
            child: Text(
              "Recent updates",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 27,
                      backgroundImage: NetworkImage(
                          "https://cdn2.downdetector.com/static/uploads/c/300/a8d9c/whatsapp-messenger.png"),
                    ),
                    title: const Text(
                      "Example",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    subtitle: const Text("Today, 00:00"),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StoryPageView())),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 17.0,
              top: 8.0,
              bottom: 8.0,
            ),
            child: Text(
              "Viewed updates",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 27,
                      backgroundImage: NetworkImage(
                          "https://cdn2.downdetector.com/static/uploads/c/300/a8d9c/whatsapp-messenger.png"),
                    ),
                    title: const Text(
                      "Example 2",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    subtitle: const Text("Today, 10:00"),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StoryPageView())),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StoryPageView extends StatefulWidget {
  const StoryPageView({Key? key}) : super(key: key);

  @override
  _StoryPageViewState createState() => _StoryPageViewState();
}

class _StoryPageViewState extends State<StoryPageView> {
  final _storyController = StoryController();
  @override
  Widget build(BuildContext context) {
    final controller = StoryController();
    final List<StoryItem> storyItems = [
      StoryItem.text(title: "Flutter", backgroundColor: Colors.black),
      StoryItem.pageImage(
          url:
              "https://play-lh.googleusercontent.com/ZyWNGIfzUyoajtFcD7NhMksHEZh37f-MkHVGr5Yfefa-IX7yj9SMfI82Z7a2wpdKCA",
          controller: _storyController),
      StoryItem.pageImage(
          url:
              "https://jonmgomes.com/wp-content/uploads/2020/03/Liquid-Lightbulb-Animation-V2-800x600-1.gif",
          controller: _storyController,
          imageFit: BoxFit.contain),
    ];
    return Material(
      child: StoryView(
        storyItems: storyItems,
        controller: controller,
        inline: false,
        repeat: true,
      ),
    );
  }
}
