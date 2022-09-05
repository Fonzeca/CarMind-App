// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehiculo.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetVehiculoDbCollection on Isar {
  IsarCollection<VehiculoDb> get vehiculoDbs => getCollection();
}

const VehiculoDbSchema = CollectionSchema(
  name: 'VehiculoDb',
  schema:
      '{"name":"VehiculoDb","idName":"id","properties":[{"name":"en_uso","type":"Bool"},{"name":"hashCode","type":"Long"},{"name":"imei","type":"String"},{"name":"linea","type":"String"},{"name":"marca","type":"String"},{"name":"modelo","type":"String"},{"name":"nombre","type":"String"},{"name":"patente","type":"String"},{"name":"stringify","type":"Bool"}],"indexes":[],"links":[{"name":"pendientesDb","target":"EvaluacionesPendientes"}]}',
  idName: 'id',
  propertyIds: {
    'en_uso': 0,
    'hashCode': 1,
    'imei': 2,
    'linea': 3,
    'marca': 4,
    'modelo': 5,
    'nombre': 6,
    'patente': 7,
    'stringify': 8
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {'pendientesDb': 0},
  backlinkLinkNames: {},
  getId: _vehiculoDbGetId,
  setId: _vehiculoDbSetId,
  getLinks: _vehiculoDbGetLinks,
  attachLinks: _vehiculoDbAttachLinks,
  serializeNative: _vehiculoDbSerializeNative,
  deserializeNative: _vehiculoDbDeserializeNative,
  deserializePropNative: _vehiculoDbDeserializePropNative,
  serializeWeb: _vehiculoDbSerializeWeb,
  deserializeWeb: _vehiculoDbDeserializeWeb,
  deserializePropWeb: _vehiculoDbDeserializePropWeb,
  version: 3,
);

int? _vehiculoDbGetId(VehiculoDb object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _vehiculoDbSetId(VehiculoDb object, int id) {
  object.id = id;
}

List<IsarLinkBase> _vehiculoDbGetLinks(VehiculoDb object) {
  return [object.pendientesDb];
}

void _vehiculoDbSerializeNative(
    IsarCollection<VehiculoDb> collection,
    IsarRawObject rawObj,
    VehiculoDb object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.en_uso;
  final _en_uso = value0;
  final value1 = object.hashCode;
  final _hashCode = value1;
  final value2 = object.imei;
  IsarUint8List? _imei;
  if (value2 != null) {
    _imei = IsarBinaryWriter.utf8Encoder.convert(value2);
  }
  dynamicSize += (_imei?.length ?? 0) as int;
  final value3 = object.linea;
  IsarUint8List? _linea;
  if (value3 != null) {
    _linea = IsarBinaryWriter.utf8Encoder.convert(value3);
  }
  dynamicSize += (_linea?.length ?? 0) as int;
  final value4 = object.marca;
  IsarUint8List? _marca;
  if (value4 != null) {
    _marca = IsarBinaryWriter.utf8Encoder.convert(value4);
  }
  dynamicSize += (_marca?.length ?? 0) as int;
  final value5 = object.modelo;
  IsarUint8List? _modelo;
  if (value5 != null) {
    _modelo = IsarBinaryWriter.utf8Encoder.convert(value5);
  }
  dynamicSize += (_modelo?.length ?? 0) as int;
  final value6 = object.nombre;
  IsarUint8List? _nombre;
  if (value6 != null) {
    _nombre = IsarBinaryWriter.utf8Encoder.convert(value6);
  }
  dynamicSize += (_nombre?.length ?? 0) as int;
  final value7 = object.patente;
  IsarUint8List? _patente;
  if (value7 != null) {
    _patente = IsarBinaryWriter.utf8Encoder.convert(value7);
  }
  dynamicSize += (_patente?.length ?? 0) as int;
  final value8 = object.stringify;
  final _stringify = value8;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBool(offsets[0], _en_uso);
  writer.writeLong(offsets[1], _hashCode);
  writer.writeBytes(offsets[2], _imei);
  writer.writeBytes(offsets[3], _linea);
  writer.writeBytes(offsets[4], _marca);
  writer.writeBytes(offsets[5], _modelo);
  writer.writeBytes(offsets[6], _nombre);
  writer.writeBytes(offsets[7], _patente);
  writer.writeBool(offsets[8], _stringify);
}

VehiculoDb _vehiculoDbDeserializeNative(IsarCollection<VehiculoDb> collection,
    int id, IsarBinaryReader reader, List<int> offsets) {
  final object = VehiculoDb();
  object.en_uso = reader.readBoolOrNull(offsets[0]);
  object.id = id;
  object.imei = reader.readStringOrNull(offsets[2]);
  object.linea = reader.readStringOrNull(offsets[3]);
  object.marca = reader.readStringOrNull(offsets[4]);
  object.modelo = reader.readStringOrNull(offsets[5]);
  object.nombre = reader.readStringOrNull(offsets[6]);
  object.patente = reader.readStringOrNull(offsets[7]);
  _vehiculoDbAttachLinks(collection, id, object);
  return object;
}

P _vehiculoDbDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _vehiculoDbSerializeWeb(
    IsarCollection<VehiculoDb> collection, VehiculoDb object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'en_uso', object.en_uso);
  IsarNative.jsObjectSet(jsObj, 'hashCode', object.hashCode);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'imei', object.imei);
  IsarNative.jsObjectSet(jsObj, 'linea', object.linea);
  IsarNative.jsObjectSet(jsObj, 'marca', object.marca);
  IsarNative.jsObjectSet(jsObj, 'modelo', object.modelo);
  IsarNative.jsObjectSet(jsObj, 'nombre', object.nombre);
  IsarNative.jsObjectSet(jsObj, 'patente', object.patente);
  IsarNative.jsObjectSet(jsObj, 'stringify', object.stringify);
  return jsObj;
}

VehiculoDb _vehiculoDbDeserializeWeb(
    IsarCollection<VehiculoDb> collection, dynamic jsObj) {
  final object = VehiculoDb();
  object.en_uso = IsarNative.jsObjectGet(jsObj, 'en_uso');
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.imei = IsarNative.jsObjectGet(jsObj, 'imei');
  object.linea = IsarNative.jsObjectGet(jsObj, 'linea');
  object.marca = IsarNative.jsObjectGet(jsObj, 'marca');
  object.modelo = IsarNative.jsObjectGet(jsObj, 'modelo');
  object.nombre = IsarNative.jsObjectGet(jsObj, 'nombre');
  object.patente = IsarNative.jsObjectGet(jsObj, 'patente');
  _vehiculoDbAttachLinks(
      collection, IsarNative.jsObjectGet(jsObj, 'id'), object);
  return object;
}

P _vehiculoDbDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'en_uso':
      return (IsarNative.jsObjectGet(jsObj, 'en_uso')) as P;
    case 'hashCode':
      return (IsarNative.jsObjectGet(jsObj, 'hashCode') ??
          double.negativeInfinity) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'imei':
      return (IsarNative.jsObjectGet(jsObj, 'imei')) as P;
    case 'linea':
      return (IsarNative.jsObjectGet(jsObj, 'linea')) as P;
    case 'marca':
      return (IsarNative.jsObjectGet(jsObj, 'marca')) as P;
    case 'modelo':
      return (IsarNative.jsObjectGet(jsObj, 'modelo')) as P;
    case 'nombre':
      return (IsarNative.jsObjectGet(jsObj, 'nombre')) as P;
    case 'patente':
      return (IsarNative.jsObjectGet(jsObj, 'patente')) as P;
    case 'stringify':
      return (IsarNative.jsObjectGet(jsObj, 'stringify')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _vehiculoDbAttachLinks(IsarCollection col, int id, VehiculoDb object) {
  object.pendientesDb
      .attach(col, col.isar.evaluacionesPendientess, 'pendientesDb', id);
}

extension VehiculoDbQueryWhereSort
    on QueryBuilder<VehiculoDb, VehiculoDb, QWhere> {
  QueryBuilder<VehiculoDb, VehiculoDb, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension VehiculoDbQueryWhere
    on QueryBuilder<VehiculoDb, VehiculoDb, QWhereClause> {
  QueryBuilder<VehiculoDb, VehiculoDb, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension VehiculoDbQueryFilter
    on QueryBuilder<VehiculoDb, VehiculoDb, QFilterCondition> {
  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> en_usoIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'en_uso',
      value: null,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> en_usoEqualTo(
      bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'en_uso',
      value: value,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> hashCodeEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition>
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

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> hashCodeLessThan(
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

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> hashCodeBetween(
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

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> imeiIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'imei',
      value: null,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> imeiEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'imei',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> imeiGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'imei',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> imeiLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'imei',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> imeiBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'imei',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> imeiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'imei',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> imeiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'imei',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> imeiContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'imei',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> imeiMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'imei',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> lineaIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'linea',
      value: null,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> lineaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'linea',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> lineaGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'linea',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> lineaLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'linea',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> lineaBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'linea',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> lineaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'linea',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> lineaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'linea',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> lineaContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'linea',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> lineaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'linea',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> marcaIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'marca',
      value: null,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> marcaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'marca',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> marcaGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'marca',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> marcaLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'marca',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> marcaBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'marca',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> marcaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'marca',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> marcaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'marca',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> marcaContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'marca',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> marcaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'marca',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> modeloIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'modelo',
      value: null,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> modeloEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'modelo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> modeloGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'modelo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> modeloLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'modelo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> modeloBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'modelo',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> modeloStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'modelo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> modeloEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'modelo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> modeloContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'modelo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> modeloMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'modelo',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> nombreIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'nombre',
      value: null,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> nombreEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'nombre',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> nombreGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'nombre',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> nombreLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'nombre',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> nombreBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'nombre',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> nombreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'nombre',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> nombreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'nombre',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> nombreContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'nombre',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> nombreMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'nombre',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> patenteIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'patente',
      value: null,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> patenteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'patente',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition>
      patenteGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'patente',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> patenteLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'patente',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> patenteBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'patente',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> patenteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'patente',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> patenteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'patente',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> patenteContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'patente',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> patenteMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'patente',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition>
      stringifyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'stringify',
      value: null,
    ));
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> stringifyEqualTo(
      bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'stringify',
      value: value,
    ));
  }
}

extension VehiculoDbQueryLinks
    on QueryBuilder<VehiculoDb, VehiculoDb, QFilterCondition> {
  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> pendientesDb(
      FilterQuery<EvaluacionesPendientes> q) {
    return linkInternal(
      isar.evaluacionesPendientess,
      q,
      'pendientesDb',
    );
  }
}

extension VehiculoDbQueryWhereSortBy
    on QueryBuilder<VehiculoDb, VehiculoDb, QSortBy> {
  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByEn_uso() {
    return addSortByInternal('en_uso', Sort.asc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByEn_usoDesc() {
    return addSortByInternal('en_uso', Sort.desc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByImei() {
    return addSortByInternal('imei', Sort.asc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByImeiDesc() {
    return addSortByInternal('imei', Sort.desc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByLinea() {
    return addSortByInternal('linea', Sort.asc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByLineaDesc() {
    return addSortByInternal('linea', Sort.desc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByMarca() {
    return addSortByInternal('marca', Sort.asc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByMarcaDesc() {
    return addSortByInternal('marca', Sort.desc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByModelo() {
    return addSortByInternal('modelo', Sort.asc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByModeloDesc() {
    return addSortByInternal('modelo', Sort.desc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByNombre() {
    return addSortByInternal('nombre', Sort.asc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByNombreDesc() {
    return addSortByInternal('nombre', Sort.desc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByPatente() {
    return addSortByInternal('patente', Sort.asc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByPatenteDesc() {
    return addSortByInternal('patente', Sort.desc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }
}

extension VehiculoDbQueryWhereSortThenBy
    on QueryBuilder<VehiculoDb, VehiculoDb, QSortThenBy> {
  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByEn_uso() {
    return addSortByInternal('en_uso', Sort.asc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByEn_usoDesc() {
    return addSortByInternal('en_uso', Sort.desc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByImei() {
    return addSortByInternal('imei', Sort.asc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByImeiDesc() {
    return addSortByInternal('imei', Sort.desc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByLinea() {
    return addSortByInternal('linea', Sort.asc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByLineaDesc() {
    return addSortByInternal('linea', Sort.desc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByMarca() {
    return addSortByInternal('marca', Sort.asc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByMarcaDesc() {
    return addSortByInternal('marca', Sort.desc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByModelo() {
    return addSortByInternal('modelo', Sort.asc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByModeloDesc() {
    return addSortByInternal('modelo', Sort.desc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByNombre() {
    return addSortByInternal('nombre', Sort.asc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByNombreDesc() {
    return addSortByInternal('nombre', Sort.desc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByPatente() {
    return addSortByInternal('patente', Sort.asc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByPatenteDesc() {
    return addSortByInternal('patente', Sort.desc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }
}

extension VehiculoDbQueryWhereDistinct
    on QueryBuilder<VehiculoDb, VehiculoDb, QDistinct> {
  QueryBuilder<VehiculoDb, VehiculoDb, QDistinct> distinctByEn_uso() {
    return addDistinctByInternal('en_uso');
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QDistinct> distinctByHashCode() {
    return addDistinctByInternal('hashCode');
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QDistinct> distinctByImei(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('imei', caseSensitive: caseSensitive);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QDistinct> distinctByLinea(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('linea', caseSensitive: caseSensitive);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QDistinct> distinctByMarca(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('marca', caseSensitive: caseSensitive);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QDistinct> distinctByModelo(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('modelo', caseSensitive: caseSensitive);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('nombre', caseSensitive: caseSensitive);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QDistinct> distinctByPatente(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('patente', caseSensitive: caseSensitive);
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QDistinct> distinctByStringify() {
    return addDistinctByInternal('stringify');
  }
}

extension VehiculoDbQueryProperty
    on QueryBuilder<VehiculoDb, VehiculoDb, QQueryProperty> {
  QueryBuilder<VehiculoDb, bool?, QQueryOperations> en_usoProperty() {
    return addPropertyNameInternal('en_uso');
  }

  QueryBuilder<VehiculoDb, int, QQueryOperations> hashCodeProperty() {
    return addPropertyNameInternal('hashCode');
  }

  QueryBuilder<VehiculoDb, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<VehiculoDb, String?, QQueryOperations> imeiProperty() {
    return addPropertyNameInternal('imei');
  }

  QueryBuilder<VehiculoDb, String?, QQueryOperations> lineaProperty() {
    return addPropertyNameInternal('linea');
  }

  QueryBuilder<VehiculoDb, String?, QQueryOperations> marcaProperty() {
    return addPropertyNameInternal('marca');
  }

  QueryBuilder<VehiculoDb, String?, QQueryOperations> modeloProperty() {
    return addPropertyNameInternal('modelo');
  }

  QueryBuilder<VehiculoDb, String?, QQueryOperations> nombreProperty() {
    return addPropertyNameInternal('nombre');
  }

  QueryBuilder<VehiculoDb, String?, QQueryOperations> patenteProperty() {
    return addPropertyNameInternal('patente');
  }

  QueryBuilder<VehiculoDb, bool?, QQueryOperations> stringifyProperty() {
    return addPropertyNameInternal('stringify');
  }
}

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetEvaluacionesPendientesCollection on Isar {
  IsarCollection<EvaluacionesPendientes> get evaluacionesPendientess =>
      getCollection();
}

const EvaluacionesPendientesSchema = CollectionSchema(
  name: 'EvaluacionesPendientes',
  schema:
      '{"name":"EvaluacionesPendientes","idName":"privateId","properties":[{"name":"hashCode","type":"Long"},{"name":"id","type":"Long"},{"name":"intervaloDias","type":"Long"},{"name":"pendiente","type":"Bool"},{"name":"stringify","type":"Bool"},{"name":"titulo","type":"String"},{"name":"vencimiento","type":"Long"}],"indexes":[],"links":[]}',
  idName: 'privateId',
  propertyIds: {
    'hashCode': 0,
    'id': 1,
    'intervaloDias': 2,
    'pendiente': 3,
    'stringify': 4,
    'titulo': 5,
    'vencimiento': 6
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _evaluacionesPendientesGetId,
  setId: _evaluacionesPendientesSetId,
  getLinks: _evaluacionesPendientesGetLinks,
  attachLinks: _evaluacionesPendientesAttachLinks,
  serializeNative: _evaluacionesPendientesSerializeNative,
  deserializeNative: _evaluacionesPendientesDeserializeNative,
  deserializePropNative: _evaluacionesPendientesDeserializePropNative,
  serializeWeb: _evaluacionesPendientesSerializeWeb,
  deserializeWeb: _evaluacionesPendientesDeserializeWeb,
  deserializePropWeb: _evaluacionesPendientesDeserializePropWeb,
  version: 3,
);

int? _evaluacionesPendientesGetId(EvaluacionesPendientes object) {
  if (object.privateId == Isar.autoIncrement) {
    return null;
  } else {
    return object.privateId;
  }
}

void _evaluacionesPendientesSetId(EvaluacionesPendientes object, int id) {
  object.privateId = id;
}

List<IsarLinkBase> _evaluacionesPendientesGetLinks(
    EvaluacionesPendientes object) {
  return [];
}

void _evaluacionesPendientesSerializeNative(
    IsarCollection<EvaluacionesPendientes> collection,
    IsarRawObject rawObj,
    EvaluacionesPendientes object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.hashCode;
  final _hashCode = value0;
  final value1 = object.id;
  final _id = value1;
  final value2 = object.intervaloDias;
  final _intervaloDias = value2;
  final value3 = object.pendiente;
  final _pendiente = value3;
  final value4 = object.stringify;
  final _stringify = value4;
  final value5 = object.titulo;
  IsarUint8List? _titulo;
  if (value5 != null) {
    _titulo = IsarBinaryWriter.utf8Encoder.convert(value5);
  }
  dynamicSize += (_titulo?.length ?? 0) as int;
  final value6 = object.vencimiento;
  final _vencimiento = value6;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeLong(offsets[0], _hashCode);
  writer.writeLong(offsets[1], _id);
  writer.writeLong(offsets[2], _intervaloDias);
  writer.writeBool(offsets[3], _pendiente);
  writer.writeBool(offsets[4], _stringify);
  writer.writeBytes(offsets[5], _titulo);
  writer.writeLong(offsets[6], _vencimiento);
}

EvaluacionesPendientes _evaluacionesPendientesDeserializeNative(
    IsarCollection<EvaluacionesPendientes> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = EvaluacionesPendientes();
  object.id = reader.readLongOrNull(offsets[1]);
  object.intervaloDias = reader.readLongOrNull(offsets[2]);
  object.pendiente = reader.readBoolOrNull(offsets[3]);
  object.privateId = id;
  object.titulo = reader.readStringOrNull(offsets[5]);
  object.vencimiento = reader.readLongOrNull(offsets[6]);
  return object;
}

P _evaluacionesPendientesDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _evaluacionesPendientesSerializeWeb(
    IsarCollection<EvaluacionesPendientes> collection,
    EvaluacionesPendientes object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'hashCode', object.hashCode);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'intervaloDias', object.intervaloDias);
  IsarNative.jsObjectSet(jsObj, 'pendiente', object.pendiente);
  IsarNative.jsObjectSet(jsObj, 'privateId', object.privateId);
  IsarNative.jsObjectSet(jsObj, 'stringify', object.stringify);
  IsarNative.jsObjectSet(jsObj, 'titulo', object.titulo);
  IsarNative.jsObjectSet(jsObj, 'vencimiento', object.vencimiento);
  return jsObj;
}

EvaluacionesPendientes _evaluacionesPendientesDeserializeWeb(
    IsarCollection<EvaluacionesPendientes> collection, dynamic jsObj) {
  final object = EvaluacionesPendientes();
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.intervaloDias = IsarNative.jsObjectGet(jsObj, 'intervaloDias');
  object.pendiente = IsarNative.jsObjectGet(jsObj, 'pendiente');
  object.privateId = IsarNative.jsObjectGet(jsObj, 'privateId');
  object.titulo = IsarNative.jsObjectGet(jsObj, 'titulo');
  object.vencimiento = IsarNative.jsObjectGet(jsObj, 'vencimiento');
  return object;
}

P _evaluacionesPendientesDeserializePropWeb<P>(
    Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'hashCode':
      return (IsarNative.jsObjectGet(jsObj, 'hashCode') ??
          double.negativeInfinity) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'intervaloDias':
      return (IsarNative.jsObjectGet(jsObj, 'intervaloDias')) as P;
    case 'pendiente':
      return (IsarNative.jsObjectGet(jsObj, 'pendiente')) as P;
    case 'privateId':
      return (IsarNative.jsObjectGet(jsObj, 'privateId')) as P;
    case 'stringify':
      return (IsarNative.jsObjectGet(jsObj, 'stringify')) as P;
    case 'titulo':
      return (IsarNative.jsObjectGet(jsObj, 'titulo')) as P;
    case 'vencimiento':
      return (IsarNative.jsObjectGet(jsObj, 'vencimiento')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _evaluacionesPendientesAttachLinks(
    IsarCollection col, int id, EvaluacionesPendientes object) {}

extension EvaluacionesPendientesQueryWhereSort
    on QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QWhere> {
  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterWhere>
      anyPrivateId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension EvaluacionesPendientesQueryWhere on QueryBuilder<
    EvaluacionesPendientes, EvaluacionesPendientes, QWhereClause> {
  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterWhereClause> privateIdEqualTo(int privateId) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: privateId,
      includeLower: true,
      upper: privateId,
      includeUpper: true,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
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

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
          QAfterWhereClause>
      privateIdGreaterThan(int privateId, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: privateId, includeLower: include),
    );
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
          QAfterWhereClause>
      privateIdLessThan(int privateId, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: privateId, includeUpper: include),
    );
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
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

extension EvaluacionesPendientesQueryFilter on QueryBuilder<
    EvaluacionesPendientes, EvaluacionesPendientes, QFilterCondition> {
  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterFilterCondition> hashCodeEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
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

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
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

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
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

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterFilterCondition> idEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterFilterCondition> idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterFilterCondition> idLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterFilterCondition> intervaloDiasIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'intervaloDias',
      value: null,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterFilterCondition> intervaloDiasEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'intervaloDias',
      value: value,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterFilterCondition> intervaloDiasGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'intervaloDias',
      value: value,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterFilterCondition> intervaloDiasLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'intervaloDias',
      value: value,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterFilterCondition> intervaloDiasBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'intervaloDias',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterFilterCondition> pendienteIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'pendiente',
      value: null,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterFilterCondition> pendienteEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'pendiente',
      value: value,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterFilterCondition> privateIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'privateId',
      value: null,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterFilterCondition> privateIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'privateId',
      value: value,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
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

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
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

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
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

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterFilterCondition> stringifyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'stringify',
      value: null,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterFilterCondition> stringifyEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'stringify',
      value: value,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterFilterCondition> tituloIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'titulo',
      value: null,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterFilterCondition> tituloEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'titulo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterFilterCondition> tituloGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'titulo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterFilterCondition> tituloLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'titulo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterFilterCondition> tituloBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'titulo',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterFilterCondition> tituloStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'titulo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterFilterCondition> tituloEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'titulo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
          QAfterFilterCondition>
      tituloContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'titulo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
          QAfterFilterCondition>
      tituloMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'titulo',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterFilterCondition> vencimientoIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'vencimiento',
      value: null,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterFilterCondition> vencimientoEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'vencimiento',
      value: value,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterFilterCondition> vencimientoGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'vencimiento',
      value: value,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterFilterCondition> vencimientoLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'vencimiento',
      value: value,
    ));
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes,
      QAfterFilterCondition> vencimientoBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'vencimiento',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension EvaluacionesPendientesQueryLinks on QueryBuilder<
    EvaluacionesPendientes, EvaluacionesPendientes, QFilterCondition> {}

extension EvaluacionesPendientesQueryWhereSortBy
    on QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QSortBy> {
  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      sortByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      sortByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      sortByIntervaloDias() {
    return addSortByInternal('intervaloDias', Sort.asc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      sortByIntervaloDiasDesc() {
    return addSortByInternal('intervaloDias', Sort.desc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      sortByPendiente() {
    return addSortByInternal('pendiente', Sort.asc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      sortByPendienteDesc() {
    return addSortByInternal('pendiente', Sort.desc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      sortByPrivateId() {
    return addSortByInternal('privateId', Sort.asc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      sortByPrivateIdDesc() {
    return addSortByInternal('privateId', Sort.desc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      sortByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      sortByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      sortByTitulo() {
    return addSortByInternal('titulo', Sort.asc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      sortByTituloDesc() {
    return addSortByInternal('titulo', Sort.desc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      sortByVencimiento() {
    return addSortByInternal('vencimiento', Sort.asc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      sortByVencimientoDesc() {
    return addSortByInternal('vencimiento', Sort.desc);
  }
}

extension EvaluacionesPendientesQueryWhereSortThenBy on QueryBuilder<
    EvaluacionesPendientes, EvaluacionesPendientes, QSortThenBy> {
  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      thenByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      thenByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      thenByIntervaloDias() {
    return addSortByInternal('intervaloDias', Sort.asc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      thenByIntervaloDiasDesc() {
    return addSortByInternal('intervaloDias', Sort.desc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      thenByPendiente() {
    return addSortByInternal('pendiente', Sort.asc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      thenByPendienteDesc() {
    return addSortByInternal('pendiente', Sort.desc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      thenByPrivateId() {
    return addSortByInternal('privateId', Sort.asc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      thenByPrivateIdDesc() {
    return addSortByInternal('privateId', Sort.desc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      thenByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      thenByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      thenByTitulo() {
    return addSortByInternal('titulo', Sort.asc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      thenByTituloDesc() {
    return addSortByInternal('titulo', Sort.desc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      thenByVencimiento() {
    return addSortByInternal('vencimiento', Sort.asc);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QAfterSortBy>
      thenByVencimientoDesc() {
    return addSortByInternal('vencimiento', Sort.desc);
  }
}

extension EvaluacionesPendientesQueryWhereDistinct
    on QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QDistinct> {
  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QDistinct>
      distinctByHashCode() {
    return addDistinctByInternal('hashCode');
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QDistinct>
      distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QDistinct>
      distinctByIntervaloDias() {
    return addDistinctByInternal('intervaloDias');
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QDistinct>
      distinctByPendiente() {
    return addDistinctByInternal('pendiente');
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QDistinct>
      distinctByPrivateId() {
    return addDistinctByInternal('privateId');
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QDistinct>
      distinctByStringify() {
    return addDistinctByInternal('stringify');
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QDistinct>
      distinctByTitulo({bool caseSensitive = true}) {
    return addDistinctByInternal('titulo', caseSensitive: caseSensitive);
  }

  QueryBuilder<EvaluacionesPendientes, EvaluacionesPendientes, QDistinct>
      distinctByVencimiento() {
    return addDistinctByInternal('vencimiento');
  }
}

extension EvaluacionesPendientesQueryProperty on QueryBuilder<
    EvaluacionesPendientes, EvaluacionesPendientes, QQueryProperty> {
  QueryBuilder<EvaluacionesPendientes, int, QQueryOperations>
      hashCodeProperty() {
    return addPropertyNameInternal('hashCode');
  }

  QueryBuilder<EvaluacionesPendientes, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<EvaluacionesPendientes, int?, QQueryOperations>
      intervaloDiasProperty() {
    return addPropertyNameInternal('intervaloDias');
  }

  QueryBuilder<EvaluacionesPendientes, bool?, QQueryOperations>
      pendienteProperty() {
    return addPropertyNameInternal('pendiente');
  }

  QueryBuilder<EvaluacionesPendientes, int?, QQueryOperations>
      privateIdProperty() {
    return addPropertyNameInternal('privateId');
  }

  QueryBuilder<EvaluacionesPendientes, bool?, QQueryOperations>
      stringifyProperty() {
    return addPropertyNameInternal('stringify');
  }

  QueryBuilder<EvaluacionesPendientes, String?, QQueryOperations>
      tituloProperty() {
    return addPropertyNameInternal('titulo');
  }

  QueryBuilder<EvaluacionesPendientes, int?, QQueryOperations>
      vencimientoProperty() {
    return addPropertyNameInternal('vencimiento');
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vehiculo _$VehiculoFromJson(Map<String, dynamic> json) => Vehiculo()
  ..id = json['id'] as int?
  ..nombre = json['nombre'] as String?
  ..en_uso = json['en_uso'] as bool?
  ..imei = json['imei'] as String?
  ..marca = json['marca'] as String?
  ..modelo = json['modelo'] as String?
  ..linea = json['linea'] as String?
  ..patente = json['patente'] as String?
  ..pendientes = (json['pendientes'] as List<dynamic>?)
      ?.map((e) => EvaluacionesPendientes.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$VehiculoToJson(Vehiculo instance) => <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'en_uso': instance.en_uso,
      'imei': instance.imei,
      'marca': instance.marca,
      'modelo': instance.modelo,
      'linea': instance.linea,
      'patente': instance.patente,
      'pendientes': instance.pendientes,
    };

EvaluacionesPendientes _$EvaluacionesPendientesFromJson(
        Map<String, dynamic> json) =>
    EvaluacionesPendientes()
      ..id = json['id'] as int?
      ..titulo = json['titulo'] as String?
      ..pendiente = json['pendiente'] as bool?
      ..vencimiento = json['vencimiento'] as int?
      ..intervaloDias = json['intervaloDias'] as int?;

Map<String, dynamic> _$EvaluacionesPendientesToJson(
        EvaluacionesPendientes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titulo': instance.titulo,
      'pendiente': instance.pendiente,
      'vencimiento': instance.vencimiento,
      'intervaloDias': instance.intervaloDias,
    };
