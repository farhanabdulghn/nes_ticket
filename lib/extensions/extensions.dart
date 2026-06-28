library;

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:nes_ticket/consts/strings_constants.dart';

part 'api_extension.dart';
part 'list_nullable_extension.dart';
part 'int_extension.dart';
part 'double_nullable_extension.dart';
part 'date_time_nullable_extension.dart';
part 'context_extension.dart';
part 'string_nullable_extension.dart';
part 'int_nullable_extension.dart';

typedef JsonMapper<T> = T Function(Map<String, dynamic> json);
