// ui_builder:runtime_text_overrides=true
// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import '../../screens/dashboard/dispatcher_dashboard.dart';

class Login extends StatelessWidget {
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [
              Color(0xFFF6F8FF),
              Color(0xFFEFF2FF),
              Color(0xFFFDFDFD),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 420),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 12),
                    _BrandMark(),
                    SizedBox(height: 24),
                    Text(uiBuilderDraftText('ExcelGenAutomation1'),
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.6,
                        color: Color(0xFF111827),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(uiBuilderDraftText('Fast login for spreadsheet generation and automation tools.'),
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Color(0xFF6B7280),
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 28),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(color: Color(0xFFE5E7EB)),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x14000000),
                            blurRadius: 28,
                            offset: Offset(0, 14),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(uiBuilderDraftText('Welcome back'),
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF111827),
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(uiBuilderDraftText('Sign in with your mobile number and 4-digit passcode.'),
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Color(0xFF6B7280),
                            ),
                          ),
                          SizedBox(height: 24),
                          Text(uiBuilderDraftText('Mobile number'),
                            style: theme.textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF374151),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: 'Enter mobile number',
                              prefixIcon: Icon(Icons.phone_rounded),
                              filled: true,
                              fillColor: Color(0xFFF9FAFB),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Color(0xFFE5E7EB),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Color(0xFFE5E7EB),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Color(0xFF4F46E5),
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(uiBuilderDraftText('Passcode'),
                            style: theme.textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF374151),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: List.generate(4, (index) {
                              return Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right: index == 3 ? 0 : 10,
                                  ),
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    maxLength: 1,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      counterText: '',
                                      filled: true,
                                      fillColor: Color(0xFFF9FAFB),
                                      hintText: '•',
                                      hintStyle: TextStyle(
                                        color: Color(0xFFC7CAD1),
                                        fontSize: 20,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(
                                          color: Color(0xFFE5E7EB),
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(
                                          color: Color(0xFFE5E7EB),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(
                                          color: Color(0xFF4F46E5),
                                          width: 1.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                          SizedBox(height: 18),
                          FilledButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (_) => const DispatcherDashboard(),
                                ),
                              );
                            },
                            style: FilledButton.styleFrom(
                              backgroundColor: Color(0xFF111827),
                              foregroundColor: Colors.white,
                              minimumSize: Size.fromHeight(52),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Text(uiBuilderDraftText('Login'),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: Color(0xFF4F46E5),
                            ),
                            child: Text(uiBuilderDraftText('Forgot passcode?'),
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BrandMark extends StatelessWidget {
  _BrandMark();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 76,
        height: 76,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: const [Color(0xFF4F46E5), Color(0xFF8B5CF6)],
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x334F46E5),
              blurRadius: 22,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Icon(
          Icons.grid_view_rounded,
          color: Colors.white,
          size: 34,
        ),
      ),
    );
  }
}


final ValueNotifier<Map<String, String>> uiBuilderDraftTextOverrides =
    ValueNotifier(<String, String>{});

String uiBuilderDraftText(String original) {
  return uiBuilderDraftTextOverrides.value[original] ?? original;
}

void updateUiBuilderDraftTextOverrides(Map<String, String> overrides) {
  uiBuilderDraftTextOverrides.value = Map<String, String>.from(overrides);
}

void clearUiBuilderDraftTextOverrides() {
  uiBuilderDraftTextOverrides.value = <String, String>{};
}

class UiBuilderDraftOverrideScope extends StatelessWidget {
  const UiBuilderDraftOverrideScope({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Map<String, String>>(
      valueListenable: uiBuilderDraftTextOverrides,
      builder: (context, value, child) => child!,
      child: child,
    );
  }
}
