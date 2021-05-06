import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';

class FeedBack extends StatelessWidget {
  // It's important that Wiredash and your root Material- / Cupertino- / WidgetsApp
  // share the same Navigator key.
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: 'hexaleaf-4b3hewf',
      secret: 'sgmd6uaout4eqw97fy8wcdqcmb4mi5ex46hurkzefqvsrpey',
      navigatorKey: _navigatorKey,
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar(
            title: Text("Feedback"),
          ),
          body: ElevatedButton(
            onPressed: () => Wiredash.of(context).show(),
            child: Text('Give Feedback'),
          ),
        ),
      ),
    );
  }
}