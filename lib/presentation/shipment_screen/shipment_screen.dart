// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:lsc/core/app_export.dart';
import 'package:lsc/presentation/shipment_screen/bloc/shipment_bloc.dart';
import 'package:lsc/widgets/custom_icon_button.dart';
import 'package:lsc/widgets/custom_text_form_filed2.dart';

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
  ScrollController scrollController = ScrollController();

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
                SizedBox(
                  height: 20.v,
                ),
                Row(
                  children: [
                    Expanded(
                      child: BlocSelector<ShipmentBloc, ShipmentState,
                          TextEditingController?>(
                        selector: (state) => state.searchController,
                        builder: (context, searchController) {
                          return Padding(
                            padding: EdgeInsets.only(left: 10.h, right: 10.h),
                            child: CustomTextFormField2(
                              focusNode: FocusNode(),
                              autofocus: false,
                              controller: searchController,
                              hintText: "Search",
                              textInputType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.fSize),
                        color: Colors.blueAccent,
                      ),
                      child: IconButton(
                        onPressed: () {
                          context
                              .read<ShipmentBloc>()
                              .add(SearchShipmentEvent());
                        },
                        icon: Icon(
                          Icons.search,
                          size: 20.fSize,
                        ),
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.v,
                ),
                (state.shipment != null)
                    // ? (state.shipment!.data.isNotEmpty)
                    ? Scrollbar(
                        controller: scrollController,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          controller: scrollController,
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
