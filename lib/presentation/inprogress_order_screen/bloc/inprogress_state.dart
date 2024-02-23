// ignore_for_file: override_on_non_overriding_member, must_be_immutable

part of 'inprogress_bloc.dart';

class InprogressState extends Equatable {
  InprogressState({
    this.isShowCompletedButton = false,
    PendingOrder? selectedOrder,
  });

  bool isShowCompletedButton;
  PendingOrder? selectedOrder;

  @override
  List<Object?> get props => [this.isShowCompletedButton, this.selectedOrder];

  InprogressState copyWith({
    bool? isShowCompletedButton,
    PendingOrder? selectedOrder,
  }) {
    return InprogressState(
      isShowCompletedButton: isShowCompletedButton ?? this.isShowCompletedButton,
      selectedOrder:selectedOrder ?? this.selectedOrder,
    );
  }
}
