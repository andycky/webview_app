import 'package:flutter/material.dart';
import 'config.dart';

/// Settings page for configuring the restricted IP address.
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _ipController;
  late TextEditingController _portController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _ipController = TextEditingController(text: AppConfig.ipAddress);
    _portController = TextEditingController(text: AppConfig.port.toString());
    _isLoading = false;
  }

  @override
  void dispose() {
    _ipController.dispose();
    _portController.dispose();
    super.dispose();
  }

  Future<void> _saveSettings() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    try {
      await AppConfig.saveIpAddress(_ipController.text.trim());
      await AppConfig.savePort(int.parse(_portController.text.trim()));
      
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
              'The WebView will only connect to the IP address configured below.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            
            // IP Address field
            TextFormField(
              controller: _ipController,
              decoration: const InputDecoration(
                labelText: 'IP Address',
                hintText: '10.0.0.1',
                prefixIcon: Icon(Icons.dns),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'IP address is required';
                }
                if (!AppConfig.isValidIpAddress(value.trim())) {
                  return 'Please enter a valid IPv4 address';
                }
                return null;
              },
              enabled: !_isLoading,
            ),
            
            const SizedBox(height: 16),
            
            // Port field
            TextFormField(
              controller: _portController,
              decoration: const InputDecoration(
                labelText: 'Port',
                hintText: '80',
                prefixIcon: Icon(Icons.numbers),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Port is required';
                }
                final port = int.tryParse(value.trim());
                if (port == null || port < 1 || port > 65535) {
                  return 'Port must be between 1 and 65535';
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
