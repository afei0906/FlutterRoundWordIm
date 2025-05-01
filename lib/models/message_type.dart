part of 'index.dart';

enum MessageType {
  text(1),
  file(3),
  audio(4),
  video(5),
  image(6),
  inviteIntoGroup(8),
  msgCard(9),
  callVideo(10),
  callAudio(11),
  redPacket(12),
  groupApply(13),
  position(14),
  moment(15),
  likes(16),
  comment(17),
  transferMoney(18),
  template(88);

  final int value;
  const MessageType(this.value);

  static MessageType fromValue(int value) {
    return MessageType.values.firstWhere((type) => type.value == value);
  }
}
