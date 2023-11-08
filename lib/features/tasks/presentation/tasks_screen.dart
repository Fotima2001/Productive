import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive/features/tasks/presentation/pages/all.dart';
import 'package:productive/features/tasks/presentation/pages/upcoming.dart';

import '../../../assets/constants/colors.dart';
import '../../../assets/constants/icons.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(

          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const Spacer(),
              SvgPicture.asset(AppIcons.sun),

              UserAccountsDrawerHeader(
                accountName: Text('Rozan'),
                accountEmail: Text('rozan.hasan.matar115@gmail...'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset(AppIcons.avatar),
                ),
              ),
              ListTile(
                leading: SvgPicture.asset(AppIcons.star),
                title: Text('Premium'),
                onTap: () {},
              ),
              ListTile(
                leading: SvgPicture.asset(AppIcons.settings),
                title: Text('Settings'),
                onTap: () {},
              ),

              ListTile(
                leading: SvgPicture.asset(AppIcons.articles),
                title: Text('Articles'),
                onTap: () {},
              ),
              ListTile(
                leading: SvgPicture.asset(AppIcons.help),
                title: Text('Help'),
                onTap: () {},
              ),
              ListTile(
                leading: SvgPicture.asset(AppIcons.terms),
                title: Text('Terms'),
                onTap: () {},
              ),
              ListTile(
                leading: SvgPicture.asset(AppIcons.faq),
                title: Text('FAQ'),
                onTap: () {},
              ),

            ],
          ),
        ),



        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          toolbarHeight: 116,
          title: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: SvgPicture.asset(AppIcons.hamburger),
                      );
                    }),
                    const Spacer(),
                    SvgPicture.asset(AppIcons.note),
                    const SizedBox(width: 24),
                    SvgPicture.asset(AppIcons.notification),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  cursorColor: cursorColor,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 44, vertical: 13.5),
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        AppIcons.search,
                      ),
                    ),
                    suffixIcon: Container(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(AppIcons.filter),
                    ),
                    filled: true,
                    fillColor: textFieldBackgroundColor,
                    hintText: 'Search by events, tasks.. ',
                  ),
                ),
              ],
            ),
          ),
          bottom: TabBar(
            controller: tabController,
            tabs: const [
              Tab(child: Text("Upcoming")),
              Tab(child: Text("All")),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: const [
            UpcomingPage(),
            AllPage(),
          ],
        ),
      ),
    );
  }
}