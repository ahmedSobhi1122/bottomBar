class DataIntent {
  DataIntent._();

//------------------------------------
  ///data
  static String? _type = null;
  static double? _height = null;
  static double? _weight = null;
  static double? _age = null;

  static bool notNull() {
    return _type != null && _height != null && _weight != null && _age != null;
  }

  static void pushType({
    String? type,
  }) {
    _type = type;
  }

  static void pushHeight({
    double? height,
  }) {
    _height = height;
  }

  static void pushWeight({
    double? weight,
  }) {
    _weight = weight;
  }

  static void pushAge({
    double? age,
  }) {
    _age = age;
  }

  static String? getType() => _type;

  static double? getHeight() => _height;

  static double? getWeight() => _weight;

  static double? getAge() => _age;
//------------------------------------
}