import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lsc/core/app_export.dart';
import 'package:lsc/core/model/pending_order_model/pending_order.dart';
import 'package:lsc/presentation/inprogress_order_screen/bloc/inprogress_bloc.dart';
import 'package:lsc/presentation/inprogress_order_screen/widgets/pending_order_item.dart';

class InProgressOrderScreen extends StatefulWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<InprogressBloc>(
      create: (context) =>
          InprogressBloc(InprogressState())..add(InprogressInitialEvent()),
      child: InProgressOrderScreen(),
    );
  }

  @override
  State<InProgressOrderScreen> createState() => _InProgressOrderScreenState();
}

class _InProgressOrderScreenState extends State<InProgressOrderScreen> {
  PendingOrder? selectedOrder;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InprogressBloc, InprogressState>(

        builder: (context, state) {
      return Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     context
        //         .read<InprogressBloc>()
        //         .add(InprogressStopLiveLocationEvent());
        //   },
        //   child: Icon(Icons.handshake),
        // ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(37.42796133580664, -122.085749655962),
                  zoom: 15,
                ),
                onMapCreated: (GoogleMapController controller) {
                  // You can customize the map here
                },
              ),
            ),
            DraggableScrollableSheet(
              minChildSize: 0.1,
              // Minimum height of the draggable sheet
              maxChildSize: 0.5,
              // Maximum height of the draggable sheet
              initialChildSize: 0.1,
              // Initial height of the draggable sheet
              expand: true,
              // Whether the sheet should expand when dragged to its maximum height

              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  margin: EdgeInsets.only(left: 10.h, right: 10.h),
                  decoration: BoxDecoration(
                    color: appTheme.bgEDF5F8,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.v),
                      topRight: Radius.circular(20.v),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocSelector<InprogressBloc, InprogressState, bool>(
                          selector: (state) => state.isShowDetail,
                          builder: (context, isShowDetail) {
                            if (!isShowDetail) {
                              return ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                padding: EdgeInsets.all(10.h),
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      context.read<InprogressBloc>().add(
                                          InprogressChooseOrderEvent(
                                              pendingOrders![index]));
                                      setState(() {
                                        selectedOrder = pendingOrders![index];
                                      });
                                    },
                                    child: pendingOrderItem(
                                        context, pendingOrders![index]),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    SizedBox(
                                      height: 10.v,
                                    ),
                                itemCount: pendingOrders!.length,
                              );
                            } else {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(
                                          top: 10.v, left: 10.h),
                                      child: IconButton(
                                        onPressed: () {
                                          context.read<InprogressBloc>().add(
                                              InprogressBackToListEvent());
                                        },
                                        icon: Icon(
                                          Icons.arrow_back,
                                          color: Colors.black,
                                        ),
                                      )),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 20.v, left: 20.h),
                                    child: Text(
                                      "Order Details",
                                      style: TextStyle(
                                        fontSize: 20.fSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 20.v, left: 20.h),
                                    child: Text(
                                      "Order ID: ${selectedOrder?.orderId ?? ''}",
                                      style: TextStyle(
                                        fontSize: 16.fSize,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 20.v, left: 20.h),
                                    child: Text(
                                      "Order Date: ${selectedOrder?.orderDate.toString().split(" ")[0] ?? ''}",
                                      style: TextStyle(
                                        fontSize: 16.fSize,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 20.v, left: 20.h),
                                    child: Text(
                                      "Receiver: ${selectedOrder?.receiverName ?? ''}",
                                      style: TextStyle(
                                        fontSize: 16.fSize,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 20.v, left: 20.h),
                                    child: Text(
                                      "Order Address: ${selectedOrder?.addressOrder ?? ''}",
                                      style: TextStyle(
                                        fontSize: 16.fSize,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 20.v, left: 20.h),
                                    child: Text(
                                      "Payment: ${selectedOrder?.payment ?? ''}",
                                      style: TextStyle(
                                        fontSize: 16.fSize,
                                      ),
                                    ),
                                  ),

                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 20.v, left: 20.h),
                                    child: Text(
                                      "Order Status: ${(selectedOrder?.isPickup == 1) ?"Pick up": ''} ${(selectedOrder?.isConsolidate == 1) ?"Consolidated": ''}",
                                      style: TextStyle(
                                        fontSize: 16.fSize,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 20.v, left: 20.h),
                                    child: Text(
                                      "Total cost: ${selectedOrder?.totalCost ?? ''}",
                                      style: TextStyle(
                                        fontSize: 16.fSize,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 20.v, left: 20.h),
                                    child: Text(
                                      "Invoice status: ${selectedOrder?.invoiceStatus ?? ''}",
                                      style: TextStyle(
                                        fontSize: 16.fSize,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50.v,
                                  ),

                                ],
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                  margin: EdgeInsets.only(top: 30.v, left: 10.h),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  )),
            )
          ],
        ),
      );
    });
  }
}
