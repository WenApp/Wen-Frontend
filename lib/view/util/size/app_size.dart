class AppSize {
  double width, height;

  AppSize({required this.width, required this.height});

  static late AppSize _instance;

  factory AppSize.createInstance(
      {required double width, required double height}) {
    _instance = AppSize(width: width, height: height);
    return _instance;
  }

  static AppSize get instance => _instance;
}

class AppContainerSize {
  static final double width = AppSize.instance.width * 0.85;
}

class AppItemContainerSize {
  static final double height = AppSize.instance.height * 0.075;
}

class PremiumContainerSize {
  static final double height = AppSize.instance.height * 0.04;
}

class AlarmViewItemContainerSize {
  static final double height = AppSize.instance.height * 0.125;
}
