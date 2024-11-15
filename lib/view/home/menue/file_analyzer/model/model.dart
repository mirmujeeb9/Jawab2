class Message {
  String? toId;
  String? msg;
  String? read;
  String? fromId;
  String? sent;
  Type? type;

  Message({
    this.toId,
    this.msg,
    this.read,
    this.fromId,
    this.sent,
    required this.type,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      toId: json['toId'],
      msg: json['msg'],
      read: json['read'],
      fromId: json['fromId'],
      sent: json['sent'],
      type: getTypeFromString(json['type']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'toId': toId,
      'msg': msg,
      'read': read,
      'fromId': fromId,
      'sent': sent,
      'type': type.toString().split('.').last,
    };
  }

  static Type getTypeFromString(String typeString) {
    switch (typeString) {
      case 'text':
        return Type.text;
      case 'image':
        return Type.text;
      default:
        return Type.text;
    }
  }
}

enum Type {
  text,
  pdf,
}
