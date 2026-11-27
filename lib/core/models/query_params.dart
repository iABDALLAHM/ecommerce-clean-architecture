class QueryParams {
  final List<QueryCondition>? conditions;
  final QueryOrder? order;

  QueryParams({this.conditions, this.order});
}

class QueryCondition {
  final String field;
  final dynamic isEqualTo;
  final dynamic arrayContains;
  final dynamic isGreaterThanOrEqualTo;
  final dynamic isLessThanOrEqualTo;
  final dynamic isLessThan;
  final dynamic isGreaterThan;
  final dynamic whereIn;

  QueryCondition({
    required this.field,
    this.isEqualTo,
    this.arrayContains,
    this.whereIn,
    this.isLessThan,
    this.isGreaterThan,
    this.isGreaterThanOrEqualTo,
    this.isLessThanOrEqualTo,
  });
}

class QueryOrder {
  final String field;
  final bool descending;

  QueryOrder({required this.field, this.descending = false});
}
