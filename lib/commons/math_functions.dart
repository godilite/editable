class MathFunctions {
  int addition(List<int> items) {
    final sum = items.fold<int>(0, (p, c) => p + c);
    return sum;
  }

  int subtraction(List<int> items) {
    final diff = items.fold<int>(0, (p, c) => c - p);
    return diff;
  }
}

List<int> test = [1, 2, 3];

MathFunctions math = MathFunctions();
final sum = math.addition(test);
