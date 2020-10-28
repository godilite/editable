class MathFunctions {
  int addtion(List<int> items) {
    int sum = items.fold(0, (p, c) => p + c);
    return sum;
  }

  int subtraction(List<int> items) {
    int diff = items.fold(0, (p, c) => c - p);
    return diff;
  }
}

List<int> test = [1, 2, 3];

MathFunctions math = MathFunctions();
final sum = math.addtion(test);
