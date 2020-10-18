class Surahs{
List<dynamic>surah;

Surahs(this.surah);

Surahs.fromjson(Map<String,dynamic>jsonObject){

  this.surah=jsonObject['data']['surahs'];
}
}