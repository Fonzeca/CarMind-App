// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_evaluacion.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetLogEvaluacionCollection on Isar {
  IsarCollection<LogEvaluacion> get logEvaluacions => this.collection();
}

const LogEvaluacionSchema = CollectionSchema(
  name: r'LogEvaluacion',
  id: 3652688760974045135,
  properties: {
    r'apellido_usuario': PropertySchema(
      id: 0,
      name: r'apellido_usuario',
      type: IsarType.string,
    ),
    r'evaluacion_id': PropertySchema(
      id: 1,
      name: r'evaluacion_id',
      type: IsarType.long,
    ),
    r'fecha': PropertySchema(
      id: 2,
      name: r'fecha',
      type: IsarType.string,
    ),
    r'nombre_evaluacion': PropertySchema(
      id: 3,
      name: r'nombre_evaluacion',
      type: IsarType.string,
    ),
    r'nombre_usuario': PropertySchema(
      id: 4,
      name: r'nombre_usuario',
      type: IsarType.string,
    ),
    r'nombre_vehiculo': PropertySchema(
      id: 5,
      name: r'nombre_vehiculo',
      type: IsarType.string,
    ),
    r'usuario_id': PropertySchema(
      id: 6,
      name: r'usuario_id',
      type: IsarType.long,
    ),
    r'vehiculo_id': PropertySchema(
      id: 7,
      name: r'vehiculo_id',
      type: IsarType.long,
    )
  },
  estimateSize: _logEvaluacionEstimateSize,
  serialize: _logEvaluacionSerialize,
  deserialize: _logEvaluacionDeserialize,
  deserializeProp: _logEvaluacionDeserializeProp,
  idName: r'log_id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _logEvaluacionGetId,
  getLinks: _logEvaluacionGetLinks,
  attach: _logEvaluacionAttach,
  version: '3.0.2',
);

int _logEvaluacionEstimateSize(
  LogEvaluacion object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.apellido_usuario;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fecha;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nombre_evaluacion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nombre_usuario;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nombre_vehiculo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _logEvaluacionSerialize(
  LogEvaluacion object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.apellido_usuario);
  writer.writeLong(offsets[1], object.evaluacion_id);
  writer.writeString(offsets[2], object.fecha);
  writer.writeString(offsets[3], object.nombre_evaluacion);
  writer.writeString(offsets[4], object.nombre_usuario);
  writer.writeString(offsets[5], object.nombre_vehiculo);
  writer.writeLong(offsets[6], object.usuario_id);
  writer.writeLong(offsets[7], object.vehiculo_id);
}

LogEvaluacion _logEvaluacionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LogEvaluacion();
  object.apellido_usuario = reader.readStringOrNull(offsets[0]);
  object.evaluacion_id = reader.readLongOrNull(offsets[1]);
  object.fecha = reader.readStringOrNull(offsets[2]);
  object.log_id = id;
  object.nombre_evaluacion = reader.readStringOrNull(offsets[3]);
  object.nombre_usuario = reader.readStringOrNull(offsets[4]);
  object.nombre_vehiculo = reader.readStringOrNull(offsets[5]);
  object.usuario_id = reader.readLongOrNull(offsets[6]);
  object.vehiculo_id = reader.readLongOrNull(offsets[7]);
  return object;
}

P _logEvaluacionDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _logEvaluacionGetId(LogEvaluacion object) {
  return object.log_id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _logEvaluacionGetLinks(LogEvaluacion object) {
  return [];
}

void _logEvaluacionAttach(
    IsarCollection<dynamic> col, Id id, LogEvaluacion object) {
  object.log_id = id;
}

extension LogEvaluacionQueryWhereSort
    on QueryBuilder<LogEvaluacion, LogEvaluacion, QWhere> {
  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterWhere> anyLog_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LogEvaluacionQueryWhere
    on QueryBuilder<LogEvaluacion, LogEvaluacion, QWhereClause> {
  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterWhereClause> log_idEqualTo(
      Id log_id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: log_id,
        upper: log_id,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterWhereClause>
      log_idNotEqualTo(Id log_id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: log_id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: log_id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: log_id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: log_id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterWhereClause>
      log_idGreaterThan(Id log_id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: log_id, includeLower: include),
      );
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterWhereClause> log_idLessThan(
      Id log_id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: log_id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterWhereClause> log_idBetween(
    Id lowerLog_id,
    Id upperLog_id, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerLog_id,
        includeLower: includeLower,
        upper: upperLog_id,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LogEvaluacionQueryFilter
    on QueryBuilder<LogEvaluacion, LogEvaluacion, QFilterCondition> {
  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      apellido_usuarioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'apellido_usuario',
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      apellido_usuarioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'apellido_usuario',
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      apellido_usuarioEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apellido_usuario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      apellido_usuarioGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'apellido_usuario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      apellido_usuarioLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'apellido_usuario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      apellido_usuarioBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'apellido_usuario',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      apellido_usuarioStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'apellido_usuario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      apellido_usuarioEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'apellido_usuario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      apellido_usuarioContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'apellido_usuario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      apellido_usuarioMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'apellido_usuario',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      apellido_usuarioIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apellido_usuario',
        value: '',
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      apellido_usuarioIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'apellido_usuario',
        value: '',
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      evaluacion_idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'evaluacion_id',
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      evaluacion_idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'evaluacion_id',
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      evaluacion_idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'evaluacion_id',
        value: value,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      evaluacion_idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'evaluacion_id',
        value: value,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      evaluacion_idLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'evaluacion_id',
        value: value,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      evaluacion_idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'evaluacion_id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      fechaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fecha',
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      fechaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fecha',
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      fechaEqualTo(
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

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      fechaGreaterThan(
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

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      fechaLessThan(
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

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      fechaBetween(
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

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      fechaStartsWith(
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

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      fechaEndsWith(
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

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      fechaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fecha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      fechaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fecha',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      fechaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fecha',
        value: '',
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      fechaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fecha',
        value: '',
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      log_idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'log_id',
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      log_idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'log_id',
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      log_idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'log_id',
        value: value,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      log_idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'log_id',
        value: value,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      log_idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'log_id',
        value: value,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      log_idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'log_id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_evaluacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nombre_evaluacion',
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_evaluacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nombre_evaluacion',
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_evaluacionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre_evaluacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_evaluacionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombre_evaluacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_evaluacionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombre_evaluacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_evaluacionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombre_evaluacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_evaluacionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombre_evaluacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_evaluacionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombre_evaluacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_evaluacionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombre_evaluacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_evaluacionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombre_evaluacion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_evaluacionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre_evaluacion',
        value: '',
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_evaluacionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre_evaluacion',
        value: '',
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_usuarioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nombre_usuario',
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_usuarioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nombre_usuario',
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_usuarioEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre_usuario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_usuarioGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombre_usuario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_usuarioLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombre_usuario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_usuarioBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombre_usuario',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_usuarioStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombre_usuario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_usuarioEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombre_usuario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_usuarioContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombre_usuario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_usuarioMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombre_usuario',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_usuarioIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre_usuario',
        value: '',
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_usuarioIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre_usuario',
        value: '',
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_vehiculoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nombre_vehiculo',
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_vehiculoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nombre_vehiculo',
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_vehiculoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre_vehiculo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_vehiculoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombre_vehiculo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_vehiculoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombre_vehiculo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_vehiculoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombre_vehiculo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_vehiculoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombre_vehiculo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_vehiculoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombre_vehiculo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_vehiculoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombre_vehiculo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_vehiculoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombre_vehiculo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_vehiculoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre_vehiculo',
        value: '',
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_vehiculoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre_vehiculo',
        value: '',
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      usuario_idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'usuario_id',
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      usuario_idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'usuario_id',
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      usuario_idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usuario_id',
        value: value,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      usuario_idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usuario_id',
        value: value,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      usuario_idLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usuario_id',
        value: value,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      usuario_idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usuario_id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      vehiculo_idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vehiculo_id',
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      vehiculo_idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vehiculo_id',
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      vehiculo_idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehiculo_id',
        value: value,
      ));
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      vehiculo_idGreaterThan(
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

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      vehiculo_idLessThan(
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

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      vehiculo_idBetween(
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

extension LogEvaluacionQueryObject
    on QueryBuilder<LogEvaluacion, LogEvaluacion, QFilterCondition> {}

extension LogEvaluacionQueryLinks
    on QueryBuilder<LogEvaluacion, LogEvaluacion, QFilterCondition> {}

extension LogEvaluacionQuerySortBy
    on QueryBuilder<LogEvaluacion, LogEvaluacion, QSortBy> {
  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      sortByApellido_usuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apellido_usuario', Sort.asc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      sortByApellido_usuarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apellido_usuario', Sort.desc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      sortByEvaluacion_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'evaluacion_id', Sort.asc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      sortByEvaluacion_idDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'evaluacion_id', Sort.desc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy> sortByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy> sortByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      sortByNombre_evaluacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre_evaluacion', Sort.asc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      sortByNombre_evaluacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre_evaluacion', Sort.desc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      sortByNombre_usuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre_usuario', Sort.asc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      sortByNombre_usuarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre_usuario', Sort.desc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      sortByNombre_vehiculo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre_vehiculo', Sort.asc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      sortByNombre_vehiculoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre_vehiculo', Sort.desc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy> sortByUsuario_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuario_id', Sort.asc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      sortByUsuario_idDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuario_id', Sort.desc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy> sortByVehiculo_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehiculo_id', Sort.asc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      sortByVehiculo_idDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehiculo_id', Sort.desc);
    });
  }
}

extension LogEvaluacionQuerySortThenBy
    on QueryBuilder<LogEvaluacion, LogEvaluacion, QSortThenBy> {
  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      thenByApellido_usuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apellido_usuario', Sort.asc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      thenByApellido_usuarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apellido_usuario', Sort.desc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      thenByEvaluacion_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'evaluacion_id', Sort.asc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      thenByEvaluacion_idDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'evaluacion_id', Sort.desc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy> thenByFecha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.asc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy> thenByFechaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fecha', Sort.desc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy> thenByLog_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'log_id', Sort.asc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy> thenByLog_idDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'log_id', Sort.desc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      thenByNombre_evaluacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre_evaluacion', Sort.asc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      thenByNombre_evaluacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre_evaluacion', Sort.desc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      thenByNombre_usuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre_usuario', Sort.asc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      thenByNombre_usuarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre_usuario', Sort.desc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      thenByNombre_vehiculo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre_vehiculo', Sort.asc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      thenByNombre_vehiculoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre_vehiculo', Sort.desc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy> thenByUsuario_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuario_id', Sort.asc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      thenByUsuario_idDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuario_id', Sort.desc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy> thenByVehiculo_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehiculo_id', Sort.asc);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      thenByVehiculo_idDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehiculo_id', Sort.desc);
    });
  }
}

extension LogEvaluacionQueryWhereDistinct
    on QueryBuilder<LogEvaluacion, LogEvaluacion, QDistinct> {
  QueryBuilder<LogEvaluacion, LogEvaluacion, QDistinct>
      distinctByApellido_usuario({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'apellido_usuario',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QDistinct>
      distinctByEvaluacion_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'evaluacion_id');
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QDistinct> distinctByFecha(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fecha', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QDistinct>
      distinctByNombre_evaluacion({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre_evaluacion',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QDistinct>
      distinctByNombre_usuario({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre_usuario',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QDistinct>
      distinctByNombre_vehiculo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre_vehiculo',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QDistinct> distinctByUsuario_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usuario_id');
    });
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QDistinct>
      distinctByVehiculo_id() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehiculo_id');
    });
  }
}

extension LogEvaluacionQueryProperty
    on QueryBuilder<LogEvaluacion, LogEvaluacion, QQueryProperty> {
  QueryBuilder<LogEvaluacion, int, QQueryOperations> log_idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'log_id');
    });
  }

  QueryBuilder<LogEvaluacion, String?, QQueryOperations>
      apellido_usuarioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'apellido_usuario');
    });
  }

  QueryBuilder<LogEvaluacion, int?, QQueryOperations> evaluacion_idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'evaluacion_id');
    });
  }

  QueryBuilder<LogEvaluacion, String?, QQueryOperations> fechaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fecha');
    });
  }

  QueryBuilder<LogEvaluacion, String?, QQueryOperations>
      nombre_evaluacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre_evaluacion');
    });
  }

  QueryBuilder<LogEvaluacion, String?, QQueryOperations>
      nombre_usuarioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre_usuario');
    });
  }

  QueryBuilder<LogEvaluacion, String?, QQueryOperations>
      nombre_vehiculoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre_vehiculo');
    });
  }

  QueryBuilder<LogEvaluacion, int?, QQueryOperations> usuario_idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usuario_id');
    });
  }

  QueryBuilder<LogEvaluacion, int?, QQueryOperations> vehiculo_idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehiculo_id');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogEvaluacion _$LogEvaluacionFromJson(Map<String, dynamic> json) =>
    LogEvaluacion()
      ..log_id = json['log_id'] as int?
      ..evaluacion_id = json['evaluacion_id'] as int?
      ..nombre_evaluacion = json['nombre_evaluacion'] as String?
      ..fecha = json['fecha'] as String?
      ..vehiculo_id = json['vehiculo_id'] as int?
      ..nombre_vehiculo = json['nombre_vehiculo'] as String?
      ..usuario_id = json['usuario_id'] as int?
      ..nombre_usuario = json['nombre_usuario'] as String?
      ..apellido_usuario = json['apellido_usuario'] as String?;

Map<String, dynamic> _$LogEvaluacionToJson(LogEvaluacion instance) =>
    <String, dynamic>{
      'log_id': instance.log_id,
      'evaluacion_id': instance.evaluacion_id,
      'nombre_evaluacion': instance.nombre_evaluacion,
      'fecha': instance.fecha,
      'vehiculo_id': instance.vehiculo_id,
      'nombre_vehiculo': instance.nombre_vehiculo,
      'usuario_id': instance.usuario_id,
      'nombre_usuario': instance.nombre_usuario,
      'apellido_usuario': instance.apellido_usuario,
    };
