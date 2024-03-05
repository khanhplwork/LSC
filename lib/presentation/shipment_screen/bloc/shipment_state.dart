// ignore_for_file: must_be_immutable

part of 'shipment_bloc.dart';

class ShipmentState {
  ShipmentState({
    this.shipment,
    this.searchController,
  });

  Shipment? shipment;
  TextEditingController? searchController;

  ShipmentState copyWith({
    Shipment? shipment,
    TextEditingController? searchController,
  }) {
    return ShipmentState(
      shipment: shipment ?? this.shipment,
      searchController: searchController ?? this.searchController,
    );
  }
}
