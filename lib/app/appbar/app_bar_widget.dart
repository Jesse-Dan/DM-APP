import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'components/profile_widget.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    Key? key,
    required List<Widget> kTabPages,
    required int currentIndex,
  })  : _kTabPages = kTabPages,
        _currentIndex = currentIndex,
        super(key: key);

  final List<Widget> _kTabPages;
  final int _currentIndex;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool userScrolls = false;

  Future<void> changeIcon() async {
    setState(() {
      userScrolls = !userScrolls;
      debugPrint(userScrolls.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        onStretchTrigger: changeIcon,
        leading: const ProfilePhoto(),
        pinned: true,
        snap: true,
        floating: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        expandedHeight: 200.0,
        flexibleSpace: const FlexibleSpaceBar(
            background: Padding(
                padding: EdgeInsets.only(
                    top: 70,
                    bottom: kdefaultPadding,
                    left: kdefaultPadding,
                    right: kdefaultPadding),
                child: null)),
      ),
      SliverFillRemaining(
        child: widget._kTabPages[widget._currentIndex],
      )
    ]);
  }
}
