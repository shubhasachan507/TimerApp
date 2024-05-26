extension CorrectFormat on int {
  String formatTime() {
    return this > 9 ? toString() : "0$this";
  }
}
