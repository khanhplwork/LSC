
part of 'shipment_bloc.dart';

abstract class ShipmentEvent extends Equatable {
}

class InitShipmentEvent extends ShipmentEvent {
  @override
  List<Object?> get props => [];
}