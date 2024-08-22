class OutpassRequest {
  final String reason;
  final DateTime? date;
  final String? time;
  final String? type;
  final DateTime? returnDate;
  final String? returnTime;
  final String status;
  final DateTime submittedAt;

  OutpassRequest({
    required this.reason,
    this.date,
    this.time,
    this.type,
    this.returnDate,
    this.returnTime,
    this.status = 'Pending',
    required this.submittedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'reason': reason,
      'date': date?.toIso8601String(),
      'time': time,
      'type': type,
      'return_date': returnDate?.toIso8601String(),
      'return_time': returnTime,
      'status': status,
      'submitted_at': submittedAt.toIso8601String(),
    };
  }
}
