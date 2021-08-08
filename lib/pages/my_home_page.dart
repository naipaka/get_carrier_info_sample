import 'package:flutter/material.dart';
import 'package:get_carrier_info_sample/utils/network_util.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<String?>(
              future: NetworkUtil.currentConnection(),
              builder: (context, snapshot) {
                final connection = snapshot.data ?? '取得中...';
                return Text(
                  '回線：$connection',
                );
              },
            ),
            FutureBuilder<String?>(
              future: NetworkUtil.getCarrierName(),
              builder: (context, snapshot) {
                final carrierName = snapshot.data ?? '取得中...';
                return Text(
                  'キャリア名：$carrierName',
                );
              },
            ),
            FutureBuilder<String>(
              future: NetworkUtil.getMobileNetworkOperator(),
              builder: (context, snapshot) {
                final mobileNetworkOperator = snapshot.data ?? '取得中...';
                return Text(
                  'PLMN：$mobileNetworkOperator',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
