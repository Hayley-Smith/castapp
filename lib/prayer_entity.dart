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
}
