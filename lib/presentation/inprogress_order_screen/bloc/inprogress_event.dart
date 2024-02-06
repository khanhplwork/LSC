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
