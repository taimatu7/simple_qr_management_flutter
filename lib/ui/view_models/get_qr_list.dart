import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_qr_management_flutter/data/models/qr.dart';
import 'package:simple_qr_management_flutter/data/repositories/qr_repository.dart';

final getQrListProvider =
    Provider.autoDispose((ref) => GetQrList(ref.read(qrRepositoryProvider)));

class GetQrList {
  final QrRepository _repository;

  GetQrList(this._repository);

  List<Qr> execute() {
    return _repository.findAll();
  }
}
