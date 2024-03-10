import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_qr_management_flutter/ui/views/widgets/qr_dialog.dart';

class QRListScreen extends ConsumerStatefulWidget {
  const QRListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => QRListScreenState();
}

class QRListScreenState extends ConsumerState<QRListScreen> {
  late Future<void> _initFunction;

  Future<void> _init() async {}

  @override
  void initState() {
    super.initState();
    _initFunction = _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR一覧'),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: FutureBuilder(
          future: _initFunction,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              const CircularProgressIndicator();
            }

            return ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                      child: Card(
                        child: ListTile(
                          leading: Text(index.toString()),
                          title: const Text("QRコードに変換される文字"),
                          trailing: const Icon(Icons.qr_code),
                        ),
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const QrDialog(data: "test");
                            });
                      });
                },
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemCount: 1);
          }),
    );
  }
}
