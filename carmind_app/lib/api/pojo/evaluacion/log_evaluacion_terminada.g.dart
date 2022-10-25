// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_evaluacion_terminada.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetLogEvaluacionTerminadaPojoDbCollection on Isar {
  IsarCollection<LogEvaluacionTerminadaPojoDb>
      get logEvaluacionTerminadaPojoDbs => this.collection();
}

const LogEvaluacionTerminadaPojoDbSchema = CollectionSchema(
  name: r'LogEvaluacionTerminadaPojoDb',
  id: 8412531073216460720,
  properties: {
    r'evaluacionId': PropertySchema(
      id: 0,
      name: r'evaluacionId',
      type: IsarType.long,
    ),
    r'fecha': PropertySchema(
      id: 1,
      name: r'fecha',
      type: IsarType.string,
    )
  },
  estimateSize: _logEvaluacionTerminadaPojoDbEstimateSize,
  serialize: _logEvaluacionTerminadaPojoDbSerialize,
  deserialize: _logEvaluacionTerminadaPojoDbDeserialize,
  deserializeProp: _logEvaluacionTerminadaPojoDbDeserializeProp,
  idName: r'privateId',
  indexes: {},
  links: {
    r'respuestaDb': LinkSchema(
      id: 5862898511460246612,
      name: r'respuestaDb',
      target: r'EvaluacionTerminadaPojoDb',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _logEvaluacionTerminadaPojoDbGetId,
  getLinks: _logEvaluacionTerminadaPojoDbGetLinks,
  attach: _logEvaluacionTerminadaPojoDbAttach,
  version: '3.0.2',
);

int _logEvaluacionTerminadaPojoDbEstimateSize(
  LogEvaluacionTerminadaPojoDb object,
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

void _logEvaluacionTerminadaPojoDbSerialize(
  LogEvaluacionTerminadaPojoDb object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.evaluacionId);
  writer.writeString(offsets[1], object.fecha);
}

LogEvaluacionTerminadaPojoDb _logEvaluacionTerminadaPojoDbDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LogEvaluacionTerminadaPojoDb();
  object.evaluacionId = reader.readLongOrNull(offsets[0]);
  object.fecha = reader.readStringOrNull(offsets[1]);
  object.privateId = id;
  return object;
}

P _logEvaluacionTerminadaPojoDbDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _logEvaluacionTerminadaPojoDbGetId(LogEvaluacionTerminadaPojoDb object) {
  return object.privateId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _logEvaluacionTerminadaPojoDbGetLinks(
    LogEvaluacionTerminadaPojoDb object) {
  return [object.respuestaDb];
}

void _logEvaluacionTerminadaPojoDbAttach(
    IsarCollection<dynamic> col, Id id, LogEvaluacionTerminadaPojoDb object) {
  object.privateId = id;
  object.respuestaDb.attach(col,
      col.isar.collection<EvaluacionTerminadaPojoDb>(), r'respuestaDb', id);
}

extension LogEvaluacionTerminadaPojoDbQueryWhereSort on QueryBuilder<
    LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb, QWhere> {
  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterWhere> anyPrivateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LogEvaluacionTerminadaPojoDbQueryWhere on QueryBuilder<
    LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb, QWhereClause> {
  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterWhereClause> privateIdEqualTo(Id privateId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: privateId,
        upper: privateId,
      ));
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterWhereClause> privateIdNotEqualTo(Id privateId) {
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

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
          QAfterWhereClause>
      privateIdGreaterThan(Id privateId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: privateId, includeLower: include),
      );
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
          QAfterWhereClause>
      privateIdLessThan(Id privateId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: privateId, includeUpper: include),
      );
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterWhereClause> privateIdBetween(
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

extension LogEvaluacionTerminadaPojoDbQueryFilter on QueryBuilder<
    LogEvaluacionTerminadaPojoDb,
    LogEvaluacionTerminadaPojoDb,
    QFilterCondition> {
  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> evaluacionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'evaluacionId',
      ));
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> evaluacionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'evaluacionId',
      ));
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> evaluacionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'evaluacionId',
        value: value,
      ));
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> evaluacionIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'evaluacionId',
        value: value,
      ));
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> evaluacionIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'evaluacionId',
        value: value,
      ));
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> evaluacionIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'evaluacionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> fechaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fecha',
      ));
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> fechaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fecha',
      ));
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> fechaEqualTo(
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

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> fechaGreaterThan(
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

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> fechaLessThan(
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

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> fechaBetween(
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

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> fechaStartsWith(
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

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> fechaEndsWith(
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

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
          QAfterFilterCondition>
      fechaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fecha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
          QAfterFilterCondition>
      fechaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fecha',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> fechaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fecha',
        value: '',
      ));
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> fechaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fecha',
        value: '',
      ));
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> privateIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'privateId',
      ));
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> privateIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'privateId',
      ));
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> privateIdEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'privateId',
        value: value,
      ));
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> privateIdGreaterThan(
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

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> privateIdLessThan(
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

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> privateIdBetween(
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
}

extension LogEvaluacionTerminadaPojoDbQueryObject on QueryBuilder<
    LogEvaluacionTerminadaPojoDb,
    LogEvaluacionTerminadaPojoDb,
    QFilterCondition> {}

extension LogEvaluacionTerminadaPojoDbQueryLinks on QueryBuilder<
    LogEvaluacionTerminadaPojoDb,
    LogEvaluacionTerminadaPojoDb,
    QFilterCondition> {
  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
          QAfterFilterCondition>
      respuestaDb(FilterQuery<EvaluacionTerminadaPojoDb> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'respuestaDb');
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> respuestaDbIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'respuestaDb', 0, true, 0, true);
    });
  }
}

extension LogEvaluacionTerminadaPojoDbQuerySortBy on QueryBuilder<
    LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb, QSortBy> {
  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterSortBy> sortByEvaluacionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'evaluacionId', Sort.asc);
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterSortBy> sortByEvaluacionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'evaluacionId', Sort.desc);
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterSortBy> sortByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterSortBy> sortByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }
}

extension LogEvaluacionTerminadaPojoDbQuerySortThenBy on QueryBuilder<
    LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb, QSortThenBy> {
  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterSortBy> thenByEvaluacionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'evaluacionId', Sort.asc);
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterSortBy> thenByEvaluacionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'evaluacionId', Sort.desc);
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterSortBy> thenByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterSortBy> thenByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterSortBy> thenByPrivateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'privateId', Sort.asc);
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterSortBy> thenByPrivateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'privateId', Sort.desc);
    });
  }
}

extension LogEvaluacionTerminadaPojoDbQueryWhereDistinct on QueryBuilder<
    LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb, QDistinct> {
  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QDistinct> distinctByEvaluacionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'evaluacionId');
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QDistinct> distinctByFecha({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fecha', caseSensitive: caseSensitive);
    });
  }
}

extension LogEvaluacionTerminadaPojoDbQueryProperty on QueryBuilder<
    LogEvaluacionTerminadaPojoDb,
    LogEvaluacionTerminadaPojoDb,
    QQueryProperty> {
  QueryBuilder<LogEvaluacionTerminadaPojoDb, int, QQueryOperations>
      privateIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'privateId');
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, int?, QQueryOperations>
      evaluacionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'evaluacionId');
    });
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, String?, QQueryOperations>
      fechaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fecha');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogEvaluacionTerminadaPojo _$LogEvaluacionTerminadaPojoFromJson(
        Map<String, dynamic> json) =>
    LogEvaluacionTerminadaPojo()
      ..fecha = json['fecha'] as String?
      ..evaluacionId = json['evaluacionId'] as int?
      ..respuesta = json['respuesta'] == null
          ? null
          : EvaluacionTerminadaPojo.fromJson(
              json['respuesta'] as Map<String, dynamic>);

Map<String, dynamic> _$LogEvaluacionTerminadaPojoToJson(
        LogEvaluacionTerminadaPojo instance) =>
    <String, dynamic>{
      'fecha': instance.fecha,
      'evaluacionId': instance.evaluacionId,
      'respuesta': instance.respuesta,
    };
