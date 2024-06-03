import 'package:audioplayers/audioplayers.dart';

import '../index.dart';

class AudioService {
  AudioPlayer? _audioPlayer;

  AudioService() {
    _audioPlayer = AudioPlayer();
  }

  Future<void> playSound() async {
    await _audioPlayer?.play(AssetSource(Song.path), volume: 50);
  }

  Future<void> stopSound() async {
    await _audioPlayer?.stop();
  }

  void dispose() {
    _audioPlayer?.dispose();
  }
}
