part of 'radio_cubit.dart';

@immutable
abstract class RadioState {}

class RadioLoading extends RadioState {}

class RadioSuccess extends RadioState {
  final List<Radio> radios;

  RadioSuccess(this.radios);
}

class RadioError extends RadioState {
  final String message;

  RadioError(this.message);
}
