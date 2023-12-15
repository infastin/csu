import 'package:embed_annotation/embed_annotation.dart';

part 'config.g.dart';

@EmbedLiteral("../../config.json")
const appConfig = _$appConfig;
