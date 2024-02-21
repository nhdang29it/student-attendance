class Student {
  final String mssv;
  final String? name;
  final String? email;
  final String? phone;

  Student({
    required this.mssv,
    this.name,
    this.email,
    this.phone,
  });

  Student copyWith({
    String? mssv,
    String? name,
    String? email,
    String? phone,
  }) =>
      Student(
        mssv: mssv ?? this.mssv,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
      );

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        mssv: json["S_mssv"],
        name: json["S_name"],
        email: json["S_email"],
        phone: json["S_phone"],
      );

  Map<String, dynamic> toJson() => {
        "S_mssv": mssv,
        "S_name": name,
        "S_email": email,
        "S_phone": phone,
      };
}
