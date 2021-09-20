extension ExtendedString on String? {
  bool testNull() {
    if (this == null) {
      return true;
    } else {
      return false;

    }
  }
}
