// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluacion.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetEvaluacionDbCollection on Isar {
  IsarCollection<EvaluacionDb> get evaluacionDbs => this.collection();
}

const EvaluacionDbSchema = CollectionSchema(
  name: r'EvaluacionDb',
  id: -4831475202875538129,
  properties: {
    r'titulo': PropertySchema(
      id: 0,
      name: r'titulo',
      type: IsarType.string,
    ),
    r'vehiculo_id': PropertySchema(
      id: 1,
      name: r'vehiculo_id',
      type: IsarType.longList,
    )
  },
  estimateSize: _evaluacionDbEstimateSize,
  serialize: _evaluacionDbSerialize,
  deserialize: _evaluacionDbDeserialize,
  deserializeProp: _evaluacionDbDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'preguntasDb': LinkSchema(
      id: -4320064514723164858,
      name: r'preguntasDb',
      target: r'PreguntaPojoDb',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _evaluacionDbGetId,
  getLinks: _evaluacionDbGetLinks,
  attach: _evaluacionDbAttach,
  version: '3.0.2',
);

int _evaluacionDbEstimateSize(
  EvaluacionDb object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.titulo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.vehiculo_id;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  return bytesCount;
}

void _evaluacionDbSerialize(
  EvaluacionDb object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.titulo);
  writer.writeLongList(offsets[1], object.vehiculo_id);
}

EvaluacionDb _evaluacionDbDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EvaluacionDb();
  object.id = id;
  object.titulo = reader.readStringOrNull(offsets[0]);
  object.vehiculo_id = reader.readLongList(offsets[1]);
  return object;
}

P _evaluacionDbDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _evaluacionDbGetId(EvaluacionDb object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _evaluacionDbGetLinks(EvaluacionDb object) {
  return [object.preguntasDb];
}

void _evaluacionDbAttach(
    IsarCollection<dynamic> col, Id id, EvaluacionDb object) {
  object.id = id;
  object.preguntasDb
      .attach(col, col.isar.collection<PreguntaPojoDb>(), r'preguntasDb', id);
}

extension EvaluacionDbQueryWhereSort
    on QueryBuilder<EvaluacionDb, EvaluacionDb, QWhere> {
  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EvaluacionDbQueryWhere
    on QueryBuilder<EvaluacionDb, EvaluacionDb, QWhereClause> {
  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension EvaluacionDbQueryFilter
    on QueryBuilder<EvaluacionDb, EvaluacionDb, QFilterCondition> {
  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      tituloIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'titulo',
      ));
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      tituloIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'titulo',
      ));
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition> tituloEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      tituloGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      tituloLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition> tituloBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'titulo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      tituloStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      tituloEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      tituloContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition> tituloMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'titulo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      tituloIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titulo',
        value: '',
      ));
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      tituloIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'titulo',
        value: '',
      ));
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      vehiculo_idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vehiculo_id',
      ));
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      vehiculo_idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vehiculo_id',
      ));
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      vehiculo_idElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehiculo_id',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      vehiculo_idElementGreaterThan(
    int value, {
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

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      vehiculo_idElementLessThan(
    int value, {
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

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      vehiculo_idElementBetween(
    int lower,
    int upper, {
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

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      vehiculo_idLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'vehiculo_id',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      vehiculo_idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'vehiculo_id',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      vehiculo_idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'vehiculo_id',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      vehiculo_idLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'vehiculo_id',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      vehiculo_idLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'vehiculo_id',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      vehiculo_idLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'vehiculo_id',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension EvaluacionDbQueryObject
    on QueryBuilder<EvaluacionDb, EvaluacionDb, QFilterCondition> {}

extension EvaluacionDbQueryLinks
    on QueryBuilder<EvaluacionDb, EvaluacionDb, QFilterCondition> {
  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition> preguntasDb(
      FilterQuery<PreguntaPojoDb> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'preguntasDb');
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      preguntasDbLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'preguntasDb', length, true, length, true);
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      preguntasDbIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'preguntasDb', 0, true, 0, true);
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      preguntasDbIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'preguntasDb', 0, false, 999999, true);
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      preguntasDbLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'preguntasDb', 0, true, length, include);
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      preguntasDbLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'preguntasDb', length, include, 999999, true);
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      preguntasDbLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'preguntasDb', lower, includeLower, upper, includeUpper);
    });
  }
}

extension EvaluacionDbQuerySortBy
    on QueryBuilder<EvaluacionDb, EvaluacionDb, QSortBy> {
  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterSortBy> sortByTitulo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.asc);
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterSortBy> sortByTituloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.desc);
    });
  }
}

extension EvaluacionDbQuerySortThenBy
    on QueryBuilder<EvaluacionDb, EvaluacionDb, QSortThenBy> {
  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterSortBy> thenByTitulo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.asc);
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterSortBy> thenByTituloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.desc);
    });
  }
}

extension EvaluacionDbQueryWhereDistinct
    on QueryBuilder<EvaluacionDb, EvaluacionDb, QDistinct> {
  QueryBuilder<EvaluacionDb, EvaluacionDb, QDistinct> distinctByTitulo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'titulo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QDistinct> distinctByVehiculo_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehiculo_id');
    });
  }
}

extension EvaluacionDbQueryProperty
    on QueryBuilder<EvaluacionDb, EvaluacionDb, QQueryProperty> {
  QueryBuilder<EvaluacionDb, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<EvaluacionDb, String?, QQueryOperations> tituloProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titulo');
    });
  }

  QueryBuilder<EvaluacionDb, List<int>?, QQueryOperations>
      vehiculo_idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehiculo_id');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetPreguntaPojoDbCollection on Isar {
  IsarCollection<PreguntaPojoDb> get preguntaPojoDbs => this.collection();
}

const PreguntaPojoDbSchema = CollectionSchema(
  name: r'PreguntaPojoDb',
  id: -2853444963142709170,
  properties: {
    r'descripcion': PropertySchema(
      id: 0,
      name: r'descripcion',
      type: IsarType.string,
    ),
    r'tipo': PropertySchema(
      id: 1,
      name: r'tipo',
      type: IsarType.string,
    )
  },
  estimateSize: _preguntaPojoDbEstimateSize,
  serialize: _preguntaPojoDbSerialize,
  deserialize: _preguntaPojoDbDeserialize,
  deserializeProp: _preguntaPojoDbDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'opcionesDb': LinkSchema(
      id: -2150346088070817988,
      name: r'opcionesDb',
      target: r'OpcionPojo',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _preguntaPojoDbGetId,
  getLinks: _preguntaPojoDbGetLinks,
  attach: _preguntaPojoDbAttach,
  version: '3.0.2',
);

int _preguntaPojoDbEstimateSize(
  PreguntaPojoDb object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.descripcion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tipo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _preguntaPojoDbSerialize(
  PreguntaPojoDb object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.descripcion);
  writer.writeString(offsets[1], object.tipo);
}

PreguntaPojoDb _preguntaPojoDbDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PreguntaPojoDb();
  object.descripcion = reader.readStringOrNull(offsets[0]);
  object.id = id;
  object.tipo = reader.readStringOrNull(offsets[1]);
  return object;
}

P _preguntaPojoDbDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _preguntaPojoDbGetId(PreguntaPojoDb object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _preguntaPojoDbGetLinks(PreguntaPojoDb object) {
  return [object.opcionesDb];
}

void _preguntaPojoDbAttach(
    IsarCollection<dynamic> col, Id id, PreguntaPojoDb object) {
  object.id = id;
  object.opcionesDb
      .attach(col, col.isar.collection<OpcionPojo>(), r'opcionesDb', id);
}

extension PreguntaPojoDbQueryWhereSort
    on QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QWhere> {
  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PreguntaPojoDbQueryWhere
    on QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QWhereClause> {
  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PreguntaPojoDbQueryFilter
    on QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QFilterCondition> {
  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      descripcionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descripcion',
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      descripcionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descripcion',
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      descripcionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      descripcionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      descripcionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      descripcionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descripcion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      descripcionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      descripcionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      descripcionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      descripcionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descripcion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      descripcionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      descripcionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      tipoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tipo',
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      tipoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tipo',
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      tipoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      tipoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      tipoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      tipoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tipo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      tipoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      tipoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      tipoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      tipoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tipo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      tipoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipo',
        value: '',
      ));
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      tipoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipo',
        value: '',
      ));
    });
  }
}

extension PreguntaPojoDbQueryObject
    on QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QFilterCondition> {}

extension PreguntaPojoDbQueryLinks
    on QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QFilterCondition> {
  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      opcionesDb(FilterQuery<OpcionPojo> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'opcionesDb');
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      opcionesDbLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'opcionesDb', length, true, length, true);
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      opcionesDbIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'opcionesDb', 0, true, 0, true);
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      opcionesDbIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'opcionesDb', 0, false, 999999, true);
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      opcionesDbLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'opcionesDb', 0, true, length, include);
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      opcionesDbLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'opcionesDb', length, include, 999999, true);
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
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

extension PreguntaPojoDbQuerySortBy
    on QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QSortBy> {
  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterSortBy>
      sortByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterSortBy>
      sortByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterSortBy> sortByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterSortBy> sortByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }
}

extension PreguntaPojoDbQuerySortThenBy
    on QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QSortThenBy> {
  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterSortBy>
      thenByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterSortBy>
      thenByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterSortBy> thenByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterSortBy> thenByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }
}

extension PreguntaPojoDbQueryWhereDistinct
    on QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QDistinct> {
  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QDistinct> distinctByDescripcion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descripcion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QDistinct> distinctByTipo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipo', caseSensitive: caseSensitive);
    });
  }
}

extension PreguntaPojoDbQueryProperty
    on QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QQueryProperty> {
  QueryBuilder<PreguntaPojoDb, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PreguntaPojoDb, String?, QQueryOperations>
      descripcionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descripcion');
    });
  }

  QueryBuilder<PreguntaPojoDb, String?, QQueryOperations> tipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipo');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetOpcionPojoCollection on Isar {
  IsarCollection<OpcionPojo> get opcionPojos => this.collection();
}

const OpcionPojoSchema = CollectionSchema(
  name: r'OpcionPojo',
  id: 1444958313862985065,
  properties: {
    r'opcion': PropertySchema(
      id: 0,
      name: r'opcion',
      type: IsarType.string,
    )
  },
  estimateSize: _opcionPojoEstimateSize,
  serialize: _opcionPojoSerialize,
  deserialize: _opcionPojoDeserialize,
  deserializeProp: _opcionPojoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _opcionPojoGetId,
  getLinks: _opcionPojoGetLinks,
  attach: _opcionPojoAttach,
  version: '3.0.2',
);

int _opcionPojoEstimateSize(
  OpcionPojo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.opcion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _opcionPojoSerialize(
  OpcionPojo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.opcion);
}

OpcionPojo _opcionPojoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OpcionPojo();
  object.id = id;
  object.opcion = reader.readStringOrNull(offsets[0]);
  return object;
}

P _opcionPojoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _opcionPojoGetId(OpcionPojo object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _opcionPojoGetLinks(OpcionPojo object) {
  return [];
}

void _opcionPojoAttach(IsarCollection<dynamic> col, Id id, OpcionPojo object) {
  object.id = id;
}

extension OpcionPojoQueryWhereSort
    on QueryBuilder<OpcionPojo, OpcionPojo, QWhere> {
  QueryBuilder<OpcionPojo, OpcionPojo, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension OpcionPojoQueryWhere
    on QueryBuilder<OpcionPojo, OpcionPojo, QWhereClause> {
  QueryBuilder<OpcionPojo, OpcionPojo, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension OpcionPojoQueryFilter
    on QueryBuilder<OpcionPojo, OpcionPojo, QFilterCondition> {
  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> opcionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'opcion',
      ));
    });
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition>
      opcionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'opcion',
      ));
    });
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> opcionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> opcionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'opcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> opcionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'opcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> opcionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'opcion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> opcionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'opcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> opcionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'opcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> opcionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'opcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> opcionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'opcion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> opcionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opcion',
        value: '',
      ));
    });
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition>
      opcionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'opcion',
        value: '',
      ));
    });
  }
}

extension OpcionPojoQueryObject
    on QueryBuilder<OpcionPojo, OpcionPojo, QFilterCondition> {}

extension OpcionPojoQueryLinks
    on QueryBuilder<OpcionPojo, OpcionPojo, QFilterCondition> {}

extension OpcionPojoQuerySortBy
    on QueryBuilder<OpcionPojo, OpcionPojo, QSortBy> {
  QueryBuilder<OpcionPojo, OpcionPojo, QAfterSortBy> sortByOpcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opcion', Sort.asc);
    });
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterSortBy> sortByOpcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opcion', Sort.desc);
    });
  }
}

extension OpcionPojoQuerySortThenBy
    on QueryBuilder<OpcionPojo, OpcionPojo, QSortThenBy> {
  QueryBuilder<OpcionPojo, OpcionPojo, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterSortBy> thenByOpcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opcion', Sort.asc);
    });
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterSortBy> thenByOpcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opcion', Sort.desc);
    });
  }
}

extension OpcionPojoQueryWhereDistinct
    on QueryBuilder<OpcionPojo, OpcionPojo, QDistinct> {
  QueryBuilder<OpcionPojo, OpcionPojo, QDistinct> distinctByOpcion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'opcion', caseSensitive: caseSensitive);
    });
  }
}

extension OpcionPojoQueryProperty
    on QueryBuilder<OpcionPojo, OpcionPojo, QQueryProperty> {
  QueryBuilder<OpcionPojo, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OpcionPojo, String?, QQueryOperations> opcionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'opcion');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Evaluacion _$EvaluacionFromJson(Map<String, dynamic> json) => Evaluacion()
  ..id = json['id'] as int?
  ..vehiculo_id =
      (json['vehiculo_id'] as List<dynamic>?)?.map((e) => e as int).toList()
  ..titulo = json['titulo'] as String?
  ..preguntas = (json['preguntas'] as List<dynamic>?)
      ?.map((e) => PreguntaPojo.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$EvaluacionToJson(Evaluacion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehiculo_id': instance.vehiculo_id,
      'titulo': instance.titulo,
      'preguntas': instance.preguntas,
    };

PreguntaPojo _$PreguntaPojoFromJson(Map<String, dynamic> json) => PreguntaPojo()
  ..id = json['id'] as int?
  ..descripcion = json['descripcion'] as String?
  ..tipo = json['tipo'] as String?
  ..opciones = (json['opciones'] as List<dynamic>?)
      ?.map((e) => OpcionPojo.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$PreguntaPojoToJson(PreguntaPojo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'descripcion': instance.descripcion,
      'tipo': instance.tipo,
      'opciones': instance.opciones,
    };

OpcionPojo _$OpcionPojoFromJson(Map<String, dynamic> json) => OpcionPojo()
  ..id = json['id'] as int?
  ..opcion = json['opcion'] as String?;

Map<String, dynamic> _$OpcionPojoToJson(OpcionPojo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'opcion': instance.opcion,
    };
