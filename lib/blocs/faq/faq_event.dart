import 'package:equatable/equatable.dart';

abstract class FaqEvent extends Equatable {
  const FaqEvent();

  @override
  List<Object> get props => [];
}

class LoadFaq extends FaqEvent{}
