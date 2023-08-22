class Chat_user {
  final String id;
  final String name;
  final String? password;
  final String email;
  final String? ImageUrl;

  const Chat_user(
      {required this.id,
       this.password,
      required this.name,
      required this.email,
       this.ImageUrl});


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'password': password,
      'email': email,
      'ImageUrl': ImageUrl,
    };
  }
}
