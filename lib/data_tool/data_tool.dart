class DataTool {
  // 验证手机号码是否正确
  static bool isChinaPhoneLegal(String str) {
    return new RegExp('^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$').hasMatch(str);
  }

  // 验证邮箱是否合法
  static bool isEmailLegal(String str) {
    if (str == null) {
      return false;
    }
    String p = r'^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(str);
  }
}