import 'package:bluetooth_scan_app/screens/device_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FlutterBlue flutterBlue = FlutterBlue.instance;
  final List<BluetoothDevice> devicesList = List<BluetoothDevice>();

  List<BluetoothService> bluetoothServices;

  _showDeviceList(final BluetoothDevice device) {
    setState(() {
      devicesList.add(device);
    });
  }

  @override
  void initState() {
    super.initState();
    flutterBlue.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        _showDeviceList(result.device);
      }
    });
    flutterBlue.startScan();
  }

  ListView _buildListViewOfDevices() {
    List<Container> containers = List<Container>();
    for (BluetoothDevice device in devicesList) {
      containers.add(
        Container(
          margin: const EdgeInsets.all(2),
          //color: Colors.purple[50],
          height: 60,
          child: InkWell(
            //splashColor: Colors.purple,
            onTap: () {
              //flutterBlue.stopScan();
              Navigator.of(context).pushNamed(DeviceDetails.nameRoute,
                  arguments: ScreenArguments(device.name, device.id));
            },
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 6, bottom: 1),
                        child: Text(
                            device.name == '' ? 'Unknown Device' : device.name,
                            style: Theme.of(context).textTheme.headline1),
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: 6, top: 2),
                          child: Text(device.id.toString(),
                              style: Theme.of(context).textTheme.subtitle1)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Available Devices...',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.purple[300],
                  fontFamily: 'QuickSand',
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            )),
        ...containers,
      ],
    );
  }

  // ListView _buildView() {
  //   return _buildListViewOfDevices();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // elevation: 1,
          centerTitle: true,
          title: Text('Bluetooth Low Energy Scanner',
              style: Theme.of(context).appBarTheme.titleTextStyle),
        ),
        body: Container(
            color: Colors.purple[50], child: _buildListViewOfDevices()));
  }
}
