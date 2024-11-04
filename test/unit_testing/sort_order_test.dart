import 'package:flutter_test/flutter_test.dart';
import 'package:mobiletesting/login_screen/sort_order.dart';

void main() {
  group('getDisplayNumber', () {
    test(
        'given SortOrder is ascending when getDisplayNumber is called then return correct value',
        () {
      const sortOrder = SortOrder.ascending;

      expect(sortOrder.getDisplayNumber(0), equals(0));
      expect(sortOrder.getDisplayNumber(5), equals(5));
      expect(sortOrder.getDisplayNumber(9), equals(9));
    }, tags: 'unit');

    test(
        'given SortOrder is descending when getDisplayNumber is called then return correct value',
        () {
      const sortOrder = SortOrder.descending;

      expect(sortOrder.getDisplayNumber(0), equals(9));
      expect(sortOrder.getDisplayNumber(5), equals(4));
      expect(sortOrder.getDisplayNumber(9), equals(0));
    }, tags: 'unit');

    test(
        'given getDisplayNumber is called with invalid index then return correct value',
        () {
      const ascendingOrder = SortOrder.ascending;
      const descendingOrder = SortOrder.descending;

      final invalidIndexBelowLowerBound = -1;
      expect(ascendingOrder.getDisplayNumber(invalidIndexBelowLowerBound),
          equals(-1));
      expect(descendingOrder.getDisplayNumber(invalidIndexBelowLowerBound),
          equals(10));

      final invalidIndexBeyondUpperBound = 10;
      expect(ascendingOrder.getDisplayNumber(invalidIndexBeyondUpperBound),
          equals(10));
      expect(descendingOrder.getDisplayNumber(invalidIndexBeyondUpperBound),
          equals(-1));
    }, tags: 'unit');

    test(
        'given getDisplayNumber is called with valid edge indexs then return correct value',
        () {
      for (final order in SortOrder.values) {
        expect(order.getDisplayNumber(0), isNotNull);
        expect(order.getDisplayNumber(9), isNotNull);
      }
    }, tags: 'unit');
  });
}
