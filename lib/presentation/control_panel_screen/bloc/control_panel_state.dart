// ignore_for_file: must_be_immutable

part of 'control_panel_bloc.dart';

class ControlPanelState extends Equatable {
  ControlPanelState({this.controlPanelData});
  ControlPanel? controlPanelData;
  @override
  List<Object?> get props => [controlPanelData];
  ControlPanelState copyWith({
    ControlPanel? controlPanelData,
  }) {
    return ControlPanelState(
      controlPanelData: controlPanelData ?? this.controlPanelData,
    );
  }
}
