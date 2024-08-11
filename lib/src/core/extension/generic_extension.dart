extension NullableExtensions<T> on T? {
  bool get isNull => this == null;

  bool get isNotNull => this != null;

  bool get isNotEmptyOrNull => this != null && this!.toString().isNotEmpty;
}

extension NumberConverter on num {
  static const List<String> _banglaNumbers = [
    '০',
    '১',
    '২',
    '৩',
    '৪',
    '৫',
    '৬',
    '৭',
    '৮',
    '৯'
  ];

  String toBangla() {
    final String englishNumber = toString();
    String banglaNumber = '';
    for (int i = 0; i < englishNumber.length; i++) {
      final int? digit = int.tryParse(englishNumber[i]);
      if (digit != null && digit >= 0 && digit <= 9) {
        banglaNumber += _banglaNumbers[digit];
      } else {
        banglaNumber += englishNumber[i];
      }
    }
    return banglaNumber;
  }

  // convert 1, 2, 3, 4 to ক, খ, গ, ঘ
  String get toBanglaOption {
    switch (this) {
      case 1:
        return 'ক';
      case 2:
        return 'খ';
      case 3:
        return 'গ';
      case 4:
        return 'ঘ';
      default:
        return '';
    }
  }
}

extension StringExtension on String {
  String get englishToBanglaMonth {
    return replaceAll('January', 'জানুয়ারী')
        .replaceAll('February', 'ফেব্রুয়ারী')
        .replaceAll('March', 'মার্চ')
        .replaceAll('April', 'এপ্রিল')
        .replaceAll('May', 'মে')
        .replaceAll('June', 'জুন')
        .replaceAll('July', 'জুলাই')
        .replaceAll('August', 'অগাস্ট')
        .replaceAll('September', 'সেপ্টেম্বর')
        .replaceAll('October', 'অক্টোবর')
        .replaceAll('November', 'নভেম্বর')
        .replaceAll('December', 'ডিসেম্বর');
  }

  String get banglaToEnglishMonth {
    return replaceAll('জানুয়ারী', 'January')
        .replaceAll('ফেব্রুয়ারী', 'February')
        .replaceAll('মার্চ', 'March')
        .replaceAll('এপ্রিল', 'April')
        .replaceAll('মে', 'May')
        .replaceAll('জুন', 'June')
        .replaceAll('জুলাই', 'July')
        .replaceAll('অগাস্ট', 'August')
        .replaceAll('সেপ্টেম্বর', 'September')
        .replaceAll('অক্টোবর', 'October')
        .replaceAll('নভেম্বর', 'November')
        .replaceAll('ডিসেম্বর', 'December');
  }

  String get englishToBanglaYear {
    return replaceAll('2024', '২০২৪').replaceAll('2025', '২০২৫');
  }

  String get banglaToEnglishYear {
    return replaceAll('২০২৪', '2024').replaceAll('২০২৫', '2025');
  }
}
