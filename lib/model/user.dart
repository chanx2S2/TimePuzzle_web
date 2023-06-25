class User{
  int uid;
  String user_name;
  String user_email;
  String user_passwd;

  User(this.uid, this.user_name, this.user_email, this.user_passwd);

  factory User.fromJson(Map<String, dynamic> json) => User(
    int.parse(json['uid']),
    json['user_name'],
    json['user_email'],
    json['user_passwd']
  );

  Map<String, dynamic> toJson() => {
    'user_id' : uid.toString(),
    'user_name' : user_name,
    'user_email' : user_email,
    'user_passwd' : user_passwd
  };
}