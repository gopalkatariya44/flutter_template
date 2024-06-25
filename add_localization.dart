import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;

void main() async {
  const basePath = 'assets/translations';
  // input: Hey there
  // output: {"hey_there": "Hey there"}
  List translationsList = [
    [
      "Hello",
      {
        'en': 'Hello',
        'gu': 'નમસ્તે',
        'hi': 'नमस्ते',
      }
    ],
    [
      "guys",
      {
        'en': 'Guys',
        'gu': 'દોસ્તો',
        'hi': 'दोस्तो',
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


// [
//       "Settings",
//       {
//         'en': 'Settings',
//         'gu': 'સેટિંગ્સ',
//         'hi': 'सेटिंग्स',
//       }
//     ],
//     [
//       "App language",
//       {
//         'en': 'App language',
//         'gu': 'એપની ભાષા',
//         'hi': 'ऐप की भाषा',
//       }
//     ],
//     [
//       "Choose Theme",
//       {
//         'en': 'Choose Theme',
//         'gu': 'થીમ પસંદ કરો',
//         'hi': 'थीम चुनें',
//       }
//     ],
//     [
//       "Light",
//       {
//         'en': 'Light',
//         'gu': 'લાઈટ',
//         'hi': 'लाइट',
//       }
//     ],
//     [
//       "Dark",
//       {
//         'en': 'Dark',
//         'gu': 'કાળું',
//         'hi': 'डार्क',
//       }
//     ],
//     [
//       "system default",
//       {
//         'en': 'System default',
//         'gu': 'સિસ્ટમ ડિફોલ્ટ',
//         'hi': 'सिस्टम डिफ़ॉल्ट',
//       }
//     ],
//     [
//       "Cancle",
//       {
//         'en': 'Cancle',
//         'gu': 'રદ કરો',
//         'hi': 'कैंसिल करें',
//       }
//     ],
//     [
//       "Ok",
//       {
//         'en': 'Ok',
//         'gu': 'ઓકે',
//         'hi': 'ठीक है',
//       }
//     ],
//     [
//       "Theme",
//       {
//         'en': 'Theme',
//         'gu': 'થીમ',
//         'hi': 'थीम',
//       }
//     ],