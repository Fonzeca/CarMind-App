// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_evaluacion_terminada.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetLogEvaluacionTerminadaPojoDbCollection on Isar {
  IsarCollection<LogEvaluacionTerminadaPojoDb>
      get logEvaluacionTerminadaPojoDbs => getCollection();
}

const LogEvaluacionTerminadaPojoDbSchema = CollectionSchema(
  name: 'LogEvaluacionTerminadaPojoDb',
  schema:
      '{"name":"LogEvaluacionTerminadaPojoDb","idName":"privateId","properties":[{"name":"evaluacionId","type":"Long"},{"name":"fecha","type":"String"}],"indexes":[],"links":[{"name":"respuestaDb","target":"EvaluacionTerminadaPojoDb"}]}',
  idName: 'privateId',
  propertyIds: {'evaluacionId': 0, 'fecha': 1},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {'respuestaDb': 0},
  backlinkLinkNames: {},
  getId: _logEvaluacionTerminadaPojoDbGetId,
  setId: _logEvaluacionTerminadaPojoDbSetId,
  getLinks: _logEvaluacionTerminadaPojoDbGetLinks,
  attachLinks: _logEvaluacionTerminadaPojoDbAttachLinks,
  serializeNative: _logEvaluacionTerminadaPojoDbSerializeNative,
  deserializeNative: _logEvaluacionTerminadaPojoDbDeserializeNative,
  deserializePropNative: _logEvaluacionTerminadaPojoDbDeserializePropNative,
  serializeWeb: _logEvaluacionTerminadaPojoDbSerializeWeb,
  deserializeWeb: _logEvaluacionTerminadaPojoDbDeserializeWeb,
  deserializePropWeb: _logEvaluacionTerminadaPojoDbDeserializePropWeb,
  version: 3,
);

int? _logEvaluacionTerminadaPojoDbGetId(LogEvaluacionTerminadaPojoDb object) {
  if (object.privateId == Isar.autoIncrement) {
    return null;
  } else {
    return object.privateId;
  }
}

void _logEvaluacionTerminadaPojoDbSetId(
    LogEvaluacionTerminadaPojoDb object, int id) {
  object.privateId = id;
}

List<IsarLinkBase> _logEvaluacionTerminadaPojoDbGetLinks(
    LogEvaluacionTerminadaPojoDb object) {
  return [object.respuestaDb];
}

void _logEvaluacionTerminadaPojoDbSerializeNative(
    IsarCollection<LogEvaluacionTerminadaPojoDb> collection,
    IsarRawObject rawObj,
    LogEvaluacionTerminadaPojoDb object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.evaluacionId;
  final _evaluacionId = value0;
  final value1 = object.fecha;
  IsarUint8List? _fecha;
  if (value1 != null) {
    _fecha = IsarBinaryWriter.utf8Encoder.convert(value1);
  }
  dynamicSize += (_fecha?.length ?? 0) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeLong(offsets[0], _evaluacionId);
  writer.writeBytes(offsets[1], _fecha);
}

LogEvaluacionTerminadaPojoDb _logEvaluacionTerminadaPojoDbDeserializeNative(
    IsarCollection<LogEvaluacionTerminadaPojoDb> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = LogEvaluacionTerminadaPojoDb();
  object.evaluacionId = reader.readLongOrNull(offsets[0]);
  object.fecha = reader.readStringOrNull(offsets[1]);
  object.privateId = id;
  _logEvaluacionTerminadaPojoDbAttachLinks(collection, id, object);
  return object;
}

P _logEvaluacionTerminadaPojoDbDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _logEvaluacionTerminadaPojoDbSerializeWeb(
    IsarCollection<LogEvaluacionTerminadaPojoDb> collection,
    LogEvaluacionTerminadaPojoDb object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'evaluacionId', object.evaluacionId);
  IsarNative.jsObjectSet(jsObj, 'fecha', object.fecha);
  IsarNative.jsObjectSet(jsObj, 'privateId', object.privateId);
  return jsObj;
}

LogEvaluacionTerminadaPojoDb _logEvaluacionTerminadaPojoDbDeserializeWeb(
    IsarCollection<LogEvaluacionTerminadaPojoDb> collection, dynamic jsObj) {
  final object = LogEvaluacionTerminadaPojoDb();
  object.evaluacionId = IsarNative.jsObjectGet(jsObj, 'evaluacionId');
  object.fecha = IsarNative.jsObjectGet(jsObj, 'fecha');
  object.privateId = IsarNative.jsObjectGet(jsObj, 'privateId');
  _logEvaluacionTerminadaPojoDbAttachLinks(
      collection, IsarNative.jsObjectGet(jsObj, 'privateId'), object);
  return object;
}

P _logEvaluacionTerminadaPojoDbDeserializePropWeb<P>(
    Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'evaluacionId':
      return (IsarNative.jsObjectGet(jsObj, 'evaluacionId')) as P;
    case 'fecha':
      return (IsarNative.jsObjectGet(jsObj, 'fecha')) as P;
    case 'privateId':
      return (IsarNative.jsObjectGet(jsObj, 'privateId')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _logEvaluacionTerminadaPojoDbAttachLinks(
    IsarCollection col, int id, LogEvaluacionTerminadaPojoDb object) {
  object.respuestaDb
      .attach(col, col.isar.evaluacionTerminadaPojoDbs, 'respuestaDb', id);
}

extension LogEvaluacionTerminadaPojoDbQueryWhereSort on QueryBuilder<
    LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb, QWhere> {
  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterWhere> anyPrivateId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension LogEvaluacionTerminadaPojoDbQueryWhere on QueryBuilder<
    LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb, QWhereClause> {
  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterWhereClause> privateIdEqualTo(int privateId) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: privateId,
      includeLower: true,
      upper: privateId,
      includeUpper: true,
    ));
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterWhereClause> privateIdNotEqualTo(int privateId) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: privateId, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: privateId, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: privateId, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: privateId, includeUpper: false),
      );
    }
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
          QAfterWhereClause>
      privateIdGreaterThan(int privateId, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: privateId, includeLower: include),
    );
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
          QAfterWhereClause>
      privateIdLessThan(int privateId, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: privateId, includeUpper: include),
    );
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterWhereClause> privateIdBetween(
    int lowerPrivateId,
    int upperPrivateId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerPrivateId,
      includeLower: includeLower,
      upper: upperPrivateId,
      includeUpper: includeUpper,
    ));
  }
}

extension LogEvaluacionTerminadaPojoDbQueryFilter on QueryBuilder<
    LogEvaluacionTerminadaPojoDb,
    LogEvaluacionTerminadaPojoDb,
    QFilterCondition> {
  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> evaluacionIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'evaluacionId',
      value: null,
    ));
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> evaluacionIdEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'evaluacionId',
      value: value,
    ));
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> evaluacionIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'evaluacionId',
      value: value,
    ));
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> evaluacionIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'evaluacionId',
      value: value,
    ));
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> evaluacionIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'evaluacionId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> fechaIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'fecha',
      value: null,
    ));
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> fechaEqualTo(
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

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> fechaGreaterThan(
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

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> fechaLessThan(
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

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> fechaBetween(
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

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> fechaStartsWith(
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

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> fechaEndsWith(
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

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
          QAfterFilterCondition>
      fechaContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'fecha',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
          QAfterFilterCondition>
      fechaMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'fecha',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> privateIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'privateId',
      value: null,
    ));
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> privateIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'privateId',
      value: value,
    ));
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> privateIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'privateId',
      value: value,
    ));
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> privateIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'privateId',
      value: value,
    ));
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterFilterCondition> privateIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'privateId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension LogEvaluacionTerminadaPojoDbQueryLinks on QueryBuilder<
    LogEvaluacionTerminadaPojoDb,
    LogEvaluacionTerminadaPojoDb,
    QFilterCondition> {
  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
          QAfterFilterCondition>
      respuestaDb(FilterQuery<EvaluacionTerminadaPojoDb> q) {
    return linkInternal(
      isar.evaluacionTerminadaPojoDbs,
      q,
      'respuestaDb',
    );
  }
}

extension LogEvaluacionTerminadaPojoDbQueryWhereSortBy on QueryBuilder<
    LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb, QSortBy> {
  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterSortBy> sortByEvaluacionId() {
    return addSortByInternal('evaluacionId', Sort.asc);
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterSortBy> sortByEvaluacionIdDesc() {
    return addSortByInternal('evaluacionId', Sort.desc);
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterSortBy> sortByFecha() {
    return addSortByInternal('fecha', Sort.asc);
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterSortBy> sortByFechaDesc() {
    return addSortByInternal('fecha', Sort.desc);
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterSortBy> sortByPrivateId() {
    return addSortByInternal('privateId', Sort.asc);
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterSortBy> sortByPrivateIdDesc() {
    return addSortByInternal('privateId', Sort.desc);
  }
}

extension LogEvaluacionTerminadaPojoDbQueryWhereSortThenBy on QueryBuilder<
    LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb, QSortThenBy> {
  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterSortBy> thenByEvaluacionId() {
    return addSortByInternal('evaluacionId', Sort.asc);
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterSortBy> thenByEvaluacionIdDesc() {
    return addSortByInternal('evaluacionId', Sort.desc);
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterSortBy> thenByFecha() {
    return addSortByInternal('fecha', Sort.asc);
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterSortBy> thenByFechaDesc() {
    return addSortByInternal('fecha', Sort.desc);
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterSortBy> thenByPrivateId() {
    return addSortByInternal('privateId', Sort.asc);
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QAfterSortBy> thenByPrivateIdDesc() {
    return addSortByInternal('privateId', Sort.desc);
  }
}

extension LogEvaluacionTerminadaPojoDbQueryWhereDistinct on QueryBuilder<
    LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb, QDistinct> {
  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QDistinct> distinctByEvaluacionId() {
    return addDistinctByInternal('evaluacionId');
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QDistinct> distinctByFecha({bool caseSensitive = true}) {
    return addDistinctByInternal('fecha', caseSensitive: caseSensitive);
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, LogEvaluacionTerminadaPojoDb,
      QDistinct> distinctByPrivateId() {
    return addDistinctByInternal('privateId');
  }
}

extension LogEvaluacionTerminadaPojoDbQueryProperty on QueryBuilder<
    LogEvaluacionTerminadaPojoDb,
    LogEvaluacionTerminadaPojoDb,
    QQueryProperty> {
  QueryBuilder<LogEvaluacionTerminadaPojoDb, int?, QQueryOperations>
      evaluacionIdProperty() {
    return addPropertyNameInternal('evaluacionId');
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, String?, QQueryOperations>
      fechaProperty() {
    return addPropertyNameInternal('fecha');
  }

  QueryBuilder<LogEvaluacionTerminadaPojoDb, int?, QQueryOperations>
      privateIdProperty() {
    return addPropertyNameInternal('privateId');
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
