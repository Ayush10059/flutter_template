/// Checks if two DateTime objects are the same month of a year.
/// Returns `false` if either of them is null.
bool isSameMonthOfYear(DateTime? a, DateTime? b) {
  if (a == null || b == null) {
    return false;
  }

  return a.year == b.year && a.month == b.month;
}
