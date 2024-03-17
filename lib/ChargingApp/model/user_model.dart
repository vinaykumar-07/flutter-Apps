class UserModel {
  final String id;
  final String name;
  final String phone;
  final String bio;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.bio,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(id: "id", name: "name", phone: "phone", bio: "bio");
  }
}
