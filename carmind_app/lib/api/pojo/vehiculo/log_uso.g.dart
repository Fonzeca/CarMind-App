// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_uso.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetLogUsoCollection on Isar {
  IsarCollection<LogUso> get logUsos => getCollection();
}

const LogUsoSchema = CollectionSchema(
  name: 'LogUso',
  schema:
      '{"name":"LogUso","idName":"privateId","properties":[{"name":"enUso","type":"Bool"},{"name":"fecha","type":"String"},{"name":"hashCode","type":"Long"},{"name":"stringify","type":"Bool"},{"name":"vehiculoId","type":"Long"}],"indexes":[],"links":[]}',
  idName: 'privateId',
  propertyIds: {
    'enUso': 0,
    'fecha': 1,
    'hashCode': 2,
    'stringify': 3,
    'vehiculoId': 4
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _logUsoGetId,
  setId: _logUsoSetId,
  getLinks: _logUsoGetLinks,
  attachLinks: _logUsoAttachLinks,
  serializeNative: _logUsoSerializeNative,
  deserializeNative: _logUsoDeserializeNative,
  deserializePropNative: _logUsoDeserializePropNative,
  serializeWeb: _logUsoSerializeWeb,
  deserializeWeb: _logUsoDeserializeWeb,
  deserializePropWeb: _logUsoDeserializePropWeb,
  version: 3,
);

int? _logUsoGetId(LogUso object) {
  if (object.privateId == Isar.autoIncrement) {
    return null;
  } else {
    return object.privateId;
  }
}

void _logUsoSetId(LogUso object, int id) {
  object.privateId = id;
}

List<IsarLinkBase> _logUsoGetLinks(LogUso object) {
  return [];
}

void _logUsoSerializeNative(
    IsarCollection<LogUso> collection,
    IsarRawObject rawObj,
    LogUso object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.enUso;
  final _enUso = value0;
  final value1 = object.fecha;
  IsarUint8List? _fecha;
  if (value1 != null) {
    _fecha = IsarBinaryWriter.utf8Encoder.convert(value1);
  }
  dynamicSize += (_fecha?.length ?? 0) as int;
  final value2 = object.hashCode;
  final _hashCode = value2;
  final value3 = object.stringify;
  final _stringify = value3;
  final value4 = object.vehiculoId;
  final _vehiculoId = value4;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBool(offsets[0], _enUso);
  writer.writeBytes(offsets[1], _fecha);
  writer.writeLong(offsets[2], _hashCode);
  writer.writeBool(offsets[3], _stringify);
  writer.writeLong(offsets[4], _vehiculoId);
}

LogUso _logUsoDeserializeNative(IsarCollection<LogUso> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = LogUso();
  object.enUso = reader.readBoolOrNull(offsets[0]);
  object.fecha = reader.readStringOrNull(offsets[1]);
  object.privateId = id;
  object.vehiculoId = reader.readLongOrNull(offsets[4]);
  return object;
}

P _logUsoDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _logUsoSerializeWeb(IsarCollection<LogUso> collection, LogUso object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'enUso', object.enUso);
  IsarNative.jsObjectSet(jsObj, 'fecha', object.fecha);
  IsarNative.jsObjectSet(jsObj, 'hashCode', object.hashCode);
  IsarNative.jsObjectSet(jsObj, 'privateId', object.privateId);
  IsarNative.jsObjectSet(jsObj, 'stringify', object.stringify);
  IsarNative.jsObjectSet(jsObj, 'vehiculoId', object.vehiculoId);
  return jsObj;
}

LogUso _logUsoDeserializeWeb(IsarCollection<LogUso> collection, dynamic jsObj) {
  final object = LogUso();
  object.enUso = IsarNative.jsObjectGet(jsObj, 'enUso');
  object.fecha = IsarNative.jsObjectGet(jsObj, 'fecha');
  object.privateId = IsarNative.jsObjectGet(jsObj, 'privateId');
  object.vehiculoId = IsarNative.jsObjectGet(jsObj, 'vehiculoId');
  return object;
}

P _logUsoDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'enUso':
      return (IsarNative.jsObjectGet(jsObj, 'enUso')) as P;
    case 'fecha':
      return (IsarNative.jsObjectGet(jsObj, 'fecha')) as P;
    case 'hashCode':
      return (IsarNative.jsObjectGet(jsObj, 'hashCode') ??
          double.negativeInfinity) as P;
    case 'privateId':
      return (IsarNative.jsObjectGet(jsObj, 'privateId')) as P;
    case 'stringify':
      return (IsarNative.jsObjectGet(jsObj, 'stringify')) as P;
    case 'vehiculoId':
      return (IsarNative.jsObjectGet(jsObj, 'vehiculoId')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _logUsoAttachLinks(IsarCollection col, int id, LogUso object) {}

extension LogUsoQueryWhereSort on QueryBuilder<LogUso, LogUso, QWhere> {
  QueryBuilder<LogUso, LogUso, QAfterWhere> anyPrivateId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension LogUsoQueryWhere on QueryBuilder<LogUso, LogUso, QWhereClause> {
  QueryBuilder<LogUso, LogUso, QAfterWhereClause> privateIdEqualTo(
      int privateId) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: privateId,
      includeLower: true,
      upper: privateId,
      includeUpper: true,
    ));
  }

  QueryBuilder<LogUso, LogUso, QAfterWhereClause> privateIdNotEqualTo(
      int privateId) {
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

  QueryBuilder<LogUso, LogUso, QAfterWhereClause> privateIdGreaterThan(
      int privateId,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: privateId, includeLower: include),
    );
  }

  QueryBuilder<LogUso, LogUso, QAfterWhereClause> privateIdLessThan(
      int privateId,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: privateId, includeUpper: include),
    );
  }

  QueryBuilder<LogUso, LogUso, QAfterWhereClause> privateIdBetween(
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

extension LogUsoQueryFilter on QueryBuilder<LogUso, LogUso, QFilterCondition> {
  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> enUsoIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'enUso',
      value: null,
    ));
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> enUsoEqualTo(
      bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'enUso',
      value: value,
    ));
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> fechaIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'fecha',
      value: null,
    ));
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> fechaEqualTo(
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

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> fechaGreaterThan(
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

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> fechaLessThan(
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

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> fechaBetween(
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

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> fechaStartsWith(
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

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> fechaEndsWith(
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

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> fechaContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'fecha',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> fechaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'fecha',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> hashCodeEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'hashCode',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> privateIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'privateId',
      value: null,
    ));
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> privateIdEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'privateId',
      value: value,
    ));
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> privateIdGreaterThan(
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

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> privateIdLessThan(
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

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> privateIdBetween(
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

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> stringifyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'stringify',
      value: null,
    ));
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> stringifyEqualTo(
      bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'stringify',
      value: value,
    ));
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> vehiculoIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'vehiculoId',
      value: null,
    ));
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> vehiculoIdEqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'vehiculoId',
      value: value,
    ));
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> vehiculoIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'vehiculoId',
      value: value,
    ));
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> vehiculoIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'vehiculoId',
      value: value,
    ));
  }

  QueryBuilder<LogUso, LogUso, QAfterFilterCondition> vehiculoIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'vehiculoId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension LogUsoQueryLinks on QueryBuilder<LogUso, LogUso, QFilterCondition> {}

extension LogUsoQueryWhereSortBy on QueryBuilder<LogUso, LogUso, QSortBy> {
  QueryBuilder<LogUso, LogUso, QAfterSortBy> sortByEnUso() {
    return addSortByInternal('enUso', Sort.asc);
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> sortByEnUsoDesc() {
    return addSortByInternal('enUso', Sort.desc);
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> sortByFecha() {
    return addSortByInternal('fecha', Sort.asc);
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> sortByFechaDesc() {
    return addSortByInternal('fecha', Sort.desc);
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> sortByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> sortByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> sortByPrivateId() {
    return addSortByInternal('privateId', Sort.asc);
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> sortByPrivateIdDesc() {
    return addSortByInternal('privateId', Sort.desc);
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> sortByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> sortByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> sortByVehiculoId() {
    return addSortByInternal('vehiculoId', Sort.asc);
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> sortByVehiculoIdDesc() {
    return addSortByInternal('vehiculoId', Sort.desc);
  }
}

extension LogUsoQueryWhereSortThenBy
    on QueryBuilder<LogUso, LogUso, QSortThenBy> {
  QueryBuilder<LogUso, LogUso, QAfterSortBy> thenByEnUso() {
    return addSortByInternal('enUso', Sort.asc);
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> thenByEnUsoDesc() {
    return addSortByInternal('enUso', Sort.desc);
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> thenByFecha() {
    return addSortByInternal('fecha', Sort.asc);
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> thenByFechaDesc() {
    return addSortByInternal('fecha', Sort.desc);
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> thenByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> thenByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> thenByPrivateId() {
    return addSortByInternal('privateId', Sort.asc);
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> thenByPrivateIdDesc() {
    return addSortByInternal('privateId', Sort.desc);
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> thenByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> thenByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> thenByVehiculoId() {
    return addSortByInternal('vehiculoId', Sort.asc);
  }

  QueryBuilder<LogUso, LogUso, QAfterSortBy> thenByVehiculoIdDesc() {
    return addSortByInternal('vehiculoId', Sort.desc);
  }
}

extension LogUsoQueryWhereDistinct on QueryBuilder<LogUso, LogUso, QDistinct> {
  QueryBuilder<LogUso, LogUso, QDistinct> distinctByEnUso() {
    return addDistinctByInternal('enUso');
  }

  QueryBuilder<LogUso, LogUso, QDistinct> distinctByFecha(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('fecha', caseSensitive: caseSensitive);
  }

  QueryBuilder<LogUso, LogUso, QDistinct> distinctByHashCode() {
    return addDistinctByInternal('hashCode');
  }

  QueryBuilder<LogUso, LogUso, QDistinct> distinctByPrivateId() {
    return addDistinctByInternal('privateId');
  }

  QueryBuilder<LogUso, LogUso, QDistinct> distinctByStringify() {
    return addDistinctByInternal('stringify');
  }

  QueryBuilder<LogUso, LogUso, QDistinct> distinctByVehiculoId() {
    return addDistinctByInternal('vehiculoId');
  }
}

extension LogUsoQueryProperty on QueryBuilder<LogUso, LogUso, QQueryProperty> {
  QueryBuilder<LogUso, bool?, QQueryOperations> enUsoProperty() {
    return addPropertyNameInternal('enUso');
  }

  QueryBuilder<LogUso, String?, QQueryOperations> fechaProperty() {
    return addPropertyNameInternal('fecha');
  }

  QueryBuilder<LogUso, int, QQueryOperations> hashCodeProperty() {
    return addPropertyNameInternal('hashCode');
  }

  QueryBuilder<LogUso, int?, QQueryOperations> privateIdProperty() {
    return addPropertyNameInternal('privateId');
  }

  QueryBuilder<LogUso, bool?, QQueryOperations> stringifyProperty() {
    return addPropertyNameInternal('stringify');
  }

  QueryBuilder<LogUso, int?, QQueryOperations> vehiculoIdProperty() {
    return addPropertyNameInternal('vehiculoId');
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
