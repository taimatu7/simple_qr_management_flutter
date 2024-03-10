// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Qr extends _Qr with RealmEntity, RealmObjectBase, RealmObject {
  Qr(
    String id,
    String text,
    int createdAt,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'text', text);
    RealmObjectBase.set(this, 'createdAt', createdAt);
  }

  Qr._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get text => RealmObjectBase.get<String>(this, 'text') as String;
  @override
  set text(String value) => RealmObjectBase.set(this, 'text', value);

  @override
  int get createdAt => RealmObjectBase.get<int>(this, 'createdAt') as int;
  @override
  set createdAt(int value) => RealmObjectBase.set(this, 'createdAt', value);

  @override
  Stream<RealmObjectChanges<Qr>> get changes =>
      RealmObjectBase.getChanges<Qr>(this);

  @override
  Qr freeze() => RealmObjectBase.freezeObject<Qr>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Qr._);
    return const SchemaObject(ObjectType.realmObject, Qr, 'Qr', [
      SchemaProperty('id', RealmPropertyType.string),
      SchemaProperty('text', RealmPropertyType.string),
      SchemaProperty('createdAt', RealmPropertyType.int),
    ]);
  }
}
