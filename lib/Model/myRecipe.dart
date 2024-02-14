class MyRecipe{

  String _name='';
  String _rate='';
  String _imageUrl='';
  String _youtubeUrl='';
  String _chefName='';
  String _followers='';
  String _description='';
  String _time='';
  String _level='';
  String _cal='';
  String _category='';
  bool _isFavourite= false;

  MyRecipe(
      {
        String name='',
        String rate='',
        String imageUrl='',
        String youtubeUrl='',
        String chefName='',
        String followers='',
        String description='',
        String time='',
        String level='',
        String cal='',
        String category='',
        bool isFavourite= false,
      }){
    _name=name;
    _rate=rate;
    _time=time;
    _category=category;
    _cal=cal;
    _chefName=chefName;
    _level=level;
    _youtubeUrl=youtubeUrl;
    _imageUrl=imageUrl;
    _followers=followers;
    _isFavourite=isFavourite;
    _description=description;
  }


  MyRecipe.fromMap(Map<dynamic,dynamic> data){
     _name=data["name"];
     _rate=data["rate"];
     _imageUrl=data["image url"];
     _youtubeUrl=data["youtube url"];
     _chefName=data["chef name"];
     _followers=data["followers"];
     _description=data["description"];
     _time=data["time"];
     _level=data["level"];
     _cal=data["cal"];
     _category=data["category"];
  }

  bool get isFavourite => _isFavourite;

  set isFavourite(bool value) {
    _isFavourite = value;
  }

  String get category => _category;

  set category(String value) {
    _category = value;
  }

  String get cal => _cal;

  set cal(String value) {
    _cal = value;
  }

  String get level => _level;

  set level(String value) {
    _level = value;
  }

  String get time => _time;

  set time(String value) {
    _time = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get followers => _followers;

  set followers(String value) {
    _followers = value;
  }

  String get chefName => _chefName;

  set chefName(String value) {
    _chefName = value;
  }

  String get youtubeUrl => _youtubeUrl;

  set youtubeUrl(String value) {
    _youtubeUrl = value;
  }

  String get imageUrl => _imageUrl;

  set imageUrl(String value) {
    _imageUrl = value;
  }

  String get rate => _rate;

  set rate(String value) {
    _rate = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}
