import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:innovator/constants/colors.dart';
import 'package:innovator/pages/global_components/bottom_rounded_container.dart';
import 'package:innovator/pages/global_components/rounded_container.dart';

class FABBottomAppBarItem {
  FABBottomAppBarItem({required this.iconData, this.notifEnabled});
  String iconData;
  var notifEnabled;
}

class FABBottomAppBar extends StatefulWidget {
  FABBottomAppBar({
    Key? key,
    required this.items,
    required this.onTabSelected,
  }) : super(key: key) {
    assert(items.length == 2 || items.length == 5);
  }
  final List<FABBottomAppBarItem> items;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    _selectedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        isActive: index == _selectedIndex,
        onPressed: _updateIndex,
      );
    });

    return BottomRoundedContainer(
      height: 72.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items,
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required FABBottomAppBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
    required isActive,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 44,
          width: 44,
        ),
        Positioned(
          child: RoundedContainer(
            onTap: () => onPressed(index),
            height: index == 2 ? 40 : 40,
            color: isActive ? VIOLET_COLOR : Colors.white,
            width: 40,
            borderRadius: 12,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                item.iconData,
                color: isActive ? Colors.white : const Color(0xFF8D8D8D),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Visibility(
            visible: index == 2 && item.notifEnabled,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 6,
              child: CircleAvatar(
                backgroundColor: GREEN_COLOR,
                radius: 5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
