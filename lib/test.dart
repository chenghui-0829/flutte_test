class Test {
  static subHzPy(text) {
    Map textMap = new Map();
    int m = 0, n = 0, index = 0;
    for (int i = 0; i < text.length; i++) {
      if (text[i] == '(') {
        if (index == 0) {
          m = i;
        }
        index++;
      }
      if (text[i] == ')') {
        index--;
        if (index == 0) {
          n = i;
          textMap.addAll({text.substring(m + 1, n): text[m - 1]});
        }
      }
    }
    return textMap;
  }
}
