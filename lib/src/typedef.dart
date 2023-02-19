import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

typedef FutureOr<Iterable<T>> SuggestionsCallback<T>(String pattern);
typedef FutureOr<Iterable<TypeAheadDataGroup<T>>> SuggestionsGroupCallback<T>(String pattern);
typedef Widget ItemBuilder<T>(BuildContext context, T itemData);
typedef Widget TitleGroupBuilder<String>(BuildContext context, String title);
typedef void SuggestionSelectionCallback<T>(T suggestion);
typedef Widget ErrorBuilder(BuildContext context, Object? error);

typedef Widget AnimationTransitionBuilder(
    BuildContext context, Widget child, AnimationController? controller);
