class MyModel{
String ?name;
String ?email;
String ?phone;
String ?password;
String ?confirmPassword;

MyModel({this.name,this.email,this.phone,this.password,this.confirmPassword});


Map<String,dynamic> setMap(){

  var map =<String ,dynamic>{};
    map['name']=this.name;
    map['email']=this.email;
    map['phone']=this.phone;
    map['password']=this.password;
    map['confirmPassword']=this.confirmPassword;
  return map;

}
factory MyModel.getMap( Map <String , dynamic >map2){
  return MyModel(
    name: map2["name"],
    email: map2['email'],
    phone: map2['phone'],
    password: map2['password'],
    confirmPassword: map2['confirmPassword'],
  );
}

}