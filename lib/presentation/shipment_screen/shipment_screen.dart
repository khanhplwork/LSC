// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:lsc/core/app_export.dart';
import 'package:lsc/presentation/shipment_screen/bloc/shipment_bloc.dart';

class ShipmentScreen extends StatefulWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<ShipmentBloc>(
      create: (context) =>
          ShipmentBloc(ShipmentState())..add(InitShipmentEvent()),
      child: ShipmentScreen(),
    );
  }

  @override
  _ShipmentScreenState createState() => _ShipmentScreenState();
}

class _ShipmentScreenState extends State<ShipmentScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShipmentBloc, ShipmentState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 50.v,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
            ),
          ),
          title: Text('List Shipments',
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
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (state.shipment != null)
                    // ? (state.shipment!.data.isNotEmpty)
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Text('Tracking'),
                            ),
                            DataColumn(label: Text('Date')),
                            DataColumn(label: Text('Recipient')),
                            DataColumn(label: Text('Destination')),
                            DataColumn(label: Text('Payment')),
                            DataColumn(label: Text('Status')),
                            DataColumn(label: Text('Total cost')),
                            DataColumn(label: Text('Invoice Status')),
                          ],
                          rows: [
                            for (var shipment in state.shipment!.data)
                              DataRow(
                                cells: [
                                  DataCell(Text(
                                    shipment.orderPrefix.toString() +
                                        shipment.orderNo.toString(),
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                  DataCell(Text(shipment.orderDate
                                      .toString()
                                      .split(" ")[0])),
                                  DataCell(Text(shipment.receiverName ?? "")),
                                  DataCell(Text(shipment.addressOrder)),
                                  DataCell(Text(shipment.payment)),
                                  DataCell(Text("status")),
                                  DataCell(Text(shipment.totalCost)),
                                  DataCell(Text(shipment.invoiceStatus)),
                                ],
                              ),
                          ],
                        ),
                      )
                    // : SizedBox()
                    : SizedBox(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
