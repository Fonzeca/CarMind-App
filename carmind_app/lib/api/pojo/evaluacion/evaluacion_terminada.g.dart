// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluacion_terminada.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetEvaluacionTerminadaPojoDbCollection on Isar {
  IsarCollection<EvaluacionTerminadaPojoDb> get evaluacionTerminadaPojoDbs =>
      getCollection();
}

const EvaluacionTerminadaPojoDbSchema = CollectionSchema(
  name: 'EvaluacionTerminadaPojoDb',
  schema:
      '{"name":"EvaluacionTerminadaPojoDb","idName":"privateId","properties":[{"name":"hashCode","type":"Long"},{"name":"stringify","type":"Bool"},{"name":"vehiculo_id","type":"Long"}],"indexes":[],"links":[{"name":"respuestasDb","target":"RespuestaPojoDb"}]}',
  idName: 'privateId',
  propertyIds: {'hashCode': 0, 'stringify': 1, 'vehiculo_id': 2},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {'respuestasDb': 0},
  backlinkLinkNames: {},
  getId: _evaluacionTerminadaPojoDbGetId,
  setId: _evaluacionTerminadaPojoDbSetId,
  getLinks: _evaluacionTerminadaPojoDbGetLinks,
  attachLinks: _evaluacionTerminadaPojoDbAttachLinks,
  serializeNative: _evaluacionTerminadaPojoDbSerializeNative,
  deserializeNative: _evaluacionTerminadaPojoDbDeserializeNative,
  deserializePropNative: _evaluacionTerminadaPojoDbDeserializePropNative,
  serializeWeb: _evaluacionTerminadaPojoDbSerializeWeb,
  deserializeWeb: _evaluacionTerminadaPojoDbDeserializeWeb,
  deserializePropWeb: _evaluacionTerminadaPojoDbDeserializePropWeb,
  version: 3,
);

int? _evaluacionTerminadaPojoDbGetId(EvaluacionTerminadaPojoDb object) {
  if (object.privateId == Isar.autoIncrement) {
    return null;
  } else {
    return object.privateId;
  }
}

void _evaluacionTerminadaPojoDbSetId(EvaluacionTerminadaPojoDb object, int id) {
  object.privateId = id;
}

List<IsarLinkBase> _evaluacionTerminadaPojoDbGetLinks(
    EvaluacionTerminadaPojoDb object) {
  return [object.respuestasDb];
}

void _evaluacionTerminadaPojoDbSerializeNative(
    IsarCollection<EvaluacionTerminadaPojoDb> collection,
    IsarRawObject rawObj,
    EvaluacionTerminadaPojoDb object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.hashCode;
  final _hashCode = value0;
  final value1 = object.stringify;
  final _stringify = value1;
  final value2 = object.vehiculo_id;
  final _vehiculo_id = value2;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeLong(offsets[0], _hashCode);
  writer.writeBool(offsets[1], _stringify);
  writer.writeLong(offsets[2], _vehiculo_id);
}

EvaluacionTerminadaPojoDb _evaluacionTerminadaPojoDbDeserializeNative(
    IsarCollection<EvaluacionTerminadaPojoDb> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = EvaluacionTerminadaPojoDb();
  object.privateId = id;
  object.vehiculo_id = reader.readLongOrNull(offsets[2]);
  _evaluacionTerminadaPojoDbAttachLinks(collection, id, object);
  return object;
}

P _evaluacionTerminadaPojoDbDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _evaluacionTerminadaPojoDbSerializeWeb(
    IsarCollection<EvaluacionTerminadaPojoDb> collection,
    EvaluacionTerminadaPojoDb object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'hashCode', object.hashCode);
  IsarNative.jsObjectSet(jsObj, 'privateId', object.privateId);
  IsarNative.jsObjectSet(jsObj, 'stringify', object.stringify);
  IsarNative.jsObjectSet(jsObj, 'vehiculo_id', object.vehiculo_id);
  return jsObj;
}

EvaluacionTerminadaPojoDb _evaluacionTerminadaPojoDbDeserializeWeb(
    IsarCollection<EvaluacionTerminadaPojoDb> collection, dynamic jsObj) {
  final object = EvaluacionTerminadaPojoDb();
  object.privateId = IsarNative.jsObjectGet(jsObj, 'privateId');
  object.vehiculo_id = IsarNative.jsObjectGet(jsObj, 'vehiculo_id');
  _evaluacionTerminadaPojoDbAttachLinks(
      collection, IsarNative.jsObjectGet(jsObj, 'privateId'), object);
  return object;
}

P _evaluacionTerminadaPojoDbDeserializePropWeb<P>(
    Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'hashCode':
      return (IsarNative.jsObjectGet(jsObj, 'hashCode') ??
          double.negativeInfinity) as P;
    case 'privateId':
      return (IsarNative.jsObjectGet(jsObj, 'privateId')) as P;
    case 'stringify':
      return (IsarNative.jsObjectGet(jsObj, 'stringify')) as P;
    case 'vehiculo_id':
      return (IsarNative.jsObjectGet(jsObj, 'vehiculo_id')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _evaluacionTerminadaPojoDbAttachLinks(
    IsarCollection col, int id, EvaluacionTerminadaPojoDb object) {
  object.respuestasDb
      .attach(col, col.isar.respuestaPojoDbs, 'respuestasDb', id);
}

extension EvaluacionTerminadaPojoDbQueryWhereSort on QueryBuilder<
    EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb, QWhere> {
  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterWhere> anyPrivateId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension EvaluacionTerminadaPojoDbQueryWhere on QueryBuilder<
    EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb, QWhereClause> {
  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterWhereClause> privateIdEqualTo(int privateId) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: privateId,
      includeLower: true,
      upper: privateId,
      includeUpper: true,
    ));
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
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

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
          QAfterWhereClause>
      privateIdGreaterThan(int privateId, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: privateId, includeLower: include),
    );
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
          QAfterWhereClause>
      privateIdLessThan(int privateId, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: privateId, includeUpper: include),
    );
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
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

extension EvaluacionTerminadaPojoDbQueryFilter on QueryBuilder<
    EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb, QFilterCondition> {
  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> hashCodeEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> hashCodeGreaterThan(
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

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> hashCodeLessThan(
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

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> hashCodeBetween(
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

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> privateIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'privateId',
      value: null,
    ));
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> privateIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'privateId',
      value: value,
    ));
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
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

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
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

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
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

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> stringifyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'stringify',
      value: null,
    ));
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> stringifyEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'stringify',
      value: value,
    ));
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> vehiculo_idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'vehiculo_id',
      value: null,
    ));
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> vehiculo_idEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'vehiculo_id',
      value: value,
    ));
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> vehiculo_idGreaterThan(
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

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> vehiculo_idLessThan(
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

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> vehiculo_idBetween(
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

extension EvaluacionTerminadaPojoDbQueryLinks on QueryBuilder<
    EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb, QFilterCondition> {
  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterFilterCondition> respuestasDb(FilterQuery<RespuestaPojoDb> q) {
    return linkInternal(
      isar.respuestaPojoDbs,
      q,
      'respuestasDb',
    );
  }
}

extension EvaluacionTerminadaPojoDbQueryWhereSortBy on QueryBuilder<
    EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb, QSortBy> {
  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterSortBy> sortByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterSortBy> sortByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterSortBy> sortByPrivateId() {
    return addSortByInternal('privateId', Sort.asc);
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterSortBy> sortByPrivateIdDesc() {
    return addSortByInternal('privateId', Sort.desc);
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterSortBy> sortByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterSortBy> sortByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterSortBy> sortByVehiculo_id() {
    return addSortByInternal('vehiculo_id', Sort.asc);
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterSortBy> sortByVehiculo_idDesc() {
    return addSortByInternal('vehiculo_id', Sort.desc);
  }
}

extension EvaluacionTerminadaPojoDbQueryWhereSortThenBy on QueryBuilder<
    EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb, QSortThenBy> {
  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterSortBy> thenByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterSortBy> thenByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterSortBy> thenByPrivateId() {
    return addSortByInternal('privateId', Sort.asc);
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterSortBy> thenByPrivateIdDesc() {
    return addSortByInternal('privateId', Sort.desc);
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterSortBy> thenByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterSortBy> thenByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterSortBy> thenByVehiculo_id() {
    return addSortByInternal('vehiculo_id', Sort.asc);
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb,
      QAfterSortBy> thenByVehiculo_idDesc() {
    return addSortByInternal('vehiculo_id', Sort.desc);
  }
}

extension EvaluacionTerminadaPojoDbQueryWhereDistinct on QueryBuilder<
    EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb, QDistinct> {
  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb, QDistinct>
      distinctByHashCode() {
    return addDistinctByInternal('hashCode');
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb, QDistinct>
      distinctByPrivateId() {
    return addDistinctByInternal('privateId');
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb, QDistinct>
      distinctByStringify() {
    return addDistinctByInternal('stringify');
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb, QDistinct>
      distinctByVehiculo_id() {
    return addDistinctByInternal('vehiculo_id');
  }
}

extension EvaluacionTerminadaPojoDbQueryProperty on QueryBuilder<
    EvaluacionTerminadaPojoDb, EvaluacionTerminadaPojoDb, QQueryProperty> {
  QueryBuilder<EvaluacionTerminadaPojoDb, int, QQueryOperations>
      hashCodeProperty() {
    return addPropertyNameInternal('hashCode');
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, int?, QQueryOperations>
      privateIdProperty() {
    return addPropertyNameInternal('privateId');
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, bool?, QQueryOperations>
      stringifyProperty() {
    return addPropertyNameInternal('stringify');
  }

  QueryBuilder<EvaluacionTerminadaPojoDb, int?, QQueryOperations>
      vehiculo_idProperty() {
    return addPropertyNameInternal('vehiculo_id');
  }
}

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetRespuestaPojoDbCollection on Isar {
  IsarCollection<RespuestaPojoDb> get respuestaPojoDbs => getCollection();
}

const RespuestaPojoDbSchema = CollectionSchema(
  name: 'RespuestaPojoDb',
  schema:
      '{"name":"RespuestaPojoDb","idName":"privateId","properties":[{"name":"base64_image","type":"String"},{"name":"hashCode","type":"Long"},{"name":"pregunta_id","type":"Long"},{"name":"stringify","type":"Bool"},{"name":"texto","type":"String"},{"name":"tick_correcto","type":"Bool"}],"indexes":[],"links":[{"name":"opcionesDb","target":"RespuestaOpcionPojo"}]}',
  idName: 'privateId',
  propertyIds: {
    'base64_image': 0,
    'hashCode': 1,
    'pregunta_id': 2,
    'stringify': 3,
    'texto': 4,
    'tick_correcto': 5
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {'opcionesDb': 0},
  backlinkLinkNames: {},
  getId: _respuestaPojoDbGetId,
  setId: _respuestaPojoDbSetId,
  getLinks: _respuestaPojoDbGetLinks,
  attachLinks: _respuestaPojoDbAttachLinks,
  serializeNative: _respuestaPojoDbSerializeNative,
  deserializeNative: _respuestaPojoDbDeserializeNative,
  deserializePropNative: _respuestaPojoDbDeserializePropNative,
  serializeWeb: _respuestaPojoDbSerializeWeb,
  deserializeWeb: _respuestaPojoDbDeserializeWeb,
  deserializePropWeb: _respuestaPojoDbDeserializePropWeb,
  version: 3,
);

int? _respuestaPojoDbGetId(RespuestaPojoDb object) {
  if (object.privateId == Isar.autoIncrement) {
    return null;
  } else {
    return object.privateId;
  }
}

void _respuestaPojoDbSetId(RespuestaPojoDb object, int id) {
  object.privateId = id;
}

List<IsarLinkBase> _respuestaPojoDbGetLinks(RespuestaPojoDb object) {
  return [object.opcionesDb];
}

void _respuestaPojoDbSerializeNative(
    IsarCollection<RespuestaPojoDb> collection,
    IsarRawObject rawObj,
    RespuestaPojoDb object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.base64_image;
  IsarUint8List? _base64_image;
  if (value0 != null) {
    _base64_image = IsarBinaryWriter.utf8Encoder.convert(value0);
  }
  dynamicSize += (_base64_image?.length ?? 0) as int;
  final value1 = object.hashCode;
  final _hashCode = value1;
  final value2 = object.pregunta_id;
  final _pregunta_id = value2;
  final value3 = object.stringify;
  final _stringify = value3;
  final value4 = object.texto;
  IsarUint8List? _texto;
  if (value4 != null) {
    _texto = IsarBinaryWriter.utf8Encoder.convert(value4);
  }
  dynamicSize += (_texto?.length ?? 0) as int;
  final value5 = object.tick_correcto;
  final _tick_correcto = value5;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _base64_image);
  writer.writeLong(offsets[1], _hashCode);
  writer.writeLong(offsets[2], _pregunta_id);
  writer.writeBool(offsets[3], _stringify);
  writer.writeBytes(offsets[4], _texto);
  writer.writeBool(offsets[5], _tick_correcto);
}

RespuestaPojoDb _respuestaPojoDbDeserializeNative(
    IsarCollection<RespuestaPojoDb> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = RespuestaPojoDb();
  object.base64_image = reader.readStringOrNull(offsets[0]);
  object.pregunta_id = reader.readLongOrNull(offsets[2]);
  object.privateId = id;
  object.texto = reader.readStringOrNull(offsets[4]);
  object.tick_correcto = reader.readBoolOrNull(offsets[5]);
  _respuestaPojoDbAttachLinks(collection, id, object);
  return object;
}

P _respuestaPojoDbDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _respuestaPojoDbSerializeWeb(
    IsarCollection<RespuestaPojoDb> collection, RespuestaPojoDb object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'base64_image', object.base64_image);
  IsarNative.jsObjectSet(jsObj, 'hashCode', object.hashCode);
  IsarNative.jsObjectSet(jsObj, 'pregunta_id', object.pregunta_id);
  IsarNative.jsObjectSet(jsObj, 'privateId', object.privateId);
  IsarNative.jsObjectSet(jsObj, 'stringify', object.stringify);
  IsarNative.jsObjectSet(jsObj, 'texto', object.texto);
  IsarNative.jsObjectSet(jsObj, 'tick_correcto', object.tick_correcto);
  return jsObj;
}

RespuestaPojoDb _respuestaPojoDbDeserializeWeb(
    IsarCollection<RespuestaPojoDb> collection, dynamic jsObj) {
  final object = RespuestaPojoDb();
  object.base64_image = IsarNative.jsObjectGet(jsObj, 'base64_image');
  object.pregunta_id = IsarNative.jsObjectGet(jsObj, 'pregunta_id');
  object.privateId = IsarNative.jsObjectGet(jsObj, 'privateId');
  object.texto = IsarNative.jsObjectGet(jsObj, 'texto');
  object.tick_correcto = IsarNative.jsObjectGet(jsObj, 'tick_correcto');
  _respuestaPojoDbAttachLinks(
      collection, IsarNative.jsObjectGet(jsObj, 'privateId'), object);
  return object;
}

P _respuestaPojoDbDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'base64_image':
      return (IsarNative.jsObjectGet(jsObj, 'base64_image')) as P;
    case 'hashCode':
      return (IsarNative.jsObjectGet(jsObj, 'hashCode') ??
          double.negativeInfinity) as P;
    case 'pregunta_id':
      return (IsarNative.jsObjectGet(jsObj, 'pregunta_id')) as P;
    case 'privateId':
      return (IsarNative.jsObjectGet(jsObj, 'privateId')) as P;
    case 'stringify':
      return (IsarNative.jsObjectGet(jsObj, 'stringify')) as P;
    case 'texto':
      return (IsarNative.jsObjectGet(jsObj, 'texto')) as P;
    case 'tick_correcto':
      return (IsarNative.jsObjectGet(jsObj, 'tick_correcto')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _respuestaPojoDbAttachLinks(
    IsarCollection col, int id, RespuestaPojoDb object) {
  object.opcionesDb
      .attach(col, col.isar.respuestaOpcionPojos, 'opcionesDb', id);
}

extension RespuestaPojoDbQueryWhereSort
    on QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QWhere> {
  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterWhere> anyPrivateId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension RespuestaPojoDbQueryWhere
    on QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QWhereClause> {
  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterWhereClause>
      privateIdEqualTo(int privateId) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: privateId,
      includeLower: true,
      upper: privateId,
      includeUpper: true,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterWhereClause>
      privateIdNotEqualTo(int privateId) {
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

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterWhereClause>
      privateIdGreaterThan(int privateId, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: privateId, includeLower: include),
    );
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterWhereClause>
      privateIdLessThan(int privateId, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: privateId, includeUpper: include),
    );
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterWhereClause>
      privateIdBetween(
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

extension RespuestaPojoDbQueryFilter
    on QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QFilterCondition> {
  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      base64_imageIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'base64_image',
      value: null,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      base64_imageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'base64_image',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      base64_imageGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'base64_image',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      base64_imageLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'base64_image',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      base64_imageBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'base64_image',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      base64_imageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'base64_image',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      base64_imageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'base64_image',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      base64_imageContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'base64_image',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      base64_imageMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'base64_image',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      hashCodeEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      hashCodeGreaterThan(
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

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      hashCodeLessThan(
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

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      hashCodeBetween(
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

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      pregunta_idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'pregunta_id',
      value: null,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      pregunta_idEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'pregunta_id',
      value: value,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      pregunta_idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'pregunta_id',
      value: value,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      pregunta_idLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'pregunta_id',
      value: value,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      pregunta_idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'pregunta_id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      privateIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'privateId',
      value: null,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      privateIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'privateId',
      value: value,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      privateIdGreaterThan(
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

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      privateIdLessThan(
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

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      privateIdBetween(
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

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      stringifyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'stringify',
      value: null,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      stringifyEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'stringify',
      value: value,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      textoIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'texto',
      value: null,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      textoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'texto',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      textoGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'texto',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      textoLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'texto',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      textoBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'texto',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      textoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'texto',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      textoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'texto',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      textoContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'texto',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      textoMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'texto',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      tick_correctoIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'tick_correcto',
      value: null,
    ));
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      tick_correctoEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'tick_correcto',
      value: value,
    ));
  }
}

extension RespuestaPojoDbQueryLinks
    on QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QFilterCondition> {
  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterFilterCondition>
      opcionesDb(FilterQuery<RespuestaOpcionPojo> q) {
    return linkInternal(
      isar.respuestaOpcionPojos,
      q,
      'opcionesDb',
    );
  }
}

extension RespuestaPojoDbQueryWhereSortBy
    on QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QSortBy> {
  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      sortByBase64_image() {
    return addSortByInternal('base64_image', Sort.asc);
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      sortByBase64_imageDesc() {
    return addSortByInternal('base64_image', Sort.desc);
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      sortByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      sortByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      sortByPregunta_id() {
    return addSortByInternal('pregunta_id', Sort.asc);
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      sortByPregunta_idDesc() {
    return addSortByInternal('pregunta_id', Sort.desc);
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      sortByPrivateId() {
    return addSortByInternal('privateId', Sort.asc);
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      sortByPrivateIdDesc() {
    return addSortByInternal('privateId', Sort.desc);
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      sortByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      sortByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy> sortByTexto() {
    return addSortByInternal('texto', Sort.asc);
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      sortByTextoDesc() {
    return addSortByInternal('texto', Sort.desc);
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      sortByTick_correcto() {
    return addSortByInternal('tick_correcto', Sort.asc);
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      sortByTick_correctoDesc() {
    return addSortByInternal('tick_correcto', Sort.desc);
  }
}

extension RespuestaPojoDbQueryWhereSortThenBy
    on QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QSortThenBy> {
  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      thenByBase64_image() {
    return addSortByInternal('base64_image', Sort.asc);
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      thenByBase64_imageDesc() {
    return addSortByInternal('base64_image', Sort.desc);
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      thenByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      thenByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      thenByPregunta_id() {
    return addSortByInternal('pregunta_id', Sort.asc);
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      thenByPregunta_idDesc() {
    return addSortByInternal('pregunta_id', Sort.desc);
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      thenByPrivateId() {
    return addSortByInternal('privateId', Sort.asc);
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      thenByPrivateIdDesc() {
    return addSortByInternal('privateId', Sort.desc);
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      thenByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      thenByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy> thenByTexto() {
    return addSortByInternal('texto', Sort.asc);
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      thenByTextoDesc() {
    return addSortByInternal('texto', Sort.desc);
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      thenByTick_correcto() {
    return addSortByInternal('tick_correcto', Sort.asc);
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QAfterSortBy>
      thenByTick_correctoDesc() {
    return addSortByInternal('tick_correcto', Sort.desc);
  }
}

extension RespuestaPojoDbQueryWhereDistinct
    on QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QDistinct> {
  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QDistinct>
      distinctByBase64_image({bool caseSensitive = true}) {
    return addDistinctByInternal('base64_image', caseSensitive: caseSensitive);
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QDistinct>
      distinctByHashCode() {
    return addDistinctByInternal('hashCode');
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QDistinct>
      distinctByPregunta_id() {
    return addDistinctByInternal('pregunta_id');
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QDistinct>
      distinctByPrivateId() {
    return addDistinctByInternal('privateId');
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QDistinct>
      distinctByStringify() {
    return addDistinctByInternal('stringify');
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QDistinct> distinctByTexto(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('texto', caseSensitive: caseSensitive);
  }

  QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QDistinct>
      distinctByTick_correcto() {
    return addDistinctByInternal('tick_correcto');
  }
}

extension RespuestaPojoDbQueryProperty
    on QueryBuilder<RespuestaPojoDb, RespuestaPojoDb, QQueryProperty> {
  QueryBuilder<RespuestaPojoDb, String?, QQueryOperations>
      base64_imageProperty() {
    return addPropertyNameInternal('base64_image');
  }

  QueryBuilder<RespuestaPojoDb, int, QQueryOperations> hashCodeProperty() {
    return addPropertyNameInternal('hashCode');
  }

  QueryBuilder<RespuestaPojoDb, int?, QQueryOperations> pregunta_idProperty() {
    return addPropertyNameInternal('pregunta_id');
  }

  QueryBuilder<RespuestaPojoDb, int?, QQueryOperations> privateIdProperty() {
    return addPropertyNameInternal('privateId');
  }

  QueryBuilder<RespuestaPojoDb, bool?, QQueryOperations> stringifyProperty() {
    return addPropertyNameInternal('stringify');
  }

  QueryBuilder<RespuestaPojoDb, String?, QQueryOperations> textoProperty() {
    return addPropertyNameInternal('texto');
  }

  QueryBuilder<RespuestaPojoDb, bool?, QQueryOperations>
      tick_correctoProperty() {
    return addPropertyNameInternal('tick_correcto');
  }
}

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetRespuestaOpcionPojoCollection on Isar {
  IsarCollection<RespuestaOpcionPojo> get respuestaOpcionPojos =>
      getCollection();
}

const RespuestaOpcionPojoSchema = CollectionSchema(
  name: 'RespuestaOpcionPojo',
  schema:
      '{"name":"RespuestaOpcionPojo","idName":"privateId","properties":[{"name":"hashCode","type":"Long"},{"name":"opcion_id","type":"Long"},{"name":"stringify","type":"Bool"},{"name":"tick_correcto","type":"Bool"}],"indexes":[],"links":[]}',
  idName: 'privateId',
  propertyIds: {
    'hashCode': 0,
    'opcion_id': 1,
    'stringify': 2,
    'tick_correcto': 3
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _respuestaOpcionPojoGetId,
  setId: _respuestaOpcionPojoSetId,
  getLinks: _respuestaOpcionPojoGetLinks,
  attachLinks: _respuestaOpcionPojoAttachLinks,
  serializeNative: _respuestaOpcionPojoSerializeNative,
  deserializeNative: _respuestaOpcionPojoDeserializeNative,
  deserializePropNative: _respuestaOpcionPojoDeserializePropNative,
  serializeWeb: _respuestaOpcionPojoSerializeWeb,
  deserializeWeb: _respuestaOpcionPojoDeserializeWeb,
  deserializePropWeb: _respuestaOpcionPojoDeserializePropWeb,
  version: 3,
);

int? _respuestaOpcionPojoGetId(RespuestaOpcionPojo object) {
  if (object.privateId == Isar.autoIncrement) {
    return null;
  } else {
    return object.privateId;
  }
}

void _respuestaOpcionPojoSetId(RespuestaOpcionPojo object, int id) {
  object.privateId = id;
}

List<IsarLinkBase> _respuestaOpcionPojoGetLinks(RespuestaOpcionPojo object) {
  return [];
}

void _respuestaOpcionPojoSerializeNative(
    IsarCollection<RespuestaOpcionPojo> collection,
    IsarRawObject rawObj,
    RespuestaOpcionPojo object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.hashCode;
  final _hashCode = value0;
  final value1 = object.opcion_id;
  final _opcion_id = value1;
  final value2 = object.stringify;
  final _stringify = value2;
  final value3 = object.tick_correcto;
  final _tick_correcto = value3;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeLong(offsets[0], _hashCode);
  writer.writeLong(offsets[1], _opcion_id);
  writer.writeBool(offsets[2], _stringify);
  writer.writeBool(offsets[3], _tick_correcto);
}

RespuestaOpcionPojo _respuestaOpcionPojoDeserializeNative(
    IsarCollection<RespuestaOpcionPojo> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = RespuestaOpcionPojo();
  object.opcion_id = reader.readLongOrNull(offsets[1]);
  object.privateId = id;
  object.tick_correcto = reader.readBoolOrNull(offsets[3]);
  return object;
}

P _respuestaOpcionPojoDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _respuestaOpcionPojoSerializeWeb(
    IsarCollection<RespuestaOpcionPojo> collection,
    RespuestaOpcionPojo object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'hashCode', object.hashCode);
  IsarNative.jsObjectSet(jsObj, 'opcion_id', object.opcion_id);
  IsarNative.jsObjectSet(jsObj, 'privateId', object.privateId);
  IsarNative.jsObjectSet(jsObj, 'stringify', object.stringify);
  IsarNative.jsObjectSet(jsObj, 'tick_correcto', object.tick_correcto);
  return jsObj;
}

RespuestaOpcionPojo _respuestaOpcionPojoDeserializeWeb(
    IsarCollection<RespuestaOpcionPojo> collection, dynamic jsObj) {
  final object = RespuestaOpcionPojo();
  object.opcion_id = IsarNative.jsObjectGet(jsObj, 'opcion_id');
  object.privateId = IsarNative.jsObjectGet(jsObj, 'privateId');
  object.tick_correcto = IsarNative.jsObjectGet(jsObj, 'tick_correcto');
  return object;
}

P _respuestaOpcionPojoDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'hashCode':
      return (IsarNative.jsObjectGet(jsObj, 'hashCode') ??
          double.negativeInfinity) as P;
    case 'opcion_id':
      return (IsarNative.jsObjectGet(jsObj, 'opcion_id')) as P;
    case 'privateId':
      return (IsarNative.jsObjectGet(jsObj, 'privateId')) as P;
    case 'stringify':
      return (IsarNative.jsObjectGet(jsObj, 'stringify')) as P;
    case 'tick_correcto':
      return (IsarNative.jsObjectGet(jsObj, 'tick_correcto')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _respuestaOpcionPojoAttachLinks(
    IsarCollection col, int id, RespuestaOpcionPojo object) {}

extension RespuestaOpcionPojoQueryWhereSort
    on QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QWhere> {
  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterWhere>
      anyPrivateId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension RespuestaOpcionPojoQueryWhere
    on QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QWhereClause> {
  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterWhereClause>
      privateIdEqualTo(int privateId) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: privateId,
      includeLower: true,
      upper: privateId,
      includeUpper: true,
    ));
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterWhereClause>
      privateIdNotEqualTo(int privateId) {
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

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterWhereClause>
      privateIdGreaterThan(int privateId, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: privateId, includeLower: include),
    );
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterWhereClause>
      privateIdLessThan(int privateId, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: privateId, includeUpper: include),
    );
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterWhereClause>
      privateIdBetween(
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

extension RespuestaOpcionPojoQueryFilter on QueryBuilder<RespuestaOpcionPojo,
    RespuestaOpcionPojo, QFilterCondition> {
  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      hashCodeEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      hashCodeGreaterThan(
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

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      hashCodeLessThan(
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

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      hashCodeBetween(
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

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      opcion_idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'opcion_id',
      value: null,
    ));
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      opcion_idEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'opcion_id',
      value: value,
    ));
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      opcion_idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'opcion_id',
      value: value,
    ));
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      opcion_idLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'opcion_id',
      value: value,
    ));
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      opcion_idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'opcion_id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      privateIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'privateId',
      value: null,
    ));
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      privateIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'privateId',
      value: value,
    ));
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      privateIdGreaterThan(
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

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      privateIdLessThan(
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

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      privateIdBetween(
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

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      stringifyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'stringify',
      value: null,
    ));
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      stringifyEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'stringify',
      value: value,
    ));
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      tick_correctoIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'tick_correcto',
      value: null,
    ));
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterFilterCondition>
      tick_correctoEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'tick_correcto',
      value: value,
    ));
  }
}

extension RespuestaOpcionPojoQueryLinks on QueryBuilder<RespuestaOpcionPojo,
    RespuestaOpcionPojo, QFilterCondition> {}

extension RespuestaOpcionPojoQueryWhereSortBy
    on QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QSortBy> {
  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      sortByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      sortByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      sortByOpcion_id() {
    return addSortByInternal('opcion_id', Sort.asc);
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      sortByOpcion_idDesc() {
    return addSortByInternal('opcion_id', Sort.desc);
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      sortByPrivateId() {
    return addSortByInternal('privateId', Sort.asc);
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      sortByPrivateIdDesc() {
    return addSortByInternal('privateId', Sort.desc);
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      sortByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      sortByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      sortByTick_correcto() {
    return addSortByInternal('tick_correcto', Sort.asc);
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      sortByTick_correctoDesc() {
    return addSortByInternal('tick_correcto', Sort.desc);
  }
}

extension RespuestaOpcionPojoQueryWhereSortThenBy
    on QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QSortThenBy> {
  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      thenByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      thenByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      thenByOpcion_id() {
    return addSortByInternal('opcion_id', Sort.asc);
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      thenByOpcion_idDesc() {
    return addSortByInternal('opcion_id', Sort.desc);
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      thenByPrivateId() {
    return addSortByInternal('privateId', Sort.asc);
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      thenByPrivateIdDesc() {
    return addSortByInternal('privateId', Sort.desc);
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      thenByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      thenByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      thenByTick_correcto() {
    return addSortByInternal('tick_correcto', Sort.asc);
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QAfterSortBy>
      thenByTick_correctoDesc() {
    return addSortByInternal('tick_correcto', Sort.desc);
  }
}

extension RespuestaOpcionPojoQueryWhereDistinct
    on QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QDistinct> {
  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QDistinct>
      distinctByHashCode() {
    return addDistinctByInternal('hashCode');
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QDistinct>
      distinctByOpcion_id() {
    return addDistinctByInternal('opcion_id');
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QDistinct>
      distinctByPrivateId() {
    return addDistinctByInternal('privateId');
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QDistinct>
      distinctByStringify() {
    return addDistinctByInternal('stringify');
  }

  QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QDistinct>
      distinctByTick_correcto() {
    return addDistinctByInternal('tick_correcto');
  }
}

extension RespuestaOpcionPojoQueryProperty
    on QueryBuilder<RespuestaOpcionPojo, RespuestaOpcionPojo, QQueryProperty> {
  QueryBuilder<RespuestaOpcionPojo, int, QQueryOperations> hashCodeProperty() {
    return addPropertyNameInternal('hashCode');
  }

  QueryBuilder<RespuestaOpcionPojo, int?, QQueryOperations>
      opcion_idProperty() {
    return addPropertyNameInternal('opcion_id');
  }

  QueryBuilder<RespuestaOpcionPojo, int?, QQueryOperations>
      privateIdProperty() {
    return addPropertyNameInternal('privateId');
  }

  QueryBuilder<RespuestaOpcionPojo, bool?, QQueryOperations>
      stringifyProperty() {
    return addPropertyNameInternal('stringify');
  }

  QueryBuilder<RespuestaOpcionPojo, bool?, QQueryOperations>
      tick_correctoProperty() {
    return addPropertyNameInternal('tick_correcto');
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
