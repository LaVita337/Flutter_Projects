import 'package:TikTok/features/videos/models/playback_config_model.dart';
import 'package:TikTok/features/videos/repos/playback_config_repo.dart';
import 'package:flutter/material.dart';

class PlaybackConfigViewModel extends ChangeNotifier {
  final PlaybackConfigRepository _repository;

  late final PlaybackConfigModel _model = PlaybackConfigModel(
    muted: _repository.isMuted(),
    autoPlay: _repository.isAutoplay(),
  );
  PlaybackConfigViewModel(this._repository);

  bool get muted => _model.muted;
  bool get autoPlay => _model.autoPlay;

  void setMuted(bool value) {
    _repository.setMuted(value);
    _model.muted = value;
    notifyListeners();
  }

  void setAutoPlay(bool value) {
    _repository.setAutoplay(value);
    _model.autoPlay = value;
    notifyListeners();
  }
}
