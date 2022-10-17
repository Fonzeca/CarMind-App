// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluacion_terminada.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetEvaluacionTerminadaPojoDbCollection on Isar {
  IsarCollection<EvaluacionTerminadaPojoDb> get evaluacionTerminadaPojoDbs =>
      this.collection();
}

const EvaluacionTerminadaPojoDbSchema = CollectionSchema(
  name: r'EvaluacionTerminadaPojoDb',
  id: 6509685665155700764,
  properties: {
    r'vehiculo_id': PropertySchema(
      id: 0,
      name: r'vehiculo_id',
      type: IsarType.long,
    )
  },
  estimateSize: _evaluacionTerminadaPojoDbEstimateSize,
  serialize: _evaluacionTerminadaPojoDbSerialize,
  deserialize: _evaluacionTerminadaPojoDbDeserialize,
  deserializeProp: _evaluacionTerminadaPojoDbDeserializeProp,
  idName: r'privateId',
  indexes: {},
  links: {
    r'respuestasDb': LinkSchema(
      id: 7372298878327538924,
      name: r'respuestasDb',
      target: r'RespuestaPojoDb',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _evaluacionTerminadaPojoDbGetId,
  getLinks: _evaluacionTerminadaPojoDbGetLinks,
  attach: _evaluacionTerminadaPojoDbAttach,
  version: '3.0.2',
);

int _evaluacionTerminadaPojoDbEstimateSize(
  EvaluacionTerminadaPojoDb object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _evaluacionTerminadaPojoDbSerialize(
  EvaluacionTerminadaPojoDb object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.vehiculo_id);
}

EvaluacionTerminadaPojoDb _evaluacionTerminadaPojoDbDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EvaluacionTerminadaPojoDb();
  object.privateId = id;
  object.vehiculo_id = reader.readLongOrNull(offsets[0]);
  return object;
}

P _evaluacionTerminadaPojoDbDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _evaluacionTerminadaPojoDbGetId(EvaluacionTerminadaPojoDb object) {
  return object.privateId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _evaluacionTerminadaPojoDbGetLinks(
    EvaluacionTerminadaPojoDb object) {
  return [object.respuestasDb];
}

void _evaluacionTerminadaPojoDbAttach(
    IsarCollection<dynamic> col, Id id, EvaluacionTerminadaPojoDb object) {
  object.privateId = id;
  object.respuestasDb
      .attach(col, col.isar.collection<RespuestaPojoDb>(), r'respuestasDb', id);
}

extension EvaluacionTerminadaPojoDbQueryWhereSort on QueryBuilder<
    EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb, QWhere> {
  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterWhere> anyPrivateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EvaluacionTerminadaPojoDbQueryWhere on QueryBuilder<
    EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb, QWhereClause> {
  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterWhereClause> privateIdEqualTo(Id privateId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: privateId,
        upper: privateId,
      ));
    });
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
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

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
          QAfterWhereClause>
      privateIdGreaterThan(Id privateId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: privateId, includeLower: include),
      );
    });
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
          QAfterWhereClause>
      privateIdLessThan(Id privateId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: privateId, includeUpper: include),
      );
    });
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
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

extension EvaluacionTerminadaPojoDbQueryFilter on QueryBuilder<
    EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb, QFilterCondition> {
  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> privateIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'privateId',
      ));
    });
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> privateIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'privateId',
      ));
    });
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> privateIdEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'privateId',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
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

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
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

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
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

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> vehiculo_idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vehiculo_id',
      ));
    });
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> vehiculo_idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vehiculo_id',
      ));
    });
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> vehiculo_idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehiculo_id',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> vehiculo_idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehiculo_id',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> vehiculo_idLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehiculo_id',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> vehiculo_idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehiculo_id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension EvaluacionTerminadaPojoDbQueryObject on QueryBuilder<
    EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb, QFilterCondition> {}

extension EvaluacionTerminadaPojoDbQueryLinks on QueryBuilder<
    EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb, QFilterCondition> {
  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> respuestasDb(FilterQuery<RespuestaPojoDb> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'respuestasDb');
    });
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> respuestasDbLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'respuestasDb', length, true, length, true);
    });
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> respuestasDbIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'respuestasDb', 0, true, 0, true);
    });
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> respuestasDbIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'respuestasDb', 0, false, 999999, true);
    });
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> respuestasDbLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'respuestasDb', 0, true, length, include);
    });
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> respuestasDbLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'respuestasDb', length, include, 999999, true);
    });
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> respuestasDbLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'respuestasDb', lower, includeLower, upper, includeUpper);
    });
  }
}

extension EvaluacionTerminadaPojoDbQuerySortBy on QueryBuilder<
    EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb, QSortBy> {
  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterSortBy> sortByVehiculo_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehiculo_id', Sort.asc);
    });
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterSortBy> sortByVehiculo_idDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehiculo_id', Sort.desc);
    });
  }
}

extension EvaluacionTerminadaPojoDbQuerySortThenBy on QueryBuilder<
    EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb, QSortThenBy> {
  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterSortBy> thenByPrivateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'privateId', Sort.asc);
    });
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterSortBy> thenByPrivateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'privateId', Sort.desc);
    });
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterSortBy> thenByVehiculo_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehiculo_id', Sort.asc);
    });
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterSortBy> thenByVehiculo_idDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehiculo_id', Sort.desc);
    });
  }
}

extension EvaluacionTerminadaPojoDbQueryWhereDistinct on QueryBuilder<
    EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb, QDistinct> {
  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb, QDistinct>
      distinctByVehiculo_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehiculo_id');
    });
  }
}

extension EvaluacionTerminadaPojoDbQueryProperty on QueryBuilder<
    EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb, QQueryProperty> {
  QueryBuilder<EvaluacionTerminadaPojoDb, int, QQueryOperations>
      privateIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'privateId');
    });
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, int?, QQueryOperations>
      vehiculo_idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehiculo_id');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetRespuestaPojoDbCollection on Isar {
  IsarCollection<RespuestaPojoDb> get respuestaPojoDbs => this.collection();
}

const RespuestaPojoDbSchema = CollectionSchema(
  name: r'RespuestaPojoDb',
  id: -1914254771855069611,
  properties: {
    r'base64_image': PropertySchema(
      id: 0,
      name: r'base64_image',
      type: IsarType.string,
    ),
    r'pregunta_id': PropertySchema(
      id: 1,
      name: r'pregunta_id',
      type: IsarType.long,
    ),
    r'texto': PropertySchema(
      id: 2,
      name: r'texto',
      type: IsarType.string,
    ),
    r'tick_correcto': PropertySchema(
      id: 3,
      name: r'tick_correcto',
      type: IsarType.bool,
    )
  },
  estimateSize: _respuestaPojoDbEstimateSize,
  serialize: _respuestaPojoDbSerialize,
  deserialize: _respuestaPojoDbDeserialize,
  deserializeProp: _respuestaPojoDbDeserializeProp,
  idName: r'privateId',
  indexes: {},
  links: {
    r'opcionesDb': LinkSchema(
      id: -6501551521722503074,
      name: r'opcionesDb',
      target: r'RespuestaOpcionPojo',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _respuestaPojoDbGetId,
  getLinks: _respuestaPojoDbGetLinks,
  attach: _respuestaPojoDbAttach,
  version: '3.0.2',
);

int _respuestaPojoDbEstimateSize(
  RespuestaPojoDb object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.base64_image;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.texto;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _respuestaPojoDbSerialize(
  RespuestaPojoDb object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.base64_image);
  writer.writeLong(offsets[1], object.pregunta_id);
  writer.writeString(offsets[2], object.texto);
  writer.writeBool(offsets[3], object.tick_correcto);
}

RespuestaPojoDb _respuestaPojoDbDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RespuestaPojoDb();
  object.base64_image = reader.readStringOrNull(offsets[0]);
  object.pregunta_id = reader.readLongOrNull(offsets[1]);
  object.privateId = id;
  object.texto = reader.readStringOrNull(offsets[2]);
  object.tick_correcto = reader.readBoolOrNull(offsets[3]);
  return object;
}

P _respuestaPojoDbDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _respuestaPojoDbGetId(RespuestaPojoDb object) {
  return object.privateId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _respuestaPojoDbGetLinks(RespuestaPojoDb object) {
  return [object.opcionesDb];
}

void _respuestaPojoDbAttach(
    IsarCollection<dynamic> col, Id id, RespuestaPojoDb object) {
  object.privateId = id;
  object.opcionesDb.attach(
      col, col.isar.collection<RespuestaOpcionPojo>(), r'opcionesDb', id);
}

extension RespuestaPojoDbQueryWhereSort
    on QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QWhere> {
  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterWhere> anyPrivateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RespuestaPojoDbQueryWhere
    on QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QWhereClause> {
  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterWhereClause>
      privateIdEqualTo(Id privateId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: privateId,
        upper: privateId,
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterWhereClause>
      privateIdNotEqualTo(Id privateId) {
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

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterWhereClause>
      privateIdGreaterThan(Id privateId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: privateId, includeLower: include),
      );
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterWhereClause>
      privateIdLessThan(Id privateId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: privateId, includeUpper: include),
      );
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterWhereClause>
      privateIdBetween(
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

extension RespuestaPojoDbQueryFilter
    on QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QFilterCondition> {
  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      base64_imageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'base64_image',
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      base64_imageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'base64_image',
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      base64_imageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'base64_image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      base64_imageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'base64_image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      base64_imageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'base64_image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      base64_imageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'base64_image',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      base64_imageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'base64_image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      base64_imageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'base64_image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      base64_imageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'base64_image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      base64_imageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'base64_image',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      base64_imageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'base64_image',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      base64_imageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'base64_image',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      pregunta_idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pregunta_id',
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      pregunta_idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pregunta_id',
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      pregunta_idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pregunta_id',
        value: value,
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      pregunta_idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pregunta_id',
        value: value,
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      pregunta_idLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pregunta_id',
        value: value,
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      pregunta_idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pregunta_id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      privateIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'privateId',
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      privateIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'privateId',
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      privateIdEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'privateId',
        value: value,
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      privateIdGreaterThan(
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

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      privateIdLessThan(
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

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      privateIdBetween(
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

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      textoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'texto',
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      textoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'texto',
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      textoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'texto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      textoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'texto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      textoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'texto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      textoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'texto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      textoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'texto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      textoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'texto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      textoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'texto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      textoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'texto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      textoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'texto',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      textoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'texto',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      tick_correctoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tick_correcto',
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      tick_correctoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tick_correcto',
      ));
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      tick_correctoEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tick_correcto',
        value: value,
      ));
    });
  }
}

extension RespuestaPojoDbQueryObject
    on QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QFilterCondition> {}

extension RespuestaPojoDbQueryLinks
    on QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QFilterCondition> {
  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      opcionesDb(FilterQuery<RespuestaOpcionPojo> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'opcionesDb');
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      opcionesDbLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'opcionesDb', length, true, length, true);
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      opcionesDbIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'opcionesDb', 0, true, 0, true);
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      opcionesDbIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'opcionesDb', 0, false, 999999, true);
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      opcionesDbLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'opcionesDb', 0, true, length, include);
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      opcionesDbLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'opcionesDb', length, include, 999999, true);
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      opcionesDbLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'opcionesDb', lower, includeLower, upper, includeUpper);
    });
  }
}

extension RespuestaPojoDbQuerySortBy
    on QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QSortBy> {
  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      sortByBase64_image() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'base64_image', Sort.asc);
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      sortByBase64_imageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'base64_image', Sort.desc);
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      sortByPregunta_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pregunta_id', Sort.asc);
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      sortByPregunta_idDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pregunta_id', Sort.desc);
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy> sortByTexto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'texto', Sort.asc);
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      sortByTextoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'texto', Sort.desc);
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      sortByTick_correcto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tick_correcto', Sort.asc);
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      sortByTick_correctoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tick_correcto', Sort.desc);
    });
  }
}

extension RespuestaPojoDbQuerySortThenBy
    on QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QSortThenBy> {
  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      thenByBase64_image() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'base64_image', Sort.asc);
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      thenByBase64_imageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'base64_image', Sort.desc);
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      thenByPregunta_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pregunta_id', Sort.asc);
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      thenByPregunta_idDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pregunta_id', Sort.desc);
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      thenByPrivateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'privateId', Sort.asc);
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      thenByPrivateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'privateId', Sort.desc);
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy> thenByTexto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'texto', Sort.asc);
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      thenByTextoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'texto', Sort.desc);
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      thenByTick_correcto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tick_correcto', Sort.asc);
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      thenByTick_correctoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tick_correcto', Sort.desc);
    });
  }
}

extension RespuestaPojoDbQueryWhereDistinct
    on QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QDistinct> {
  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QDistinct>
      distinctByBase64_image({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'base64_image', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QDistinct>
      distinctByPregunta_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pregunta_id');
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QDistinct> distinctByTexto(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'texto', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QDistinct>
      distinctByTick_correcto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tick_correcto');
    });
  }
}

extension RespuestaPojoDbQueryProperty
    on QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QQueryProperty> {
  QueryBuilder<RespuestaPojoDb, int, QQueryOperations> privateIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'privateId');
    });
  }

  QueryBuilder<RespuestaPojoDb, String?, QQueryOperations>
      base64_imageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'base64_image');
    });
  }

  QueryBuilder<RespuestaPojoDb, int?, QQueryOperations> pregunta_idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pregunta_id');
    });
  }

  QueryBuilder<RespuestaPojoDb, String?, QQueryOperations> textoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'texto');
    });
  }

  QueryBuilder<RespuestaPojoDb, bool?, QQueryOperations>
      tick_correctoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tick_correcto');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetRespuestaOpcionPojoCollection on Isar {
  IsarCollection<RespuestaOpcionPojo> get respuestaOpcionPojos =>
      this.collection();
}

const RespuestaOpcionPojoSchema = CollectionSchema(
  name: r'RespuestaOpcionPojo',
  id: 8597776754945819610,
  properties: {
    r'opcion_id': PropertySchema(
      id: 0,
      name: r'opcion_id',
      type: IsarType.long,
    ),
    r'tick_correcto': PropertySchema(
      id: 1,
      name: r'tick_correcto',
      type: IsarType.bool,
    )
  },
  estimateSize: _respuestaOpcionPojoEstimateSize,
  serialize: _respuestaOpcionPojoSerialize,
  deserialize: _respuestaOpcionPojoDeserialize,
  deserializeProp: _respuestaOpcionPojoDeserializeProp,
  idName: r'privateId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _respuestaOpcionPojoGetId,
  getLinks: _respuestaOpcionPojoGetLinks,
  attach: _respuestaOpcionPojoAttach,
  version: '3.0.2',
);

int _respuestaOpcionPojoEstimateSize(
  RespuestaOpcionPojo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _respuestaOpcionPojoSerialize(
  RespuestaOpcionPojo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.opcion_id);
  writer.writeBool(offsets[1], object.tick_correcto);
}

RespuestaOpcionPojo _respuestaOpcionPojoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RespuestaOpcionPojo();
  object.opcion_id = reader.readLongOrNull(offsets[0]);
  object.privateId = id;
  object.tick_correcto = reader.readBoolOrNull(offsets[1]);
  return object;
}

P _respuestaOpcionPojoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _respuestaOpcionPojoGetId(RespuestaOpcionPojo object) {
  return object.privateId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _respuestaOpcionPojoGetLinks(
    RespuestaOpcionPojo object) {
  return [];
}

void _respuestaOpcionPojoAttach(
    IsarCollection<dynamic> col, Id id, RespuestaOpcionPojo object) {
  object.privateId = id;
}

extension RespuestaOpcionPojoQueryWhereSort
    on QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QWhere> {
  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterWhere>
      anyPrivateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RespuestaOpcionPojoQueryWhere
    on QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QWhereClause> {
  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterWhereClause>
      privateIdEqualTo(Id privateId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: privateId,
        upper: privateId,
      ));
    });
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterWhereClause>
      privateIdNotEqualTo(Id privateId) {
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

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterWhereClause>
      privateIdGreaterThan(Id privateId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: privateId, includeLower: include),
      );
    });
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterWhereClause>
      privateIdLessThan(Id privateId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: privateId, includeUpper: include),
      );
    });
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterWhereClause>
      privateIdBetween(
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

extension RespuestaOpcionPojoQueryFilter on QueryBuilder<RespuestaOpcionPojo,
    RespuestaOpcionPojo, QFilterCondition> {
  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      opcion_idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'opcion_id',
      ));
    });
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      opcion_idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'opcion_id',
      ));
    });
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      opcion_idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opcion_id',
        value: value,
      ));
    });
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      opcion_idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'opcion_id',
        value: value,
      ));
    });
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      opcion_idLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'opcion_id',
        value: value,
      ));
    });
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      opcion_idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'opcion_id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      privateIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'privateId',
      ));
    });
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      privateIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'privateId',
      ));
    });
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      privateIdEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'privateId',
        value: value,
      ));
    });
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      privateIdGreaterThan(
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

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      privateIdLessThan(
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

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      privateIdBetween(
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

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      tick_correctoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tick_correcto',
      ));
    });
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      tick_correctoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tick_correcto',
      ));
    });
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      tick_correctoEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tick_correcto',
        value: value,
      ));
    });
  }
}

extension RespuestaOpcionPojoQueryObject on QueryBuilder<RespuestaOpcionPojo,
    RespuestaOpcionPojo, QFilterCondition> {}

extension RespuestaOpcionPojoQueryLinks on QueryBuilder<RespuestaOpcionPojo,
    RespuestaOpcionPojo, QFilterCondition> {}

extension RespuestaOpcionPojoQuerySortBy
    on QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QSortBy> {
  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      sortByOpcion_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opcion_id', Sort.asc);
    });
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      sortByOpcion_idDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opcion_id', Sort.desc);
    });
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      sortByTick_correcto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tick_correcto', Sort.asc);
    });
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      sortByTick_correctoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tick_correcto', Sort.desc);
    });
  }
}

extension RespuestaOpcionPojoQuerySortThenBy
    on QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QSortThenBy> {
  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      thenByOpcion_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opcion_id', Sort.asc);
    });
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      thenByOpcion_idDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opcion_id', Sort.desc);
    });
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      thenByPrivateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'privateId', Sort.asc);
    });
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      thenByPrivateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'privateId', Sort.desc);
    });
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      thenByTick_correcto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tick_correcto', Sort.asc);
    });
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      thenByTick_correctoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tick_correcto', Sort.desc);
    });
  }
}

extension RespuestaOpcionPojoQueryWhereDistinct
    on QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QDistinct> {
  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QDistinct>
      distinctByOpcion_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'opcion_id');
    });
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QDistinct>
      distinctByTick_correcto() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tick_correcto');
    });
  }
}

extension RespuestaOpcionPojoQueryProperty
    on QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QQueryProperty> {
  QueryBuilder<RespuestaOpcionPojo, int, QQueryOperations> privateIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'privateId');
    });
  }

  QueryBuilder<RespuestaOpcionPojo, int?, QQueryOperations>
      opcion_idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'opcion_id');
    });
  }

  QueryBuilder<RespuestaOpcionPojo, bool?, QQueryOperations>
      tick_correctoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tick_correcto');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvaluacionTerminadaPojo _$EvaluacionTerminadaPojoFromJson(
        Map<String, dynamic> json) =>
    EvaluacionTerminadaPojo()
      ..vehiculo_id = json['vehiculo_id'] as int?
      ..respuestas = (json['respuestas'] as List<dynamic>?)
          ?.map((e) => RespuestaPojo.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$EvaluacionTerminadaPojoToJson(
        EvaluacionTerminadaPojo instance) =>
    <String, dynamic>{
      'vehiculo_id': instance.vehiculo_id,
      'respuestas': instance.respuestas?.map((e) => e.toJson()).toList(),
    };

RespuestaPojo _$RespuestaPojoFromJson(Map<String, dynamic> json) =>
    RespuestaPojo()
      ..pregunta_id = json['pregunta_id'] as int?
      ..tick_correcto = json['tick_correcto'] as bool?
      ..base64_image = json['base64_image'] as String?
      ..texto = json['texto'] as String?
      ..opciones = (json['opciones'] as List<dynamic>?)
          ?.map((e) => RespuestaOpcionPojo.fromJson(e))
          .toList();

Map<String, dynamic> _$RespuestaPojoToJson(RespuestaPojo instance) =>
    <String, dynamic>{
      'pregunta_id': instance.pregunta_id,
      'tick_correcto': instance.tick_correcto,
      'base64_image': instance.base64_image,
      'texto': instance.texto,
      'opciones': instance.opciones?.map((e) => e.toJson()).toList(),
    };

RespuestaOpcionPojo _$RespuestaOpcionPojoFromJson(Map<String, dynamic> json) =>
    RespuestaOpcionPojo()
      ..privateId = json['privateId'] as int?
      ..opcion_id = json['opcion_id'] as int?
      ..tick_correcto = json['tick_correcto'] as bool?;

Map<String, dynamic> _$RespuestaOpcionPojoToJson(
        RespuestaOpcionPojo instance) =>
    <String, dynamic>{
      'privateId': instance.privateId,
      'opcion_id': instance.opcion_id,
      'tick_correcto': instance.tick_correcto,
    };
