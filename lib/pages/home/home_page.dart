import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);
  onAdd(WidgetRef ref){
    ref.read(homePageControllerProvider).addEntry(DateTime.now().toString());
  }
  onRemove(WidgetRef ref, String entry){
    ref.read(homePageControllerProvider).removeEntry(entry);
  }


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entries Management'),
      ),
      body: ref.watch(entriesProvider).when(
            data: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return ListTile(
                  title: Text(item),
                  onTap: () => onRemove(ref, item),
                );
              },
            ),
            error: (error, stackTrace) => Center(
              child: Text(error.toString()),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      floatingActionButton: FloatingActionButton(onPressed: () => onAdd(ref),),
    );
  }
}
