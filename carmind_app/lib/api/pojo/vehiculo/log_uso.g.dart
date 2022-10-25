// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_uso.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetLogUsoCollection on Isar {
  IsarCollection<LogUso> get logUsos => this.collection();
}

const LogUsoSchema = CollectionSchema(
  name: r'LogUso',
  id: -5544674484487069517,
  properties: {
    r'enUso': PropertySchema(
      id: 0,
      name: r'enUso',
      type: IsarType.bool,
    ),
    r'fecha': PropertySchema(
      id: 1,
      name: r'fecha',
      type: IsarType.string,
    ),
    r'vehiculoId': PropertySchema(
      id: 2,
      name: r'vehiculoId',
      type: IsarType.long,
    )
  },
  estimateSize: _logUsoEstimateSize,
  serialize: _logUsoSerialize,
  deserialize: _logUsoDeserialize,
  deserializeProp: _logUsoDeserializeProp,
  idName: r'privateId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _logUsoGetId,
  getLinks: _logUsoGetLinks,
  attach: _logUsoAttach,
  version: '3.0.2',
);

int _logUsoEstimateSize(
  LogUso object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.fecha;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _logUsoSerialize(
  LogUso object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.enUso);
  writer.writeString(offsets[1], object.fecha);
  writer.writeLong(offsets[2], object.vehiculoId);
}

LogUso _logUsoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LogUso();
  object.enUso = reader.readBoolOrNull(offsets[0]);
  object.fecha = reader.readStringOrNull(offsets[1]);
  object.privateId = id;
  object.vehiculoId = reader.readLongOrNull(offsets[2]);
  return object;
}

P _logUsoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _logUsoGetId(LogUso object) {
  return object.privateId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _logUsoGetLinks(LogUso object) {
  return [];
}

void _logUsoAttach(IsarCollection<dynamic> col, Id id, LogUso object) {
  object.privateId = id;
}

extension LogUsoQueryWhereSort on QueryBuilder<LogUso, LogUso, QWhere> {
  QueryBuilder<LogUso, LogUso, QAfterWhere> anyPrivateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LogUsoQueryWhere on QueryBuilder<LogUso, LogUso, QWhereClause> {
  QueryBuilder<LogUso, LogUso, QAfterWhereClause> privateIdEqualTo(
      Id privateId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: privateId,
        upper: privateId,
      ));
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterWhereClause> privateIdNotEqualTo(
      Id privateId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: privateId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: privateId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: privateId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: privateId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterWhereClause> privateIdGreaterThan(
      Id privateId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: privateId, includeLower: include),
      );
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterWhereClause> privateIdLessThan(
      Id privateId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: privateId, includeUpper: include),
      );
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterWhereClause> privateIdBetween(
    Id lowerPrivateId,
    Id upperPrivateId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerPrivateId,
        includeLower: includeLower,
        upper: upperPrivateId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LogUsoQueryFilter on QueryBuilder<LogUso, LogUso, QFilterCondition> {
  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> enUsoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'enUso',
      ));
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> enUsoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'enUso',
      ));
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> enUsoEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enUso',
        value: value,
      ));
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> fechaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fecha',
      ));
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> fechaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fecha',
      ));
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> fechaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fecha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> fechaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fecha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> fechaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fecha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> fechaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fecha',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> fechaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fecha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> fechaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fecha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> fechaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fecha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> fechaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fecha',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> fechaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fecha',
        value: '',
      ));
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> fechaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fecha',
        value: '',
      ));
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> privateIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'privateId',
      ));
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> privateIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'privateId',
      ));
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> privateIdEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'privateId',
        value: value,
      ));
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> privateIdGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'privateId',
        value: value,
      ));
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> privateIdLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'privateId',
        value: value,
      ));
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> privateIdBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'privateId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> vehiculoIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vehiculoId',
      ));
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> vehiculoIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vehiculoId',
      ));
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> vehiculoIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehiculoId',
        value: value,
      ));
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> vehiculoIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehiculoId',
        value: value,
      ));
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> vehiculoIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehiculoId',
        value: value,
      ));
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> vehiculoIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehiculoId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LogUsoQueryObject on QueryBuilder<LogUso, LogUso, QFilterCondition> {}

extension LogUsoQueryLinks on QueryBuilder<LogUso, LogUso, QFilterCondition> {}

extension LogUsoQuerySortBy on QueryBuilder<LogUso, LogUso, QSortBy> {
  QueryBuilder<LogUso, LogUso, QAfterSortBy> sortByEnUso() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enUso', Sort.asc);
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> sortByEnUsoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enUso', Sort.desc);
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> sortByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> sortByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> sortByVehiculoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehiculoId', Sort.asc);
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> sortByVehiculoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehiculoId', Sort.desc);
    });
  }
}

extension LogUsoQuerySortThenBy on QueryBuilder<LogUso, LogUso, QSortThenBy> {
  QueryBuilder<LogUso, LogUso, QAfterSortBy> thenByEnUso() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enUso', Sort.asc);
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> thenByEnUsoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enUso', Sort.desc);
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> thenByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> thenByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> thenByPrivateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'privateId', Sort.asc);
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> thenByPrivateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'privateId', Sort.desc);
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> thenByVehiculoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehiculoId', Sort.asc);
    });
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> thenByVehiculoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehiculoId', Sort.desc);
    });
  }
}

extension LogUsoQueryWhereDistinct on QueryBuilder<LogUso, LogUso, QDistinct> {
  QueryBuilder<LogUso, LogUso, QDistinct> distinctByEnUso() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enUso');
    });
  }

  QueryBuilder<LogUso, LogUso, QDistinct> distinctByFecha(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fecha', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LogUso, LogUso, QDistinct> distinctByVehiculoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehiculoId');
    });
  }
}

extension LogUsoQueryProperty on QueryBuilder<LogUso, LogUso, QQueryProperty> {
  QueryBuilder<LogUso, int, QQueryOperations> privateIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'privateId');
    });
  }

  QueryBuilder<LogUso, bool?, QQueryOperations> enUsoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enUso');
    });
  }

  QueryBuilder<LogUso, String?, QQueryOperations> fechaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fecha');
    });
  }

  QueryBuilder<LogUso, int?, QQueryOperations> vehiculoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehiculoId');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogUso _$LogUsoFromJson(Map<String, dynamic> json) => LogUso()
  ..vehiculoId = json['vehiculoId'] as int?
  ..fecha = json['fecha'] as String?
  ..enUso = json['enUso'] as bool?;

Map<String, dynamic> _$LogUsoToJson(LogUso instance) => <String, dynamic>{
      'vehiculoId': instance.vehiculoId,
      'fecha': instance.fecha,
      'enUso': instance.enUso,
    };
