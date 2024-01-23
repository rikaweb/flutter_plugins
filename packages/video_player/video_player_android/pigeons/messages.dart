// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/messages.g.dart',
  dartTestOut: 'test/test_api.dart',
  javaOut: 'android/src/main/java/io/flutter/plugins/videoplayer/Messages.java',
  javaOptions: JavaOptions(
    package: 'io.flutter.plugins.videoplayer',
  ),
  copyrightHeader: 'pigeons/copyright.txt',
))
class TextureMessage {
  TextureMessage(this.textureId);
  int textureId;
}

class LoopingMessage {
  LoopingMessage(this.textureId, this.isLooping);
  int textureId;
  bool isLooping;
}

class VolumeMessage {
  VolumeMessage(this.textureId, this.volume);
  int textureId;
  double volume;
}

class PlaybackSpeedMessage {
  PlaybackSpeedMessage(this.textureId, this.speed);
  int textureId;
  double speed;
}

class PositionMessage {
  PositionMessage(this.textureId, this.position);
  int textureId;
  int position;
}

class CreateMessage {
  CreateMessage({required this.httpHeaders});
  String? asset;
  String? uri;
  String? packageName;
  String? formatHint;
  Map<String?, String?> httpHeaders;
}

class MixWithOthersMessage {
  MixWithOthersMessage(this.mixWithOthers);
  bool mixWithOthers;
}

class GetEmbeddedSubtitlesMessage {
  GetEmbeddedSubtitlesMessage(this.language, this.label, this.trackIndex,
      this.groupIndex, this.renderIndex);

  final String? language;
  final String? label;
  final int trackIndex;
  final int groupIndex;
  final int renderIndex;
}

class GetEmbeddedAudioTracksMessage {
  GetEmbeddedAudioTracksMessage(this.language, this.label, this.trackIndex,
      this.groupIndex, this.renderIndex);

  final String? language;
  final String? label;
  final int trackIndex;
  final int groupIndex;
  final int renderIndex;
}

class SetEmbeddedSubtitlesMessage {
  SetEmbeddedSubtitlesMessage(
    this.textureId,
    this.language,
    this.label,
    this.trackIndex,
    this.groupIndex,
    this.renderIndex,
  );

  final int textureId;
  final String? language;
  final String? label;
  final int? trackIndex;
  final int? groupIndex;
  final int? renderIndex;
}

class SetEmbeddedAudioTracksMessage {
  SetEmbeddedAudioTracksMessage(
    this.textureId,
    this.language,
    this.label,
    this.trackIndex,
    this.groupIndex,
    this.renderIndex,
  );

  final int textureId;
  final String? language;
  final String? label;
  final int? trackIndex;
  final int? groupIndex;
  final int? renderIndex;
}

@HostApi(dartHostTestHandler: 'TestHostVideoPlayerApi')
abstract class AndroidVideoPlayerApi {
  void initialize();
  TextureMessage create(CreateMessage msg);
  void dispose(TextureMessage msg);
  void setLooping(LoopingMessage msg);
  void setVolume(VolumeMessage msg);
  void setPlaybackSpeed(PlaybackSpeedMessage msg);
  void play(TextureMessage msg);
  PositionMessage position(TextureMessage msg);
  void seekTo(PositionMessage msg);
  void pause(TextureMessage msg);
  void setMixWithOthers(MixWithOthersMessage msg);
  List<GetEmbeddedSubtitlesMessage?> getEmbeddedSubtitles(TextureMessage msg);
  List<GetEmbeddedAudioTracksMessage?> getEmbeddedAudioTracks(
      TextureMessage msg);
  void setEmbeddedSubtitles(SetEmbeddedSubtitlesMessage msg);
  void setEmbeddedAudioTracks(SetEmbeddedAudioTracksMessage msg);
}
