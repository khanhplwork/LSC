import 'package:lsc/core/model/shipment_model/status_style.dart';

class ShipmentData {
    int statusInvoice;
    int orderIncomplete;
    int isConsolidate;
    int isPickup;
    double totalOrder;
    int orderId;
    String orderPrefix;
    String orderNo;
    DateTime orderDate;
    int senderId;
    int receiverId;
    int orderCourier;
    int orderPayMode;
    int statusCourier;
    int driverId;
    int orderServiceOptions;
    String modStyle;
    String color;
    dynamic receiverName;
    String addressOrder;
    String payment;
    String totalCost;
    String invoiceStatus;
    StatusStyle statusStylePickup;
    StatusStyle statusStyleConsolidate;

    ShipmentData({
        required this.statusInvoice,
        required this.orderIncomplete,
        required this.isConsolidate,
        required this.isPickup,
        required this.totalOrder,
        required this.orderId,
        required this.orderPrefix,
        required this.orderNo,
        required this.orderDate,
        required this.senderId,
        required this.receiverId,
        required this.orderCourier,
        required this.orderPayMode,
        required this.statusCourier,
        required this.driverId,
        required this.orderServiceOptions,
        required this.modStyle,
        required this.color,
        required this.receiverName,
        required this.addressOrder,
        required this.payment,
        required this.totalCost,
        required this.invoiceStatus,
        required this.statusStylePickup,
        required this.statusStyleConsolidate,
    });

    factory ShipmentData.fromJson(Map<String, dynamic> json) => ShipmentData(
        statusInvoice: json["status_invoice"],
        orderIncomplete: json["order_incomplete"],
        isConsolidate: json["is_consolidate"],
        isPickup: json["is_pickup"],
        totalOrder: json["total_order"]?.toDouble(),
        orderId: json["order_id"],
        orderPrefix: json["order_prefix"],
        orderNo: json["order_no"],
        orderDate: DateTime.parse(json["order_date"]),
        senderId: json["sender_id"],
        receiverId: json["receiver_id"],
        orderCourier: json["order_courier"],
        orderPayMode: json["order_pay_mode"],
        statusCourier: json["status_courier"],
        driverId: json["driver_id"],
        orderServiceOptions: json["order_service_options"],
        modStyle: json["mod_style"],
        color: json["color"],
        receiverName: json["receiver_name"],
        addressOrder: json["address_order"],
        payment: json["payment"],
        totalCost: json["total_cost"],
        invoiceStatus: json["invoice_status"],
        statusStylePickup: StatusStyle.fromJson(json["status_style_pickup"]),
        statusStyleConsolidate: StatusStyle.fromJson(json["status_style_consolidate"]),
    );

    Map<String, dynamic> toJson() => {
        "status_invoice": statusInvoice,
        "order_incomplete": orderIncomplete,
        "is_consolidate": isConsolidate,
        "is_pickup": isPickup,
        "total_order": totalOrder,
        "order_id": orderId,
        "order_prefix": orderPrefix,
        "order_no": orderNo,
        "order_date": "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
        "sender_id": senderId,
        "receiver_id": receiverId,
        "order_courier": orderCourier,
        "order_pay_mode": orderPayMode,
        "status_courier": statusCourier,
        "driver_id": driverId,
        "order_service_options": orderServiceOptions,
        "mod_style": modStyle,
        "color": color,
        "receiver_name": receiverName,
        "address_order": addressOrder,
        "payment": payment,
        "total_cost": totalCost,
        "invoice_status": invoiceStatus,
        "status_style_pickup": statusStylePickup.toJson(),
        "status_style_consolidate": statusStyleConsolidate.toJson(),
    };
}