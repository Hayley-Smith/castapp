class Prayer {
  final String id;
  final String title;
  final String text;
  final String userId;
  final DateTime dateTime;
  final bool isWorship;
  final bool isWorry;
  final bool isPetition;

  Prayer(
      {required this.title,
      required this.id,
      required this.text,
      required this.userId,
      required this.dateTime,
      required this.isWorship,
      required this.isWorry,
      required this.isPetition});

  //maps the prayer object to JSON so we can save it to file
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'text': text,
      'userId': userId,
      'dateTime': dateTime.toIso8601String(),
      'isWorship': isWorship,
      'isWorry': isWorry,
      'isPetition': isPetition,
    };
  }

  // converts json object to a prayer object
  factory Prayer.fromJSON(Map<String, dynamic> json) {
    return Prayer(
      id: json['id'],
      title: json['title'],
      text: json['text'],
      userId: json['userId'],
      dateTime: DateTime.parse(json['dateTime']),
      isWorship: json['isWorship'],
      isWorry: json['isWorry'],
      isPetition: json['isPetition'],
    );
  }
}


