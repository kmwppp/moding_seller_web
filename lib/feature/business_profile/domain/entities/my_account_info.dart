class MyAccountInfo {
  const MyAccountInfo({
    required this.id,
    required this.loginId,
    required this.email,
    required this.name,
    required this.phone,
    required this.role,
    required this.status,
  });

  final int id;
  final String loginId;
  final String email;
  final String name;
  final String phone;
  final String role;
  final String status;

  factory MyAccountInfo.fromJson(Map<String, dynamic> json) {
    return MyAccountInfo(
      id: (json['id'] as num?)?.toInt() ?? 0,
      loginId: json['loginId']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
      role: json['role']?.toString() ?? '',
      status: json['status']?.toString() ?? '',
    );
  }
}
