import 'package:flutter/material.dart';
import 'package:ui_chat/helpers.dart';
import 'package:ui_chat/pages/callPage.dart';
import 'package:ui_chat/pages/contactPage.dart';
import 'package:ui_chat/pages/messagePage.dart';
import 'package:ui_chat/pages/notificationPage.dart';
import 'package:ui_chat/widgits/avatar.dart';
import 'package:ui_chat/widgits/glowing_button.dart';
import 'package:ui_chat/widgits/iconBackground.dart';

class HomePage extends StatefulWidget {
  static String id = 'home_page';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> pageTitle = ValueNotifier("Message");
  final pages = const [
    MessagePage(),
    NotificationPage(),
    CallPage(),
    ContactPage(),
  ];
  final titles = const [
    'Messages',
    'Notification',
    'Call',
    'Contacts',
  ];
  void handelNavigation(index) {
    setState(() {
      pageIndex.value = index;
      pageTitle.value = titles[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Avatar.small(url: Helper.randomPicUrl())),
          title: ValueListenableBuilder(
            valueListenable: pageTitle,
            builder: (BuildContext context, String value, _) {
              return Center(
                child: Text(
                  value,
                  style: TextStyle(color: Colors.blueGrey),
                ),
              );
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconBackground(
                  icon: Icons.search,
                  iconColour: Colors.grey,
                  iconSize: 32,
                  onTap: () {
                    print('search here');
                  }),
            ),
          ],
        ),
        body: ValueListenableBuilder(
          valueListenable: pageIndex,
          builder: (BuildContext context, int value, _) {
            return pages[value];
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedIndex: handelNavigation,
        ),
      ),
    );
  }
}

class BottomNavigationBar extends StatefulWidget {
  ValueChanged<int> selectedIndex;
  BottomNavigationBar({required this.selectedIndex});
  @override
  State<BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  int selectedIndex = 0;
  void handelItem(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.selectedIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavigationBarItem(
            index: 0,
            icon: Icons.message_rounded,
            label: 'Messages',
            isSelected: (selectedIndex == 0),
            ontap: handelItem,
          ),
          NavigationBarItem(
            index: 1,
            icon: Icons.notifications,
            label: 'Notifications',
            isSelected: (selectedIndex == 1),
            ontap: handelItem,
          ),
          GlowingButton(
            size: 55,
            icon: Icons.add,
            colour: Colors.blue,
            onPressed: () => print("icon can work"),
          ),
          NavigationBarItem(
            index: 2,
            icon: Icons.call,
            isSelected: (selectedIndex == 2),
            label: 'Calls',
            ontap: handelItem,
          ),
          NavigationBarItem(
            index: 3,
            icon: Icons.contacts,
            isSelected: (selectedIndex == 3),
            label: 'Contacts',
            ontap: handelItem,
          ),
        ],
      ),
    );
  }
}

class NavigationBarItem extends StatefulWidget {
  String label;
  IconData icon;
  int index;
  bool isSelected = false;
  ValueChanged<int> ontap;
  NavigationBarItem({
    required this.label,
    required this.icon,
    required this.index,
    required this.ontap,
    required this.isSelected,
  });

  @override
  State<NavigationBarItem> createState() => _NavigationBarItemState();
}

class _NavigationBarItemState extends State<NavigationBarItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => widget.ontap(widget.index),
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.icon,
              color: widget.isSelected ? Colors.blue : null,
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              widget.label,
              style: widget.isSelected
                  ? TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue)
                  : TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
