// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) {
  return _TransactionModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  double get amount => throw _privateConstructorUsedError;
  @HiveField(2)
  String get category => throw _privateConstructorUsedError;
  @HiveField(3)
  DateTime get date => throw _privateConstructorUsedError;
  @HiveField(4)
  String get type => throw _privateConstructorUsedError;
  @HiveField(5)
  String get narration =>
      throw _privateConstructorUsedError; // 👇 extra field for local edit badge
  @HiveField(6)
  @JsonKey(defaultValue: false)
  bool get editedLocally => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionModelCopyWith<TransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionModelCopyWith<$Res> {
  factory $TransactionModelCopyWith(
          TransactionModel value, $Res Function(TransactionModel) then) =
      _$TransactionModelCopyWithImpl<$Res, TransactionModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) double amount,
      @HiveField(2) String category,
      @HiveField(3) DateTime date,
      @HiveField(4) String type,
      @HiveField(5) String narration,
      @HiveField(6) @JsonKey(defaultValue: false) bool editedLocally});
}

/// @nodoc
class _$TransactionModelCopyWithImpl<$Res, $Val extends TransactionModel>
    implements $TransactionModelCopyWith<$Res> {
  _$TransactionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? category = null,
    Object? date = null,
    Object? type = null,
    Object? narration = null,
    Object? editedLocally = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      narration: null == narration
          ? _value.narration
          : narration // ignore: cast_nullable_to_non_nullable
              as String,
      editedLocally: null == editedLocally
          ? _value.editedLocally
          : editedLocally // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionModelImplCopyWith<$Res>
    implements $TransactionModelCopyWith<$Res> {
  factory _$$TransactionModelImplCopyWith(_$TransactionModelImpl value,
          $Res Function(_$TransactionModelImpl) then) =
      __$$TransactionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) double amount,
      @HiveField(2) String category,
      @HiveField(3) DateTime date,
      @HiveField(4) String type,
      @HiveField(5) String narration,
      @HiveField(6) @JsonKey(defaultValue: false) bool editedLocally});
}

/// @nodoc
class __$$TransactionModelImplCopyWithImpl<$Res>
    extends _$TransactionModelCopyWithImpl<$Res, _$TransactionModelImpl>
    implements _$$TransactionModelImplCopyWith<$Res> {
  __$$TransactionModelImplCopyWithImpl(_$TransactionModelImpl _value,
      $Res Function(_$TransactionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? category = null,
    Object? date = null,
    Object? type = null,
    Object? narration = null,
    Object? editedLocally = null,
  }) {
    return _then(_$TransactionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      narration: null == narration
          ? _value.narration
          : narration // ignore: cast_nullable_to_non_nullable
              as String,
      editedLocally: null == editedLocally
          ? _value.editedLocally
          : editedLocally // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionModelImpl implements _TransactionModel {
  const _$TransactionModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.amount,
      @HiveField(2) required this.category,
      @HiveField(3) required this.date,
      @HiveField(4) required this.type,
      @HiveField(5) required this.narration,
      @HiveField(6) @JsonKey(defaultValue: false) this.editedLocally = false});

  factory _$TransactionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionModelImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final double amount;
  @override
  @HiveField(2)
  final String category;
  @override
  @HiveField(3)
  final DateTime date;
  @override
  @HiveField(4)
  final String type;
  @override
  @HiveField(5)
  final String narration;
// 👇 extra field for local edit badge
  @override
  @HiveField(6)
  @JsonKey(defaultValue: false)
  final bool editedLocally;

  @override
  String toString() {
    return 'TransactionModel(id: $id, amount: $amount, category: $category, date: $date, type: $type, narration: $narration, editedLocally: $editedLocally)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.narration, narration) ||
                other.narration == narration) &&
            (identical(other.editedLocally, editedLocally) ||
                other.editedLocally == editedLocally));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, amount, category, date, type, narration, editedLocally);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionModelImplCopyWith<_$TransactionModelImpl> get copyWith =>
      __$$TransactionModelImplCopyWithImpl<_$TransactionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionModel implements TransactionModel {
  const factory _TransactionModel(
      {@HiveField(0) required final String id,
      @HiveField(1) required final double amount,
      @HiveField(2) required final String category,
      @HiveField(3) required final DateTime date,
      @HiveField(4) required final String type,
      @HiveField(5) required final String narration,
      @HiveField(6)
      @JsonKey(defaultValue: false)
      final bool editedLocally}) = _$TransactionModelImpl;

  factory _TransactionModel.fromJson(Map<String, dynamic> json) =
      _$TransactionModelImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  double get amount;
  @override
  @HiveField(2)
  String get category;
  @override
  @HiveField(3)
  DateTime get date;
  @override
  @HiveField(4)
  String get type;
  @override
  @HiveField(5)
  String get narration;
  @override // 👇 extra field for local edit badge
  @HiveField(6)
  @JsonKey(defaultValue: false)
  bool get editedLocally;
  @override
  @JsonKey(ignore: true)
  _$$TransactionModelImplCopyWith<_$TransactionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
