// ignore_for_file: must_be_immutable

part of 'shipment_bloc.dart';

class ShipmentState extends Equatable {
  ShipmentState({
    this.shipment,
    this.searchController,
  });

  Shipment? shipment;
  TextEditingController? searchController;

  @override
  List<Object?> get props => [shipment, searchController];

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
