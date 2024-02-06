
// ignore_for_file: must_be_immutable

part of 'shipment_bloc.dart';

class ShipmentState extends Equatable {
   ShipmentState({
    this.shipment,
  });

  Shipment? shipment;

  @override
  List<Object?> get props => [shipment];

  ShipmentState copyWith({
    Shipment? shipment,
  }) {
    return ShipmentState(
      shipment: shipment ?? this.shipment,
    );
  }
}