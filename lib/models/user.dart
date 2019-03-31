class User {
  final String username;
  final String email;
  final String bio;
  final String image;

  User({this.username, this.email, this.bio, this.image});

  User.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        email = json['email'],
        bio = json['bio'],
        image = json['image'];

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'bio': bio,
        'image': image,
      };
}
