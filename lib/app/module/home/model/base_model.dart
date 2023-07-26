/// defaultId
const defaultId = -1;

/// BaseModel
abstract class BaseModel {
  /// id
  int id = defaultId;

  /// check if this model has data or not (Null safety)
  bool get hasData => id != defaultId;

  /// toJson
  Map<String, dynamic> toJson();

  @override
  String toString() {
    return toJson().toString();
  }
}
