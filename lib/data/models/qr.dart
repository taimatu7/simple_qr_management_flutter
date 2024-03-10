import 'package:realm/realm.dart';

part 'qr.g.dart';

@RealmModel()
class _Qr {
  late String id;
  late String text;
  late int createdAt;
}
