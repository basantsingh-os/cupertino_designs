import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book_solid),
            title: Text("Books"),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.eye_solid),
            title: Text("Views"),
          )
        ],
      ),
      tabBuilder: (context, i) {
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: (i == 0) ? Text('Artiles') : Text('Views'),
              ),
              child: Center(
                  child: CupertinoButton(
                color: CupertinoColors.activeBlue,
                child: Text("This is tab #$i",
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .navLargeTitleTextStyle
                        .copyWith(fontSize: 32)),
                onPressed: () => Navigator.of(context)
                    .push(CupertinoPageRoute(builder: (context) {
                  return DetailedScreen(i == 0 ? 'Articles' : 'Views');
                })),
              )),
            );
          },
        );
      },
    );
  }
}

class DetailedScreen extends StatefulWidget {
  final String topic;
  DetailedScreen(this.topic);

  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  @override
  Widget build(BuildContext context) {
    bool switchValue = false;
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text("Details")),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CupertinoButton(
              child: Text("Launch a Action Sheet"),
              onPressed: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return CupertinoActionSheet(
                        title: Text("Some Choices"),
                        actions: [
                          CupertinoActionSheetAction(
                              onPressed: () {
                                Navigator.pop(context, 1);
                              },
                              child: Text("One!")),
                                                        CupertinoActionSheetAction(
                              onPressed: () {
                                Navigator.pop(context, 2);
                              },
                              child: Text("Two!")),

                                                        CupertinoActionSheetAction(
                              onPressed: () {
                                Navigator.pop(context, 3);
                              },
                              child: Text("Three!")),

                        ],
                      );
                    });
              },
            )
          ],
        )));
  }
}
