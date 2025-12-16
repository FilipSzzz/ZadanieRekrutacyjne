int? lookingForOutlierNumber(List<int> liczby) {
  if (liczby.length < 3) {
    return null;
  }
  int countEven = 0;
  int countOdd = 0;
  for (final n in liczby) {
    if (n.isEven) {
      countEven++;
    } else {
      countOdd++;
    }
  }
  if (countEven == 1) {
    for (final n in liczby) {
      if (n.isEven) {
        return n;
      }
    }
  }
  if (countOdd == 1) {
    for (final n in liczby) {
      if (!n.isEven) {
        return n;
      }
    }
  }
  return null;
}
