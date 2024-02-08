// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

class HomeState extends Equatable {
  HomeState({this.pendingOrders, this.recentShipment});

  List<PendingOrder>? pendingOrders;
  Shipment? recentShipment;

  @override
  List<Object?> get props => [this.pendingOrders, this.recentShipment];

  HomeState copyWith({List<PendingOrder>? pendingOrders, Shipment? recentShipment}) {
    return HomeState(
        pendingOrders: pendingOrders ?? this.pendingOrders,
        recentShipment: recentShipment ?? this.recentShipment);
  }
}
