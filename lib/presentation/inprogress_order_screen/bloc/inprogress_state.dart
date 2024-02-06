// ignore_for_file: override_on_non_overriding_member, must_be_immutable

part of 'inprogress_bloc.dart';

class InprogressState extends Equatable {
  InprogressState({
    this.isShowDetail = false,
    PendingOrder? selectedOrder,
  });

  bool isShowDetail;
  PendingOrder? selectedOrder;

  @override
  List<Object?> get props => [this.isShowDetail, this.selectedOrder];

  InprogressState copyWith({
    bool? isShowDetail,
    PendingOrder? selectedOrder,
  }) {
    return InprogressState(
      isShowDetail: isShowDetail ?? this.isShowDetail,
      selectedOrder:selectedOrder ?? this.selectedOrder,
    );
  }
}
