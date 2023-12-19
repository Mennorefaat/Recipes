class CategoryProduct{

  String _name='';
  String _discount='';
  String _priceBefore='';
  String _priceAfter='';
  String _image='';
  bool _isFavourite= false;


  CategoryProduct(this._name, this._discount, this._priceBefore, this._priceAfter,
      this._image, this._isFavourite);


  bool get isFavourite => _isFavourite;

  set isFavourite(bool value) {
    _isFavourite = value;
  }

  String get image => _image ?? "";

  set image(String value) {
    _image = value;
  }

  String get priceAfter => _priceAfter;

  set priceAfter(String value) {
    _priceAfter = value;
  }

  String get priceBefore => _priceBefore;

  set priceBefore(String value) {
    _priceBefore = value;
  }

  String get discount => _discount;

  set discount(String value) {
    _discount = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}


