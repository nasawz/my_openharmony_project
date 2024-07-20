import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_openharmony_project/app/components/side_rail/side_rail.dart';
// import 'package:my_openharmony_project/app/components/infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:my_openharmony_project/app/routes/app_pages.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetResponsiveView<HomeController> {
  HomeView({super.key}) : super(alwaysUseBuilder: false);

  @override
  Widget? phone() {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        height: 60,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.star_fill),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.clock_solid),
            label: 'Recents',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_alt_circle_fill),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.circle_grid_3x3_fill),
            label: 'Keypad',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              child: CustomScrollView(
                slivers: [
                  const CupertinoSliverNavigationBar(
                    leading: Icon(CupertinoIcons.person_2),
                    // This title is visible in both collapsed and expanded states.
                    // When the "middle" parameter is omitted, the widget provided
                    // in the "largeTitle" parameter is used instead in the collapsed state.
                    largeTitle: Text('Contacts'),
                    trailing: Icon(CupertinoIcons.add_circled),
                  ),
                  SliverFillRemaining(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        const Text('Drag me up', textAlign: TextAlign.center),
                        Text(screen.screenType.toString()),
                        CupertinoButton.filled(
                          onPressed: () {
                            Get.toNamed(Routes.DETAIL);
                            // Navigator.push(
                            //   context,
                            //   CupertinoPageRoute<Widget>(
                            //     builder: (BuildContext context) {
                            //       return const NextPage();
                            //     },
                            //   ),
                            // );
                          },
                          child: const Text('Go to Next Page'),
                        ),
                      ],
                    ),
                  ),
                  // SliverFillRemaining(
                  //   child: Column(
                  //     children: [
                  //       Expanded(
                  //           child: PagedListView<int, int>(
                  //         pagingController: controller.pagingController,
                  //         builderDelegate: PagedChildBuilderDelegate<int>(
                  //           itemBuilder: (context, item, index) => ListTile(
                  //             title: Text('item $item'),
                  //           ),
                  //         ),
                  //       ))
                  //     ],
                  //   ),
                  // )
                ],
              ),
            );
          },
        );
      },
    );
  }

  // @override
  // Widget? desktop() {
  //   print('desktop');
  //   print(screen.isDesktop);
  //   return Scaffold(
  //     body: SafeArea(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Center(
  //             child: Text('isDesktop'),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget? tablet() {
    print('tablet');
    print(screen.isTablet);
    return Scaffold(
      body: Row(
        children: [
          Obx(
            () => SideRail(
              isExpanded: !controller.isExpanded.value,
              selectedIndex: controller.selectedIndex.value,
              onTap: (index) {
                controller.selectedIndex.value = index;
                controller.isExpanded.value = !controller.isExpanded.value;
              },
              expandedWidth: 300,
              backgroundColor: Colors.white,
              unselectedColor: Colors.black,
              tileActiveColor: Colors.cyan.shade900,
              logoPadding: 20,
              margin: const EdgeInsets.all(10),
              // logo: Image.asset(
              //   "assets/images/yarisanewlogo.png",
              //   height: 30,
              // ),
              footer: Visibility(
                visible: !controller.isExpanded.value,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.withOpacity(.2),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text("Upgrade to Pro")),
                      const SizedBox(height: 15),
                      Text(
                        "Upgrade to PRO version for more features.",
                        textAlign: TextAlign.center,
                        style: Theme.of(Get.context!)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.grey, fontSize: 11),
                      )
                    ],
                  ),
                ),
              ),
              navItems: const [
                NavDestinationItem(
                    isSectionHeader: false,
                    radius: 20,
                    trailing: Icon(
                      Icons.chevron_right_rounded,
                      size: 16,
                    ),
                    icon: Icon(Icons.home),
                    title: Text("Dashboard")),
                NavDestinationItem(
                    isSectionHeader: false,
                    radius: 20,
                    trailing: Icon(
                      Icons.chevron_right_rounded,
                      size: 16,
                    ),
                    icon: Icon(Icons.payment),
                    title: Text("Transaction")),
                NavDestinationItem(
                    isSectionHeader: false,
                    radius: 20,
                    trailing: Icon(
                      Icons.chevron_right_rounded,
                      size: 16,
                    ),
                    icon: Icon(Icons.credit_card),
                    title: Text("Card Payments")),
                NavDestinationItem(
                    isSectionHeader: false,
                    radius: 20,
                    trailing: Icon(
                      Icons.chevron_right_rounded,
                      size: 16,
                    ),
                    icon: Icon(Icons.folder),
                    title: Text("Documents")),
                NavDestinationItem(
                    isSectionHeader: true,
                    icon: Icon(Icons.report),
                    title: Text("Reports")),
                NavDestinationItem(
                    isSectionHeader: false,
                    radius: 20,
                    trailing: Icon(
                      Icons.chevron_right_rounded,
                      size: 16,
                    ),
                    icon: Icon(Icons.stacked_line_chart),
                    title: Text("Management Reports")),
                NavDestinationItem(
                    isSectionHeader: false,
                    radius: 20,
                    trailing: Icon(
                      Icons.chevron_right_rounded,
                      size: 16,
                    ),
                    icon: Icon(Icons.stacked_bar_chart),
                    title: Text("Financial Reports")),
                NavDestinationItem(
                    isSectionHeader: true,
                    icon: Icon(Icons.settings),
                    title: Text("Settings")),
                NavDestinationItem(
                    isSectionHeader: false,
                    radius: 20,
                    trailing: Icon(
                      Icons.chevron_right_rounded,
                      size: 16,
                    ),
                    icon: Icon(Icons.brush),
                    title: Text("Clear Cache")),
                NavDestinationItem(
                    isSectionHeader: false,
                    radius: 20,
                    trailing: Icon(
                      Icons.chevron_right_rounded,
                      size: 16,
                    ),
                    icon: Icon(Icons.settings),
                    title: Text("Preferences")),
                NavDestinationItem(
                    isSectionHeader: false,
                    radius: 20,
                    trailing: Icon(
                      Icons.chevron_right_rounded,
                      size: 16,
                    ),
                    icon: Icon(Icons.admin_panel_settings),
                    title: Text("Admin Settings")),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text('tablet'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
