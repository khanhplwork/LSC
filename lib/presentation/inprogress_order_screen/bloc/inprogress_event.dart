// ignore_for_file: override_on_non_overriding_member

part of 'inprogress_bloc.dart';

abstract class InprogressEvent extends Equatable {}

class InprogressInitialEvent extends InprogressEvent {
  @override
  List<Object> get props => [];
}

class InprogressStopLiveLocationEvent extends InprogressEvent {
  @override
  List<Object> get props => [];
}

class OnClickCompletedOrderEvent extends InprogressEvent {
  final List<XFile> images;
  OnClickCompletedOrderEvent({required this.images});
  @override
  List<Object> get props => [];
}

class InprogressChooseOrderEvent extends InprogressEvent {
  final PendingOrder selectedOrder;

  InprogressChooseOrderEvent(this.selectedOrder);

  @override
  List<Object> get props => [selectedOrder];
}

class InprogressBackToListEvent extends InprogressEvent {
  @override
  List<Object> get props => [];
}

class InprogressAddReceiptLocation extends InprogressEvent {
  @override
  List<Object> get props => [];
}
