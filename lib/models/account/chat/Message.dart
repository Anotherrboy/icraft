// ignore_for_file: file_names

class Message {
  final String text;
  final DateTime date;
  final bool isSentByMe;
  const Message(
      {required this.date, required this.isSentByMe, required this.text});
}
