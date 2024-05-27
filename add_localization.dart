import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;

void main() async {
  const basePath = 'assets/translations';
  // input: Hey there
  // output: {"hey_there": "Hey there"}
  List translationsList = [
    [
      "english",
      {
        'en': 'English',
        'gu': 'અંગ્રેજી',
        'hi': 'अंग्रेज़ी',
      }
    ],
    [
      "Hindi",
      {
        'en': 'Hindi',
        'gu': 'હિન્દી',
        'hi': 'हिंदी',
      },
    ],
    [
      "Gujarati",
      {
        'en': 'Gujarati',
        'gu': 'ગુજરાતી',
        'hi': 'गुजराती',
      }
    ],
  ];
  for (var i = 0; i < translationsList.length; i++) {
    await addLocalization(
        basePath,
        translationsList[i][0].toString().split(" ").join('_').toLowerCase(),
        translationsList[i][1] as Map<String, String>);
    print("");
  }

  // await addLocalization(basePath, key, translations);
  print('Localization added successfully.');
}

Future<void> addLocalization(
    String basePath, String key, Map<String, String> translations) async {
  for (var entry in translations.entries) {
    final lang = entry.key;
    final value = entry.value;
    final filePath = path.join(basePath, '$lang.json');

    final file = File(filePath);
    if (!await file.exists()) {
      print('File not found: $filePath');
      continue;
    }

    final content = await file.readAsString();
    final json = jsonDecode(content) as Map<String, dynamic>;

    json[key] = value;

    final updatedContent = const JsonEncoder.withIndent('  ').convert(json);
    await file.writeAsString(updatedContent);

    print('Updated $filePath with key "$key" and value "$value"');
  }
}
