 class Ayah{
   int  number;
   String text;
   String numberInSurah;
   int juz;
   int manzil;
   int page;
   int ruku;
   int hizbQuarter;
   bool sajda;

   Ayah(this.number, this.text, this.numberInSurah, this.juz, this.manzil,
       this.page, this.ruku, this.hizbQuarter, this.sajda);

   Ayah.fromjson(Map <String,dynamic>jsonObject){
    this.number=jsonObject['number'];
    this.text=jsonObject['text'];
    this.numberInSurah=jsonObject['numberInSurah'];
    this.juz=jsonObject['juz'];
    this.manzil=jsonObject['manzil'];
    this.page=jsonObject['page'];
    this.ruku=jsonObject['ruku'];
    this.hizbQuarter=jsonObject['hizbQuarter'];
    this.sajda=jsonObject['sajda'];

   }

 }