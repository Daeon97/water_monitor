import 'package:firebase_database/firebase_database.dart';
import '../utils/utils.dart';

class DatabaseOpsRepository {
  final FirebaseDatabase _db;

  DatabaseOpsRepository() : _db = FirebaseDatabase.instance;

  Stream<DatabaseEvent> get testData => _db.ref(testRef).onValue;

  Stream<DatabaseEvent> get waterLevel =>
      _db.ref(testRef).child(floatField).onValue;

  Stream<DatabaseEvent> get status => _db.ref(testRef).child(intField).onValue;

  Status computeStatus(DataSnapshot dataSnapshot) {
    late Status status;
    switch (dataSnapshot.value as num) {
      case zero:
        status = Status.off;
        break;
      case one:
        status = Status.on;
        break;
      default:
        status = Status.off;
        break;
    }
    return status;
  }

  Future<void> writeStatus(Status newStatus) async {
    late int actualValue;
    switch (newStatus) {
      case Status.on:
        actualValue = one;
        break;
      case Status.off:
        actualValue = zero;
        break;
    }
    await _db.ref(testRef).update({
      intField: actualValue,
    });
  }
}
