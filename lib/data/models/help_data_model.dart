class HelpDataModel
{
  late int id;
  late String question;
  late String answer;


  HelpDataModel.fromJson(Map<String,dynamic> json)
  {
    id=json['id'];
    question=json['question'];
    answer=json['answer'];

  }
}