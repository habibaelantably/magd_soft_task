
class OTPRequestModel{
  String? code;
  String? phone;

  OTPRequestModel
      ({
    this.code,
    this.phone,
  });

  Map<String,dynamic> toMap()
  {
    return
      {
        'code':code,
        'phone':phone,
      };
  }

}