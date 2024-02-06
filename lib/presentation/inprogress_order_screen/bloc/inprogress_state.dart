
// ignore_for_file: override_on_non_overriding_member, must_be_immutable

part of 'inprogress_bloc.dart';

class InprogressState extends Equatable {
  DriverTrip? curTrip;
  Timer? timer;
  InprogressState({
    this.curTrip,
    this.timer,
  });
  @override
  List<Object?> get props => [curTrip, timer];
  InprogressState copyWith({
    DriverTrip? curTrip,
    Timer? timer,
  }) {
    return InprogressState(
      curTrip: curTrip ?? this.curTrip,
      timer: timer ?? this.timer,
    );
  }
}