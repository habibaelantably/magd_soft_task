
class VerifyPhoneRequestModel {
  String? name;
  String? phone;


  VerifyPhoneRequestModel
      ({
    this.name,
    this.phone,
    });

  Map<String,dynamic> toMap()
  {
    return
      {
        'name':name,
        'phone':phone,

      };
  }

}

