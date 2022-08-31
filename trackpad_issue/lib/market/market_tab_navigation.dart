import 'package:flutter/material.dart';
import 'package:trackpad_issue/market/widgets/market_app_bar.dart';
import 'package:trackpad_issue/market/widgets/market_content.dart';

class MarketTabNavigation extends StatefulWidget {
  @override
  _MarketTabNavigationState createState() => _MarketTabNavigationState();
}

class _MarketTabNavigationState extends State<MarketTabNavigation>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: MarketAppBar(_selectIndex, _tabController),
          body: PageView(
            controller: _pageController,
            onPageChanged: (value) => _tabController.animateTo(value),
            children: [
              MarketContent(),
              MarketContent(),
            ],
          ),
        ),
      ),
    );
  }

  _selectIndex(int index) {
    _pageController.animateToPage(
      index,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 400),
    );
  }
}
