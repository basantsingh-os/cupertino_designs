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

class DetailedScreen extends StatelessWidget {
  final String topic;
  DetailedScreen(this.topic);
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text("Details")),
        child: Center(
          child: Text(
            "Details for $topic",
            style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
          ),
        ));
  }
}
