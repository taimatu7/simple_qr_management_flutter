import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:simple_qr_management_flutter/data/models/qr.dart';
import 'package:ulid/ulid.dart';

final qrRepositoryProvider = Provider((ref) => QrRepository());

class QrRepository {
  late Realm _realm;
  QrRepository() {
    // TODO とりあえずここしかrealmは使わないので、ここでDBの初期化を行う(あとでmainに書く)
    final config = Configuration.local([Qr.schema]);
    _realm = Realm(config);
  }

  List<Qr> findAll() {
    _realm.refresh();
    return _realm.all<Qr>().toList();
  }

  Qr? find(String id) {
    return _realm.find<Qr>(id);
  }

  bool delete(String id) {
    final local = _realm.find<Qr>(id);
    if (local == null) {
      return false;
    }
    try {
      _realm.write(() {
        _realm.delete<Qr>(local);
      });
      _realm.refresh();
    } catch (e) {
      print("QR削除時にエラー");
      return false;
    }
    return true;
  }

  bool save(String text) {
    final local =
        Qr(Ulid().toString(), text, DateTime.now().millisecondsSinceEpoch);
    try {
      _realm.write(() {
        _realm.add(local);
      });
    } catch (e) {
      print("QR保存時にエラー");
      return false;
    }
    return true;
  }
}
