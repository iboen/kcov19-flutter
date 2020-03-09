import 'package:equatable/equatable.dart';

abstract class ConfirmedEvent extends Equatable {
  const ConfirmedEvent();

  @override
  List<Object> get props => [];
}

class LoadConfirmed extends ConfirmedEvent{}