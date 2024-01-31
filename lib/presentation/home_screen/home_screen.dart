import 'package:flutter/material.dart';
import 'package:lsc/core/app_export.dart';
import 'package:badges/badges.dart' as badges;
import 'package:lsc/presentation/home_screen/bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(HomeState())..add(HomeInitialEvent()),
      child: HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 50.v,
        title: Text('LSC',
            style: theme.textTheme.headlineLarge!.copyWith(
              color: Colors.black,
              fontSize: 20.v,
              fontWeight: FontWeight.w700,
            )),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black, // Change color here
          size: 20.h, // Change size here
        ),
        actions: [
          badges.Badge(
            // badgeContent: Text('3', style: theme.textTheme.displaySmall),
            position: badges.BadgePosition.topEnd(top: 10, end: 10),
            child: IconButton(
              onPressed: () {
                NavigatorService.pushNamed(AppRoutes.notificationScreen);
              },
              icon: Icon(
                Icons.notifications,
                color: Colors.black,
                size: 20.h,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: 390.h,
        height: 70.v,
        margin: EdgeInsets.all(10.v),
        padding: EdgeInsets.all(10.v),
        decoration: BoxDecoration(
          color: appTheme.blue4FC3F7,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Current order*",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.displaySmall!.copyWith(
                      color: Colors.white,
                      fontSize: 14.v,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Receiver: aaaaaaaaaaaaaaaaaaaaaaaaa",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.displaySmall!.copyWith(
                      color: Colors.white,
                      fontSize: 14.v,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Delivery address: bbbbbbbbbbbbbbbbbbbbb",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.displaySmall!.copyWith(
                      color: Colors.white,
                      fontSize: 14.v,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.h),
            InkWell(
              onTap: () =>
                  NavigatorService.pushNamed(AppRoutes.inProgressOrderScreen),
              child: Icon(
                Icons.arrow_circle_right_outlined,
                color: Colors.white,
                size: 30.h,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: Drawer(
        backgroundColor: appTheme.gray414755,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
                  decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstant.lscLogo),
                  fit: BoxFit.fill,
                ),
              )),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              title: Text('Profile', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Handle item 1 tap
                NavigatorService.pushNamed(AppRoutes.profileScreen);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 20.h,
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.add_box,
                  color: Colors.white,
                ),
              ),
              title:
                  Text('Control Panel', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Handle item 1 tap
                NavigatorService.pushNamed(AppRoutes.controlPanelScreen);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 20.h,
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.history,
                  color: Colors.white,
                ),
              ),
              title: Text('History', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Handle item 1 tap
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 20.h,
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
              title: Text('Log-out', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Handle item 1 tap
                context.read<HomeBloc>().add(
                      LogoutEvent(),
                    );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 20.h,
              ),
            ),
          ],
        ),
      ),
      body: Material(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: appTheme.bgEDF5F8,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.h, top: 10.v),
                  child: Row(
                    children: [
                      Icon(Icons.history, color: Colors.black, size: 20.h),
                      SizedBox(width: 10.h),
                      Text(
                        'Recent Activity',
                        style: theme.textTheme.headlineSmall!.copyWith(
                          color: Colors.black,
                          fontSize: 16.v,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: 10.h, top: 10.v, right: 10.h, bottom: 10.v),
                  padding: EdgeInsets.all(10.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Order ID: ",
                            style: theme.textTheme.displaySmall!.copyWith(
                              color: Colors.black,
                              fontSize: 14.v,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "OD123456789",
                              textAlign: TextAlign.right,
                              style: theme.textTheme.displaySmall!.copyWith(
                                color: Colors.black,
                                fontSize: 14.v,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.v),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Delivery address: ",
                              style: theme.textTheme.displaySmall!.copyWith(
                                color: Colors.black,
                                fontSize: 14.v,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "abcxyz",
                                textAlign: TextAlign.right,
                                style: theme.textTheme.displaySmall!.copyWith(
                                  color: Colors.black,
                                  fontSize: 14.v,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.v),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Receiver: ",
                              style: theme.textTheme.displaySmall!.copyWith(
                                color: Colors.black,
                                fontSize: 14.v,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "abcxyz",
                                textAlign: TextAlign.right,
                                style: theme.textTheme.displaySmall!.copyWith(
                                  color: Colors.black,
                                  fontSize: 14.v,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.v),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Order Status: ",
                              style: theme.textTheme.displaySmall!.copyWith(
                                color: Colors.black,
                                fontSize: 14.v,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Done",
                                textAlign: TextAlign.right,
                                style: theme.textTheme.displaySmall!.copyWith(
                                  color: Colors.green,
                                  fontSize: 14.v,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
