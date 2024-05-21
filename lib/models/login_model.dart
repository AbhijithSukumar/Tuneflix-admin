class LoginModel{
  final String username;
  final String password;

  LoginModel({required this.username,required this.password});

  Map<String,dynamic> toMap(){
    return {
      'username':username,
      'password':password
    };
  }
}