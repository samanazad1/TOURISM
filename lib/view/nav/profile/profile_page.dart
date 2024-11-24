import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism/assistant/helper.dart';
import 'package:tourism/assistant/util/colors.dart';
import 'package:tourism/assistant/util/sizes.dart';
import 'package:tourism/controller/user_controller.dart';
import 'package:tourism/view/auth/auth_page.dart';
import 'package:tourism/view/nav/profile/profile_pages/edit_profile.dart';
import 'package:tourism/view/settings/setting_pagee.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = "Guest";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child:
            Consumer<UserController>(builder: (context, userProvider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar and Edit button
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    backgroundImage: AssetImage(
                        'assets/images/user-avatar.png'), // Replace with your image asset
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userProvider.isLoggedIn
                            ? userProvider.userModel!.name
                            : userName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                          userProvider.isLoggedIn
                              ? userProvider.userModel!.id
                              : "#ID: 344",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // User name and edit button

              Text(
                "App Settings",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              // User name and edit button
              ProfileButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                },
                text: "Edit Profile",
              ),
              ProfileButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
                text: "Settings",
              ),
              ProfileButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutPage()),
                  );
                },
                text: "About",
              ),
              ProfileButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SupportPage()),
                  );
                },
                text: "Support",
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: primaryColor,
              ),
              SizedBox(
                height: 20,
              ),
              ProfileButton(
                onTap: () {
                  userProvider.isLoggedIn
                      ? areYouSure(context, function: () {
                          userProvider.logout().then((value) =>
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return AuthPage();
                              })));
                        }, title: "Are you sure? ")
                      : Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                          return AuthPage();
                        }));
                },
                isLogout: true,
                text: userProvider.isLoggedIn ? "Logout" : "login",
                body: Text(
                  userProvider.isLoggedIn ? "Logout" : "login",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color:
                          userProvider.isLoggedIn ? Colors.red : Colors.green),
                ),
              )
            ],
          );
        }),
      ),
    );
  }

  // A dialog to edit user name
  Future<void> _editNameDialog() async {
    TextEditingController nameController =
        TextEditingController(text: userName);

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap button
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Name'),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(hintText: 'Enter your name'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                setState(() {
                  userName = nameController.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class ProfileButton extends StatelessWidget {
  final String? text;
  final bool isAddress;
  final bool isLogout;
  final Widget? body;
  final Color backgroundColor;
  final void Function()? onTap;
  const ProfileButton(
      {super.key,
      this.isAddress = false,
      this.isLogout = false,
      this.text,
      this.backgroundColor = Colors.white,
      required this.onTap,
      this.body});

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: isAddress
            ? 72 / getAbsHeight(context)
            : isLogout
                ? 64 / getAbsHeight(context)
                : 64 / getAbsHeight(context),
        decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: const Color.fromARGB(255, 228, 228, 228)),
            borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.symmetric(horizontal: 15 / getAbsWidth(context)),
        margin: EdgeInsets.symmetric(vertical: 4 / getAbsHeight(context)),
        child: Align(
          alignment:
              locale == 'en' ? Alignment.centerLeft : Alignment.centerRight,
          child: isAddress || isLogout
              ? body
              : Text(
                  text!,
                  style: TextStyle(
                    fontSize: 16 / getAbsWidth(context),
                    fontWeight: FontWeight.w400,
                  ),
                ),
        ),
      ),
    );
  }
}
