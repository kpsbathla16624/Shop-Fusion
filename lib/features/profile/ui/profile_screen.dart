import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopfusion/features/orders%20Screen/ui/OrderScreen.dart';
import 'package:shopfusion/features/profile/ui/settings.dart';
import 'package:shopfusion/utils/constants/colors.dart';
import 'package:shopfusion/utils/helpers/helper_function.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Icon(
                    CupertinoIcons.person,
                    size: 40,
                  ),
                  radius: 40,
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    Text(
                      'Kamal Preet ',
                      style: TextStyle(fontSize: 30),
                    ),
                    Row(
                      children: [
                        Icon(Icons.phone),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '6398565788',
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
            Divider(),
            SizedBox(height: 20),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    HELPER.navigateToScreen(context, SettingsPage());
                  },
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        CupertinoIcons.person_fill,
                        size: 25,
                        color: SfColor.primary,
                      ),
                      SizedBox(width: 10),
                      Text(
                        ' Edit Profile',
                        style: TextStyle(fontSize: 25),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    HELPER.navigateToScreen(context, OrderScreen());
                  },
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        CupertinoIcons.cube_box_fill,
                        size: 25,
                        color: SfColor.primary,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Orders',
                        style: TextStyle(fontSize: 25),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    HELPER.navigateToScreen(context, SettingsPage());
                  },
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        CupertinoIcons.creditcard_fill,
                        size: 25,
                        color: SfColor.primary,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Saved Cards & Wallet',
                        style: TextStyle(fontSize: 25),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    HELPER.navigateToScreen(context, SettingsPage());
                  },
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        Icons.location_on,
                        size: 25,
                        color: SfColor.primary,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Saved Addresses',
                        style: TextStyle(fontSize: 25),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    HELPER.navigateToScreen(context, SettingsPage());
                  },
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        CupertinoIcons.bell_fill,
                        size: 25,
                        color: SfColor.primary,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Notification Settings',
                        style: TextStyle(fontSize: 25),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    HELPER.navigateToScreen(context, SettingsPage());
                  },
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        Icons.logout_rounded,
                        size: 25,
                        color: SfColor.primary,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Logout',
                        style: TextStyle(fontSize: 25),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
