import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_qr_management_flutter/data/models/qr.dart';
import 'package:simple_qr_management_flutter/ui/view_models/get_qr_list.dart';
import 'package:simple_qr_management_flutter/ui/views/widgets/qr_dialog.dart';

class QRListScreen extends ConsumerStatefulWidget {
  const QRListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => QRListScreenState();
}

class QRListScreenState extends ConsumerState<QRListScreen> {
  late List<Qr> list;

  @override
  void initState() {
    super.initState();
    list = ref.read(getQrListProvider).execute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('QR一覧'),
          centerTitle: true,
          backgroundColor: Colors.yellow,
        ),
        body: list.isNotEmpty
            ? ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                      child: Card(
                        child: ListTile(
                          leading: Text((index + 1).toString()),
                          title: Text(list[index].text),
                          trailing: const Icon(Icons.qr_code),
                        ),
                      ),
                      onTap: () async {
                        await showDialog(
                            context: context,
                            builder: (context) {
                              return QrDialog(
                                id: list[index].id,
                                data: list[index].text,
                              );
                            });
                        setState(() {
                          list = ref.read(getQrListProvider).execute();
                        });
                      });
                },
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemCount: list.length)
            : const Center(child: Text('データがありません')));
  }
}
