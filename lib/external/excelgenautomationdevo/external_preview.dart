import 'package:flutter/material.dart';
import 'external_target.dart';
import 'external_target.dart' as target;

void updateUiBuilderDraftTextOverrides(
  Map<String, String> overrides,
) {
  target.updateUiBuilderDraftTextOverrides(overrides);
}

void clearUiBuilderDraftTextOverrides() {
  target.clearUiBuilderDraftTextOverrides();
}

class ExternalPreviewScreen extends StatelessWidget {
  const ExternalPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UiBuilderDraftOverrideScope(child: MaterialApp(debugShowCheckedModeBanner: false, title: 'Excelgenautomationdevo', theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF4F46E5),
      ), home: Login(),));
  }
}
