import 'dart:io';

void main() {
  var featureName = 'WelcomeScreen';

  fileGenerator(
    fileName: "model",
    directoryPath: "${removeSecondCapital(featureName)}/models",
    willGenerateDartFile: true,
    content: " ",
  );
  fileGenerator(
    fileName: featureName,
    directoryPath: "${removeSecondCapital(featureName)}/presentation/view",
    willGenerateDartFile: true,
    content: viewScreenContent(featureName: featureName),
  );
  fileGenerator(
    fileName: '${featureName}Cubit',
    directoryPath:
        "${removeSecondCapital(featureName)}/presentation/controller",
    willGenerateDartFile: true,
    content: controllerCubitContent(featureName: "${featureName}Cubit"),
  );

  fileGenerator(
    fileName: '${featureName}States',
    directoryPath:
        "${removeSecondCapital(featureName)}/presentation/controller",
    willGenerateDartFile: true,
    content: controllerStatesContent(featureName: "${featureName}States"),
  );
  fileGenerator(
    fileName: '',
    directoryPath: "${removeSecondCapital(featureName)}/presentation/component",
    willGenerateDartFile: false,
    content: "",
  );
}

String removeSecondCapital(String keyword) {
  if (keyword == null || keyword.isEmpty) {
    return '';
  }

  keyword = keyword.replaceAll('Screen', '');
  if (keyword.length > 0) {
    String result = keyword[0].toLowerCase();
    for (int i = 1; i < keyword.length; i++) {
      if (keyword[i].toUpperCase() == keyword[i]) {
        result += '_';
      }
      result += keyword[i].toLowerCase();
    }
    return result;
  } else {
    return '';
  }
}

String addUnderscores(String input) {
  String result = '';

  for (int i = 0; i < input.length; i++) {
    if (i > 0 && input[i].toUpperCase() == input[i]) {
      result += '_${input[i].toLowerCase()}';
    } else {
      result += input[i].toLowerCase();
    }
  }

  return result;
}

String removeSubstring(String input, String substringToRemove) {
  return input.replaceFirst(substringToRemove, '');
}

void fileGenerator({
  required String fileName,
  required String directoryPath,
  required bool willGenerateDartFile,
  required String content,
}) {
  var libPath = 'lib/features';

  var libDirectory = Directory("$libPath/$directoryPath");
  libDirectory.createSync(recursive: true);

  if (willGenerateDartFile) {
    var filePath = '$libPath/$directoryPath/${addUnderscores(fileName)}.dart';
    var file = File(filePath);

    file.writeAsStringSync(content);
    print('Initialization code has been written to $filePath');
  }
}

String viewScreenContent({required String featureName}) => '''
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/${addUnderscores(featureName)}_cubit.dart';
import '../controller/${addUnderscores(featureName)}_states.dart';

class $featureName extends StatelessWidget {
  const $featureName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ${featureName}Cubit(),
      child: BlocConsumer<${featureName}Cubit, ${featureName}States>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = ${featureName}Cubit.get(context);
          return Scaffold();
        },
      ),
    );
  }
}
''';

String controllerCubitContent({required String featureName}) {
  String underscored = addUnderscores(featureName);
  return '''
import 'package:flutter_bloc/flutter_bloc.dart';
import '${removeSubstring(underscored, "_cubit")}_states.dart';

class $featureName extends Cubit<${removeSubstring(featureName, "Cubit")}States> {
  bool _isActive = true;

  $featureName() : super(${removeSubstring(featureName, "Cubit")}InitState());

  static $featureName get(context) => BlocProvider.of(context);

  @override
  Future<void> close() {
    _isActive = false;
    return super.close();
  }
}
''';
}

String controllerStatesContent({required String featureName}) => '''
abstract class $featureName {}

class ${removeSubstring(featureName, "States")}InitState extends $featureName {}

class ${removeSubstring(featureName, "States")}LoadingState extends $featureName {}

class ${removeSubstring(featureName, "States")}SuccessState extends $featureName {}

class ${removeSubstring(featureName, "States")}ErrorState extends $featureName {
  final String message;
  ${removeSubstring(featureName, "States")}ErrorState(this.message);
}
''';
