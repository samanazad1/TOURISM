import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourism/assistant/helper.dart';
import 'package:tourism/assistant/util/colors.dart';
import 'package:tourism/view/destinations/resorts/resort_details_page.dart';
import 'package:tourism/view/destinations/todos/todos_page.dart';

Widget buildDescription() {
  return Container(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'About',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 12),
        Text(
          'Experience the perfect blend of natural beauty and cultural heritage in this stunning destination. From pristine beaches to historic landmarks, every corner tells a unique story waiting to be discovered.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
            height: 1.5,
          ),
        ),
      ],
    ),
  );
}

Widget buildThingsToDo() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Things to Do',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
      ),
      SizedBox(
        height: 120,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemCount: 5, // Number of activity cards
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to activity details screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TodosDetailsPage(activityId: index),
                  ),
                );
              },
              child: Container(
                width: 160,
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue[400]!,
                      Colors.blue[600]!,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Icon(
                        Icons.explore,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      bottom: 12,
                      left: 12,
                      child: Text(
                        'Activity ${index + 1}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}

Widget buildNearbyResorts() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Nearby Resorts',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
      ),
      SizedBox(
        height: 140,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemCount: 3, // Number of resort cards
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to resort details screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResortDetailsScreen(resortId: index),
                  ),
                );
              },
              child: Container(
                width: 180,
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.green[400]!,
                      Colors.green[600]!,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Icon(
                        Icons.hotel,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      bottom: 12,
                      left: 12,
                      child: Text(
                        'Resort ${index + 1}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}

Widget buildGetInTouch(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Get in touch',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ContactInfoButton(
                  title: "Get Direction",
                  icon: 'assets/images/route.svg',
                  onTap: () {
                    launchTo(
                        'https://www.google.com/maps/place/Choman,+Erbil+Governorate/@36.6339796,44.875079,15z/data=!4m15!1m8!3m7!1s0x400417c64252ef37:0x180566f340df8300!2sChoman,+Erbil+Governorate!3b1!8m2!3d36.6340868!4d44.8886464!16s%2Fm%2F0108c735!3m5!1s0x400417c64252ef37:0x180566f340df8300!8m2!3d36.6340868!4d44.8886464!16s%2Fm%2F0108c735?entry=ttu&g_ep=EgoyMDI0MTAyOS4wIKXMDSoASAFQAw%3D%3D');
                  },
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: ContactInfoButton(
                  title: '9647512314881',
                  icon: Icons.call,
                  onTap: () {
                    telToPhone(context, '9647512314881');
                  },
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildExtraDetails() {
  return Container(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Additional Information',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 16),
        buildInfoRow(
            Icons.access_time, 'Best Time to Visit', 'October - March'),
        buildInfoRow(Icons.language, 'Languages', 'English, Local'),
        buildInfoRow(Icons.currency_exchange, 'Currency', 'USD'),
        buildInfoRow(Icons.wb_sunny, 'Weather', '25°C - 32°C'),
      ],
    ),
  );
}

Widget buildInfoRow(IconData icon, String title, String value) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 12.0),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
    ),
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: primaryColor, size: 24),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

class ContactInfoButton extends StatelessWidget {
  final String title;
  final dynamic icon;
  final Function() onTap;
  const ContactInfoButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 80,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
        decoration: BoxDecoration(
            border: Border.all(color: primaryColor),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIcon(
              icon: icon,
              color: primaryColor,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: const TextStyle(color: primaryColor, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}

class AppIcon extends StatelessWidget {
  final dynamic icon;
  final bool fromNetwork;
  final double? size;
  final Color? color;
  final bool biDirectional;
  const AppIcon(
      {super.key,
      required this.icon,
      this.size,
      this.color,
      this.fromNetwork = false,
      this.biDirectional = false});

  @override
  Widget build(BuildContext context) {
    int quarterTurns;
    if (biDirectional) {
      quarterTurns = 0;
    } else {
      quarterTurns = 0;
    }

    if (icon is String) {
      return RotatedBox(
        quarterTurns: quarterTurns,
        child: SvgPicture.asset(
          icon,
          width: size,
          height: size,
          color: color,
          fit: BoxFit.cover,
        ),
      );
    }
    if (icon is IconData) {
      return RotatedBox(
        quarterTurns: quarterTurns,
        child: Icon(
          icon,
          size: size,
          color: color,
        ),
      );
    }
    return const SizedBox();
  }
}
