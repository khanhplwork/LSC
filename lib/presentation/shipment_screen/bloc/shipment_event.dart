part of 'shipment_bloc.dart';

abstract class ShipmentEvent extends Equatable {}

class InitShipmentEvent extends ShipmentEvent {
  @override
  List<Object?> get props => [];
}

class SearchShipmentEvent extends ShipmentEvent {
  @override
  List<Object?> get props => [];
}

class UpdateStatusToDeliveringEvent extends ShipmentEvent {
  final int shipmentId;

  UpdateStatusToDeliveringEvent(this.shipmentId);

  @override
  List<Object?> get props => [shipmentId];
}
