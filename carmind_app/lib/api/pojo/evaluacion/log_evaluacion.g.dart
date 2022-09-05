// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_evaluacion.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetLogEvaluacionCollection on Isar {
  IsarCollection<LogEvaluacion> get logEvaluacions => getCollection();
}

const LogEvaluacionSchema = CollectionSchema(
  name: 'LogEvaluacion',
  schema:
      '{"name":"LogEvaluacion","idName":"log_id","properties":[{"name":"apellido_usuario","type":"String"},{"name":"evaluacion_id","type":"Long"},{"name":"fecha","type":"String"},{"name":"nombre_evaluacion","type":"String"},{"name":"nombre_usuario","type":"String"},{"name":"nombre_vehiculo","type":"String"},{"name":"usuario_id","type":"Long"},{"name":"vehiculo_id","type":"Long"}],"indexes":[],"links":[]}',
  idName: 'log_id',
  propertyIds: {
    'apellido_usuario': 0,
    'evaluacion_id': 1,
    'fecha': 2,
    'nombre_evaluacion': 3,
    'nombre_usuario': 4,
    'nombre_vehiculo': 5,
    'usuario_id': 6,
    'vehiculo_id': 7
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _logEvaluacionGetId,
  setId: _logEvaluacionSetId,
  getLinks: _logEvaluacionGetLinks,
  attachLinks: _logEvaluacionAttachLinks,
  serializeNative: _logEvaluacionSerializeNative,
  deserializeNative: _logEvaluacionDeserializeNative,
  deserializePropNative: _logEvaluacionDeserializePropNative,
  serializeWeb: _logEvaluacionSerializeWeb,
  deserializeWeb: _logEvaluacionDeserializeWeb,
  deserializePropWeb: _logEvaluacionDeserializePropWeb,
  version: 3,
);

int? _logEvaluacionGetId(LogEvaluacion object) {
  if (object.log_id == Isar.autoIncrement) {
    return null;
  } else {
    return object.log_id;
  }
}

void _logEvaluacionSetId(LogEvaluacion object, int id) {
  object.log_id = id;
}

List<IsarLinkBase> _logEvaluacionGetLinks(LogEvaluacion object) {
  return [];
}

void _logEvaluacionSerializeNative(
    IsarCollection<LogEvaluacion> collection,
    IsarRawObject rawObj,
    LogEvaluacion object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.apellido_usuario;
  IsarUint8List? _apellido_usuario;
  if (value0 != null) {
    _apellido_usuario = IsarBinaryWriter.utf8Encoder.convert(value0);
  }
  dynamicSize += (_apellido_usuario?.length ?? 0) as int;
  final value1 = object.evaluacion_id;
  final _evaluacion_id = value1;
  final value2 = object.fecha;
  IsarUint8List? _fecha;
  if (value2 != null) {
    _fecha = IsarBinaryWriter.utf8Encoder.convert(value2);
  }
  dynamicSize += (_fecha?.length ?? 0) as int;
  final value3 = object.nombre_evaluacion;
  IsarUint8List? _nombre_evaluacion;
  if (value3 != null) {
    _nombre_evaluacion = IsarBinaryWriter.utf8Encoder.convert(value3);
  }
  dynamicSize += (_nombre_evaluacion?.length ?? 0) as int;
  final value4 = object.nombre_usuario;
  IsarUint8List? _nombre_usuario;
  if (value4 != null) {
    _nombre_usuario = IsarBinaryWriter.utf8Encoder.convert(value4);
  }
  dynamicSize += (_nombre_usuario?.length ?? 0) as int;
  final value5 = object.nombre_vehiculo;
  IsarUint8List? _nombre_vehiculo;
  if (value5 != null) {
    _nombre_vehiculo = IsarBinaryWriter.utf8Encoder.convert(value5);
  }
  dynamicSize += (_nombre_vehiculo?.length ?? 0) as int;
  final value6 = object.usuario_id;
  final _usuario_id = value6;
  final value7 = object.vehiculo_id;
  final _vehiculo_id = value7;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _apellido_usuario);
  writer.writeLong(offsets[1], _evaluacion_id);
  writer.writeBytes(offsets[2], _fecha);
  writer.writeBytes(offsets[3], _nombre_evaluacion);
  writer.writeBytes(offsets[4], _nombre_usuario);
  writer.writeBytes(offsets[5], _nombre_vehiculo);
  writer.writeLong(offsets[6], _usuario_id);
  writer.writeLong(offsets[7], _vehiculo_id);
}

LogEvaluacion _logEvaluacionDeserializeNative(
    IsarCollection<LogEvaluacion> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
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

P _logEvaluacionDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
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
      throw 'Illegal propertyIndex';
  }
}

dynamic _logEvaluacionSerializeWeb(
    IsarCollection<LogEvaluacion> collection, LogEvaluacion object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'apellido_usuario', object.apellido_usuario);
  IsarNative.jsObjectSet(jsObj, 'evaluacion_id', object.evaluacion_id);
  IsarNative.jsObjectSet(jsObj, 'fecha', object.fecha);
  IsarNative.jsObjectSet(jsObj, 'log_id', object.log_id);
  IsarNative.jsObjectSet(jsObj, 'nombre_evaluacion', object.nombre_evaluacion);
  IsarNative.jsObjectSet(jsObj, 'nombre_usuario', object.nombre_usuario);
  IsarNative.jsObjectSet(jsObj, 'nombre_vehiculo', object.nombre_vehiculo);
  IsarNative.jsObjectSet(jsObj, 'usuario_id', object.usuario_id);
  IsarNative.jsObjectSet(jsObj, 'vehiculo_id', object.vehiculo_id);
  return jsObj;
}

LogEvaluacion _logEvaluacionDeserializeWeb(
    IsarCollection<LogEvaluacion> collection, dynamic jsObj) {
  final object = LogEvaluacion();
  object.apellido_usuario = IsarNative.jsObjectGet(jsObj, 'apellido_usuario');
  object.evaluacion_id = IsarNative.jsObjectGet(jsObj, 'evaluacion_id');
  object.fecha = IsarNative.jsObjectGet(jsObj, 'fecha');
  object.log_id = IsarNative.jsObjectGet(jsObj, 'log_id');
  object.nombre_evaluacion = IsarNative.jsObjectGet(jsObj, 'nombre_evaluacion');
  object.nombre_usuario = IsarNative.jsObjectGet(jsObj, 'nombre_usuario');
  object.nombre_vehiculo = IsarNative.jsObjectGet(jsObj, 'nombre_vehiculo');
  object.usuario_id = IsarNative.jsObjectGet(jsObj, 'usuario_id');
  object.vehiculo_id = IsarNative.jsObjectGet(jsObj, 'vehiculo_id');
  return object;
}

P _logEvaluacionDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'apellido_usuario':
      return (IsarNative.jsObjectGet(jsObj, 'apellido_usuario')) as P;
    case 'evaluacion_id':
      return (IsarNative.jsObjectGet(jsObj, 'evaluacion_id')) as P;
    case 'fecha':
      return (IsarNative.jsObjectGet(jsObj, 'fecha')) as P;
    case 'log_id':
      return (IsarNative.jsObjectGet(jsObj, 'log_id')) as P;
    case 'nombre_evaluacion':
      return (IsarNative.jsObjectGet(jsObj, 'nombre_evaluacion')) as P;
    case 'nombre_usuario':
      return (IsarNative.jsObjectGet(jsObj, 'nombre_usuario')) as P;
    case 'nombre_vehiculo':
      return (IsarNative.jsObjectGet(jsObj, 'nombre_vehiculo')) as P;
    case 'usuario_id':
      return (IsarNative.jsObjectGet(jsObj, 'usuario_id')) as P;
    case 'vehiculo_id':
      return (IsarNative.jsObjectGet(jsObj, 'vehiculo_id')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _logEvaluacionAttachLinks(
    IsarCollection col, int id, LogEvaluacion object) {}

extension LogEvaluacionQueryWhereSort
    on QueryBuilder<LogEvaluacion, LogEvaluacion, QWhere> {
  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterWhere> anyLog_id() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension LogEvaluacionQueryWhere
    on QueryBuilder<LogEvaluacion, LogEvaluacion, QWhereClause> {
  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterWhereClause> log_idEqualTo(
      int log_id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: log_id,
      includeLower: true,
      upper: log_id,
      includeUpper: true,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterWhereClause>
      log_idNotEqualTo(int log_id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: log_id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: log_id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: log_id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: log_id, includeUpper: false),
      );
    }
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterWhereClause>
      log_idGreaterThan(int log_id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: log_id, includeLower: include),
    );
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterWhereClause> log_idLessThan(
      int log_id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: log_id, includeUpper: include),
    );
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterWhereClause> log_idBetween(
    int lowerLog_id,
    int upperLog_id, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerLog_id,
      includeLower: includeLower,
      upper: upperLog_id,
      includeUpper: includeUpper,
    ));
  }
}

extension LogEvaluacionQueryFilter
    on QueryBuilder<LogEvaluacion, LogEvaluacion, QFilterCondition> {
  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      apellido_usuarioIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'apellido_usuario',
      value: null,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      apellido_usuarioEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'apellido_usuario',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      apellido_usuarioGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'apellido_usuario',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      apellido_usuarioLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'apellido_usuario',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      apellido_usuarioBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'apellido_usuario',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      apellido_usuarioStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'apellido_usuario',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      apellido_usuarioEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'apellido_usuario',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      apellido_usuarioContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'apellido_usuario',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      apellido_usuarioMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'apellido_usuario',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      evaluacion_idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'evaluacion_id',
      value: null,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      evaluacion_idEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'evaluacion_id',
      value: value,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      evaluacion_idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'evaluacion_id',
      value: value,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      evaluacion_idLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'evaluacion_id',
      value: value,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      evaluacion_idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'evaluacion_id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      fechaIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'fecha',
      value: null,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      fechaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'fecha',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      fechaGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'fecha',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      fechaLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'fecha',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      fechaBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'fecha',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      fechaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'fecha',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      fechaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'fecha',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      fechaContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'fecha',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      fechaMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'fecha',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      log_idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'log_id',
      value: null,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      log_idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'log_id',
      value: value,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      log_idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'log_id',
      value: value,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      log_idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'log_id',
      value: value,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      log_idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'log_id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_evaluacionIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'nombre_evaluacion',
      value: null,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_evaluacionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'nombre_evaluacion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_evaluacionGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'nombre_evaluacion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_evaluacionLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'nombre_evaluacion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_evaluacionBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'nombre_evaluacion',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_evaluacionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'nombre_evaluacion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_evaluacionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'nombre_evaluacion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_evaluacionContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'nombre_evaluacion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_evaluacionMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'nombre_evaluacion',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_usuarioIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'nombre_usuario',
      value: null,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_usuarioEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'nombre_usuario',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_usuarioGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'nombre_usuario',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_usuarioLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'nombre_usuario',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_usuarioBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'nombre_usuario',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_usuarioStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'nombre_usuario',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_usuarioEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'nombre_usuario',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_usuarioContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'nombre_usuario',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_usuarioMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'nombre_usuario',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_vehiculoIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'nombre_vehiculo',
      value: null,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_vehiculoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'nombre_vehiculo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_vehiculoGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'nombre_vehiculo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_vehiculoLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'nombre_vehiculo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_vehiculoBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'nombre_vehiculo',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_vehiculoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'nombre_vehiculo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_vehiculoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'nombre_vehiculo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_vehiculoContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'nombre_vehiculo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      nombre_vehiculoMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'nombre_vehiculo',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      usuario_idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'usuario_id',
      value: null,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      usuario_idEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'usuario_id',
      value: value,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      usuario_idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'usuario_id',
      value: value,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      usuario_idLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'usuario_id',
      value: value,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      usuario_idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'usuario_id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      vehiculo_idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'vehiculo_id',
      value: null,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      vehiculo_idEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'vehiculo_id',
      value: value,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      vehiculo_idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'vehiculo_id',
      value: value,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      vehiculo_idLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'vehiculo_id',
      value: value,
    ));
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterFilterCondition>
      vehiculo_idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'vehiculo_id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension LogEvaluacionQueryLinks
    on QueryBuilder<LogEvaluacion, LogEvaluacion, QFilterCondition> {}

extension LogEvaluacionQueryWhereSortBy
    on QueryBuilder<LogEvaluacion, LogEvaluacion, QSortBy> {
  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      sortByApellido_usuario() {
    return addSortByInternal('apellido_usuario', Sort.asc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      sortByApellido_usuarioDesc() {
    return addSortByInternal('apellido_usuario', Sort.desc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      sortByEvaluacion_id() {
    return addSortByInternal('evaluacion_id', Sort.asc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      sortByEvaluacion_idDesc() {
    return addSortByInternal('evaluacion_id', Sort.desc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy> sortByFecha() {
    return addSortByInternal('fecha', Sort.asc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy> sortByFechaDesc() {
    return addSortByInternal('fecha', Sort.desc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy> sortByLog_id() {
    return addSortByInternal('log_id', Sort.asc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy> sortByLog_idDesc() {
    return addSortByInternal('log_id', Sort.desc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      sortByNombre_evaluacion() {
    return addSortByInternal('nombre_evaluacion', Sort.asc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      sortByNombre_evaluacionDesc() {
    return addSortByInternal('nombre_evaluacion', Sort.desc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      sortByNombre_usuario() {
    return addSortByInternal('nombre_usuario', Sort.asc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      sortByNombre_usuarioDesc() {
    return addSortByInternal('nombre_usuario', Sort.desc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      sortByNombre_vehiculo() {
    return addSortByInternal('nombre_vehiculo', Sort.asc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      sortByNombre_vehiculoDesc() {
    return addSortByInternal('nombre_vehiculo', Sort.desc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy> sortByUsuario_id() {
    return addSortByInternal('usuario_id', Sort.asc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      sortByUsuario_idDesc() {
    return addSortByInternal('usuario_id', Sort.desc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy> sortByVehiculo_id() {
    return addSortByInternal('vehiculo_id', Sort.asc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      sortByVehiculo_idDesc() {
    return addSortByInternal('vehiculo_id', Sort.desc);
  }
}

extension LogEvaluacionQueryWhereSortThenBy
    on QueryBuilder<LogEvaluacion, LogEvaluacion, QSortThenBy> {
  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      thenByApellido_usuario() {
    return addSortByInternal('apellido_usuario', Sort.asc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      thenByApellido_usuarioDesc() {
    return addSortByInternal('apellido_usuario', Sort.desc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      thenByEvaluacion_id() {
    return addSortByInternal('evaluacion_id', Sort.asc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      thenByEvaluacion_idDesc() {
    return addSortByInternal('evaluacion_id', Sort.desc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy> thenByFecha() {
    return addSortByInternal('fecha', Sort.asc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy> thenByFechaDesc() {
    return addSortByInternal('fecha', Sort.desc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy> thenByLog_id() {
    return addSortByInternal('log_id', Sort.asc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy> thenByLog_idDesc() {
    return addSortByInternal('log_id', Sort.desc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      thenByNombre_evaluacion() {
    return addSortByInternal('nombre_evaluacion', Sort.asc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      thenByNombre_evaluacionDesc() {
    return addSortByInternal('nombre_evaluacion', Sort.desc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      thenByNombre_usuario() {
    return addSortByInternal('nombre_usuario', Sort.asc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      thenByNombre_usuarioDesc() {
    return addSortByInternal('nombre_usuario', Sort.desc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      thenByNombre_vehiculo() {
    return addSortByInternal('nombre_vehiculo', Sort.asc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      thenByNombre_vehiculoDesc() {
    return addSortByInternal('nombre_vehiculo', Sort.desc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy> thenByUsuario_id() {
    return addSortByInternal('usuario_id', Sort.asc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      thenByUsuario_idDesc() {
    return addSortByInternal('usuario_id', Sort.desc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy> thenByVehiculo_id() {
    return addSortByInternal('vehiculo_id', Sort.asc);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QAfterSortBy>
      thenByVehiculo_idDesc() {
    return addSortByInternal('vehiculo_id', Sort.desc);
  }
}

extension LogEvaluacionQueryWhereDistinct
    on QueryBuilder<LogEvaluacion, LogEvaluacion, QDistinct> {
  QueryBuilder<LogEvaluacion, LogEvaluacion, QDistinct>
      distinctByApellido_usuario({bool caseSensitive = true}) {
    return addDistinctByInternal('apellido_usuario',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QDistinct>
      distinctByEvaluacion_id() {
    return addDistinctByInternal('evaluacion_id');
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QDistinct> distinctByFecha(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('fecha', caseSensitive: caseSensitive);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QDistinct> distinctByLog_id() {
    return addDistinctByInternal('log_id');
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QDistinct>
      distinctByNombre_evaluacion({bool caseSensitive = true}) {
    return addDistinctByInternal('nombre_evaluacion',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QDistinct>
      distinctByNombre_usuario({bool caseSensitive = true}) {
    return addDistinctByInternal('nombre_usuario',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QDistinct>
      distinctByNombre_vehiculo({bool caseSensitive = true}) {
    return addDistinctByInternal('nombre_vehiculo',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QDistinct> distinctByUsuario_id() {
    return addDistinctByInternal('usuario_id');
  }

  QueryBuilder<LogEvaluacion, LogEvaluacion, QDistinct>
      distinctByVehiculo_id() {
    return addDistinctByInternal('vehiculo_id');
  }
}

extension LogEvaluacionQueryProperty
    on QueryBuilder<LogEvaluacion, LogEvaluacion, QQueryProperty> {
  QueryBuilder<LogEvaluacion, String?, QQueryOperations>
      apellido_usuarioProperty() {
    return addPropertyNameInternal('apellido_usuario');
  }

  QueryBuilder<LogEvaluacion, int?, QQueryOperations> evaluacion_idProperty() {
    return addPropertyNameInternal('evaluacion_id');
  }

  QueryBuilder<LogEvaluacion, String?, QQueryOperations> fechaProperty() {
    return addPropertyNameInternal('fecha');
  }

  QueryBuilder<LogEvaluacion, int?, QQueryOperations> log_idProperty() {
    return addPropertyNameInternal('log_id');
  }

  QueryBuilder<LogEvaluacion, String?, QQueryOperations>
      nombre_evaluacionProperty() {
    return addPropertyNameInternal('nombre_evaluacion');
  }

  QueryBuilder<LogEvaluacion, String?, QQueryOperations>
      nombre_usuarioProperty() {
    return addPropertyNameInternal('nombre_usuario');
  }

  QueryBuilder<LogEvaluacion, String?, QQueryOperations>
      nombre_vehiculoProperty() {
    return addPropertyNameInternal('nombre_vehiculo');
  }

  QueryBuilder<LogEvaluacion, int?, QQueryOperations> usuario_idProperty() {
    return addPropertyNameInternal('usuario_id');
  }

  QueryBuilder<LogEvaluacion, int?, QQueryOperations> vehiculo_idProperty() {
    return addPropertyNameInternal('vehiculo_id');
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
