import 'package:flutter/material.dart' hide Radio;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import '../../../api_constants.dart';
import '../../../models/radio_response.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
part 'radio_state.dart';

class RadioCubit extends Cubit<RadioState> {
  RadioCubit() : super(RadioLoading());
  final AudioPlayer _player = AudioPlayer();

  Future<void> fetchRadios() async {
    emit(RadioLoading());
    try {
      final uri = Uri.https(ApiConstants.baseUrl, ApiConstants.radiosEndpoint);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final radioResponse = RadioResponse.fromJson(json);
        emit(RadioSuccess(radioResponse.radios!));
      } else {
        emit(RadioError("Failed to fetch radios."));
      }
    } catch (e) {
      emit(RadioError("An error occurred: $e"));
    }
  }

  Future<void> playRadio(String url) async {
    try {
      await _player.setUrl(url);
      _player.play();
    } catch (e) {
      emit(RadioError("Failed to play radio: $e"));
    }
  }

  Future<void> stopRadio() async {
    try {
      await _player.stop();
    } catch (e) {
      emit(RadioError("Failed to stop radio: $e"));
    }
  }

  @override
  Future<void> close() {
    _player.dispose();
    return super.close();
  }
}