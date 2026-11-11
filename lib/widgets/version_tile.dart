import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionTile extends StatefulWidget {
  const VersionTile({super.key});

  @override
  State<VersionTile> createState() => _VersionTileState();
}

class _VersionTileState extends State<VersionTile> {
  late final Future<PackageInfo> _packageInfo;

  @override
  void initState() {
    super.initState();
    _packageInfo = PackageInfo.fromPlatform();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: _packageInfo,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Version unavailable'),
            subtitle: Text('${snapshot.error}'),
          );
        }
        if (!snapshot.hasData) {
          return const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Loading version...'),
          );
        }
        final info = snapshot.data!;
        return ListTile(
          leading: const Icon(Icons.info_outline),
          title: Text('Version ${info.version} (build ${info.buildNumber})'),
        );
      },
    );
  }
}
