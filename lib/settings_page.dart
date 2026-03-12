import 'package:flutter/material.dart';
import 'config.dart';

/// Settings page for configuring the restricted domain.
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _domainController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _domainController = TextEditingController(text: AppConfig.domain);
    _isLoading = false;
  }

  @override
  void dispose() {
    _domainController.dispose();
    super.dispose();
  }

  Future<void> _saveSettings() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    try {
      await AppConfig.saveDomain(_domainController.text.trim());
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Settings saved! Restart the app to apply changes.'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.of(context).pop(true); // Signal that settings changed
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error saving settings: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Connection Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'The WebView will only connect to the domain configured below.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            
            // Domain field
            TextFormField(
              controller: _domainController,
              decoration: const InputDecoration(
                labelText: 'Domain',
                hintText: 'www.doubao.com',
                prefixIcon: Icon(Icons.dns),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Domain is required';
                }
                if (!AppConfig.isValidDomain(value.trim())) {
                  return 'Please enter a valid domain (e.g., www.doubao.com)';
                }
                return null;
              },
              enabled: !_isLoading,
            ),
            
            const SizedBox(height: 32),
            
            // Save button
            ElevatedButton.icon(
              onPressed: _isLoading ? null : _saveSettings,
              icon: _isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.save),
              label: Text(_isLoading ? 'Saving...' : 'Save Settings'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Info card
            Card(
              color: Colors.blue.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.blue.shade700),
                        const SizedBox(width: 8),
                        Text(
                          'Security Note',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'This app will block all navigation attempts to URLs '
                      'outside the configured IP address. This includes links, '
                      'redirects, and JavaScript-initiated navigation.',
                      style: TextStyle(color: Colors.blue.shade900),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
