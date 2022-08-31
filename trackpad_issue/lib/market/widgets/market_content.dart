import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MarketContent extends StatefulWidget {
  @override
  _MarketContentState createState() => _MarketContentState();
}

class _MarketContentState extends State<MarketContent>
    with AutomaticKeepAliveClientMixin {
  late Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          return _refreshCompleter.future;
        },
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            //PointerDeviceKind.trackpad,
          }),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ListView.builder(
                shrinkWrap: false,
                controller: ScrollController(),
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: 200,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(index.toString()),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
