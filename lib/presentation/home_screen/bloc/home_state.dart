part of 'home_bloc.dart';

class HomeState extends Equatable {
  HomeState({this.pendingOrders});

  List<PendingOrder>? pendingOrders;

  @override
  List<Object?> get props => [this.pendingOrders];

  HomeState copyWith({List<PendingOrder>? pendingOrders}) {
    return HomeState(pendingOrders: pendingOrders ?? this.pendingOrders);
  }
}
