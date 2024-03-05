// ignore_for_file: override_on_non_overriding_member, must_be_immutable

part of 'inprogress_bloc.dart';

class InprogressState extends Equatable {
  InprogressState({
    this.isShowCompletedButton = false,
    this.selectedOrder,
    this.receiptLocation,
    this.markers,
  });

  bool isShowCompletedButton;
  PendingOrder? selectedOrder;
  Location? receiptLocation;
  List<Marker>? markers;

  @override
  List<Object?> get props => [
        this.isShowCompletedButton,
        this.selectedOrder,
        this.receiptLocation,
        this.markers,
      ];

  InprogressState copyWith({
    bool? isShowCompletedButton,
    PendingOrder? selectedOrder,
    Location? receiptLocation,
    List<Marker>? markers,
  }) {
    return InprogressState(
      isShowCompletedButton:
          isShowCompletedButton ?? this.isShowCompletedButton,
      selectedOrder: selectedOrder ?? this.selectedOrder,
      receiptLocation: receiptLocation ?? this.receiptLocation,
      markers: markers,
    );
  }
}
