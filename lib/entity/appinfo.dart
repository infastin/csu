import 'package:embed_annotation/embed_annotation.dart';

part 'appinfo.g.dart';

@EmbedLiteral("../../appinfo.json")
const appInfo = _$appInfo;

@EmbedStr("../../LICENSE")
const licenseText = _$licenseText;
