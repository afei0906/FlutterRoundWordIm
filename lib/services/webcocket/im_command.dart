part of '../index.dart';

enum ImCommand {
  wxHandshakeReq(1),
  wxHandshakeAck(2),
  send(3),
  sendAck(4),
  recv(5),
  recvAck(6),
  heartbeat(7),
  heartbeatAck(8),
  disconnect(9);

  final int value;
  const ImCommand(this.value);

  static ImCommand? fromValue(int value) {
    return ImCommand.values.firstWhere(
          (cmd) => cmd.value == value,
      orElse: () => throw Exception('Unknown command value: $value'),
    );
  }
}