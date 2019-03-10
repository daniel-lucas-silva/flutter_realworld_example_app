class User {
  final String username;
  final String bio;
  final String image;

  User({this.username, this.bio, this.image});

  User.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        bio = json['bio'],
        image = json['image'];

  Map<String, dynamic> toJson() => {
        'username': username,
        'bio': bio,
        'image': image,
      };
}
