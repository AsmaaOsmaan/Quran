
class Product{
  String id ;
  String name ;
  List<String> images ;
  List<String>size ;
  List<String> colors ;
  String brand ;
  String category ;
  int qty ;
  String uid;
  double price ;
  Product({this.id, this.name, this.images, this.size, this.colors, this.brand,
    this.category, this.qty, this.uid, this.price});
  Product.fromSnapshot(Map<String,dynamic> snapshot){
    name = snapshot['name'] ?? '';
    id = snapshot['id'] ?? '';
    brand = snapshot['brand']?? '';
    category = snapshot['category']?? '';
    qty = snapshot['qty']?? 80;
//uid = data['uid']?? '';
//colors = snapshot['colors']?? '';
//images =snapshot['url']?? '';
    if(snapshot['url'] != null)
    {
      _setImages(snapshot['url']);
    }
    price =snapshot['price']?? 50.0;
  }
  void _setImages(List<dynamic> jsonImages){
    this.images=[];
    for(var image in jsonImages ){
      print(image);
      this.images.add(image);
    }
  }
}
