import 'package:flutter/material.dart';

class MarketAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  final Function selectIndex;
  final TabController tabController;

  const MarketAppBar(this.selectIndex, this.tabController)
      : preferredSize = const Size.fromHeight(74);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      toolbarHeight: 74,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      iconTheme: IconThemeData(
        color: Theme.of(context).textTheme.bodyText1!.color,
      ),
      flexibleSpace: TabBar(
        controller: tabController,
        onTap: (value) => selectIndex(value),
        isScrollable: true,
        indicatorColor: Theme.of(context).primaryColor,
        labelColor: Theme.of(context).textTheme.bodyText1!.color,
        tabs: const [
          Tab(
            icon: Icon(Icons.trending_up),
            text: 'Market',
          ),
          Tab(
            icon: Icon(Icons.star),
            text: 'Favorites',
          ),
        ],
      ),
    );
  }
}
