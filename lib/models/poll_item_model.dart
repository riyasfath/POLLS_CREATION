class PollItem {
  String question;
  List<String> options;
  Map<String, int> votes;
  bool allowMultipleAnswers;

  PollItem({
    required this.question,
    required this.options,
    Map<String, int>? votes,
    required this.allowMultipleAnswers,
  }) : votes = votes ?? {};

  void voteForOption(String option) {
    votes[option] = (votes[option] ?? 0) + 1;
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'options': options,
      'votes': votes,
      'allowMultipleAnswers': allowMultipleAnswers,
    };
  }

  static PollItem fromJson(Map<String, dynamic> json) {
    return PollItem(
      question: json['question'],
      options: List<String>.from(json['options']),
      votes: Map<String, int>.from(json['votes']),
      allowMultipleAnswers: json['allowMultipleAnswers'],
    );
  }
}