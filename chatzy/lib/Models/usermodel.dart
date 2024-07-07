class UserModel
{
  final String? id;
  final String? email;
  bool isSelected = false;

  UserModel({required this.id, required this.email,required this.isSelected});

  UserModel.fromJson(Map<String, dynamic> json)
  : this(
    id: json["id"] as String, 
    email: json["email"] as String?,
    isSelected: json["isSelected"] as bool
  );

   UserModel copyWith(bool? updatedIsSelected)
  {
    return UserModel(id: id, email: email, isSelected: updatedIsSelected ?? isSelected);
  }

  Map<String, dynamic> toJson()
  {
    return 
    {
      "id" : id,
      "email" : email,
      "isSelected" : isSelected
    };
  }
}