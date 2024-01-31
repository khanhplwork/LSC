// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Login widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class HomeEvent extends Equatable {}

/// Event that is dispatched when the Login widget is first created.
class HomeInitialEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class LogoutEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}
