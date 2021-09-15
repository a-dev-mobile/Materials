import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  const SampleItemDetailsView({Key? key}) : super(key: key);

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(/* (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle, */
        title: Text(AppLocalizations.of(context)!.appTitle),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
