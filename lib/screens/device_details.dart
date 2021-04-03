import 'package:flutter/material.dart';

class DeviceDetails extends StatelessWidget {
  static const nameRoute = 'device-details';

  final ScreenArguments arguments;
  DeviceDetails(this.arguments);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          arguments.title.length > 0 ? arguments.title : 'Unknown Device',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Device Name: ',
                      style: Theme.of(context).textTheme.headline2),
                  Text(arguments.title.length > 0 ? arguments.title : 'Unknown',
                      style: Theme.of(context).textTheme.subtitle2)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'MAC Address: ',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(arguments.id.toString(),
                      style: Theme.of(context).textTheme.subtitle2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScreenArguments {
  final String title;
  final id;

  ScreenArguments(this.title, this.id);
}
