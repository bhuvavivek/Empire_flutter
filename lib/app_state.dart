import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _loginToken = prefs.getString('ff_loginToken') ?? _loginToken;
    });
    _safeInit(() {
      _defaultImagePath =
          prefs.getString('ff_defaultImagePath') ?? _defaultImagePath;
    });
    _safeInit(() {
      _imageList = prefs.getStringList('ff_imageList') ?? _imageList;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _loginToken = '';
  String get loginToken => _loginToken;
  set loginToken(String value) {
    _loginToken = value;
    prefs.setString('ff_loginToken', value);
  }

  String _defaultImagePath =
      'https://lonjaurigue.files.wordpress.com/2011/01/ortigas1.jpg';
  String get defaultImagePath => _defaultImagePath;
  set defaultImagePath(String value) {
    _defaultImagePath = value;
    prefs.setString('ff_defaultImagePath', value);
  }

  List<String> _imageList = [
    'https://www.india-tours.com/blog/wp-content/uploads/2019/04/images_1518423170210_mumbai-city.jpg',
    'https://www.thesun.co.uk/wp-content/uploads/2019/01/NINTCHDBPICT000245475155.jpg',
    'https://i.pinimg.com/originals/52/e1/6d/52e16d15c27413f45eacdc2cec334a88.jpg',
    'https://cdn.unenvironment.org/2023-03/GettyImages-827065008.jpg',
    'https://lonjaurigue.files.wordpress.com/2011/01/ortigas1.jpg',
    'https://miro.medium.com/v2/resize:fit:1024/0*7kpYO6OZbwQdwqV5.jpg',
    'https://images.hindustantimes.com/img/2021/03/24/1600x900/1.20200325_MUM-BK-MN_CSMT_02_1616504341954_1616572103691.JPG',
    'https://zakworldoffacades.com/wp-content/uploads/2023/08/delhi-952-579-24.jpg',
    'https://wallpapercave.com/wp/wp7526854.jpg',
    'https://www.accuratevaluers.com/wp-content/uploads/2017/12/1-2-1.jpg'
  ];
  List<String> get imageList => _imageList;
  set imageList(List<String> value) {
    _imageList = value;
    prefs.setStringList('ff_imageList', value);
  }

  void addToImageList(String value) {
    imageList.add(value);
    prefs.setStringList('ff_imageList', _imageList);
  }

  void removeFromImageList(String value) {
    imageList.remove(value);
    prefs.setStringList('ff_imageList', _imageList);
  }

  void removeAtIndexFromImageList(int index) {
    imageList.removeAt(index);
    prefs.setStringList('ff_imageList', _imageList);
  }

  void updateImageListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    imageList[index] = updateFn(_imageList[index]);
    prefs.setStringList('ff_imageList', _imageList);
  }

  void insertAtIndexInImageList(int index, String value) {
    imageList.insert(index, value);
    prefs.setStringList('ff_imageList', _imageList);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
