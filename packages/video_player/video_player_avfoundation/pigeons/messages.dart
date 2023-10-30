// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/messages.g.dart',
  dartTestOut: 'test/test_api.g.dart',
  objcHeaderOut: 'ios/Classes/messages.g.h',
  objcSourceOut: 'ios/Classes/messages.g.m',
  objcOptions: ObjcOptions(
    prefix: 'FLT',
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

  final String language;
  final String label;
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

class EnterPictureInPictureMessage {
  EnterPictureInPictureMessage(
    this.textureId,
    this.left,
    this.top,
    this.width,
    this.height,
  );

  int textureId;
  double left;
  double top;
  double width;
  double height;
}

class SetStartPictureInPictureAutomaticallyMessage {
  SetStartPictureInPictureAutomaticallyMessage(
    this.textureId,
    this.isEnabled,
    this.left,
    this.top,
    this.width,
    this.height,
  );

  int textureId;
  bool isEnabled;
  double left;
  double top;
  double width;
  double height;
}

@HostApi(dartHostTestHandler: 'TestHostVideoPlayerApi')
abstract class AVFoundationVideoPlayerApi {
  @ObjCSelector('initialize')
  void initialize();

  @ObjCSelector('create:')
  TextureMessage create(CreateMessage msg);

  @ObjCSelector('dispose:')
  void dispose(TextureMessage msg);

  @ObjCSelector('setLooping:')
  void setLooping(LoopingMessage msg);

  @ObjCSelector('setVolume:')
  void setVolume(VolumeMessage msg);

  @ObjCSelector('setPlaybackSpeed:')
  void setPlaybackSpeed(PlaybackSpeedMessage msg);

  @ObjCSelector('play:')
  void play(TextureMessage msg);

  @ObjCSelector('position:')
  PositionMessage position(TextureMessage msg);

  @ObjCSelector('seekTo:')
  void seekTo(PositionMessage msg);

  @ObjCSelector('pause:')
  void pause(TextureMessage msg);

  @ObjCSelector('setMixWithOthers:')
  void setMixWithOthers(MixWithOthersMessage msg);

  @ObjCSelector('getEmbeddedSubtitles:')
  List<GetEmbeddedSubtitlesMessage?> getEmbeddedSubtitles(TextureMessage msg);

  @ObjCSelector('setEmbeddedSubtitles:')
  void setEmbeddedSubtitles(SetEmbeddedSubtitlesMessage msg);

  @ObjCSelector('enterPictureInPicture:')
  void enterPictureInPicture(EnterPictureInPictureMessage msg);

  @ObjCSelector('setStartPictureInPictureAutomatically:')
  void setStartPictureInPictureAutomatically(SetStartPictureInPictureAutomaticallyMessage msg);
}
