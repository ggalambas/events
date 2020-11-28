import 'package:freezed_annotation/freezed_annotation.dart';

part 'region.freezed.dart';

@freezed
abstract class Region with _$Region {
  const factory Region({
    @required String name,
    @required int liveEvents,
    @required int totalEvents,
  }) = _Region;
}
