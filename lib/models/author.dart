class Author {
  final String username;
  final String bio;
  final String image;
  final bool following;

  Author({this.username, this.bio, this.image, this.following});

  Author.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        bio = json['bio'],
        image = json['image'].isEmpty ? "https://static.productionready.io/images/smiley-cyrus.jpg" : json['image'],
        following = json['following'];

  Map<String, dynamic> toJson() => {
        'username': username,
        'bio': bio,
        'image': image,
        'following': following,
      };
}
