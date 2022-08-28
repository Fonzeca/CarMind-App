// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehiculo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VehiculoAdapter extends TypeAdapter<Vehiculo> {
  @override
  final int typeId = 1;

  @override
  Vehiculo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Vehiculo()
      ..id = fields[0] as int?
      ..nombre = fields[1] as String?
      ..en_uso = fields[2] as bool?
      ..imei = fields[3] as String?
      ..marca = fields[4] as String?
      ..modelo = fields[5] as String?
      ..linea = fields[6] as String?
      ..patente = fields[7] as String?
      ..pendientes = (fields[8] as List?)?.cast<EvaluacionesPendientes>();
  }

  @override
  void write(BinaryWriter writer, Vehiculo obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nombre)
      ..writeByte(2)
      ..write(obj.en_uso)
      ..writeByte(3)
      ..write(obj.imei)
      ..writeByte(4)
      ..write(obj.marca)
      ..writeByte(5)
      ..write(obj.modelo)
      ..writeByte(6)
      ..write(obj.linea)
      ..writeByte(7)
      ..write(obj.patente)
      ..writeByte(8)
      ..write(obj.pendientes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehiculoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EvaluacionesPendientesAdapter
    extends TypeAdapter<EvaluacionesPendientes> {
  @override
  final int typeId = 2;

  @override
  EvaluacionesPendientes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EvaluacionesPendientes()
      ..id = fields[0] as int?
      ..titulo = fields[1] as String?
      ..pendiente = fields[2] as bool?
      ..vencimiento = fields[3] as int?
      ..intervaloDias = fields[4] as int?;
  }

  @override
  void write(BinaryWriter writer, EvaluacionesPendientes obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.titulo)
      ..writeByte(2)
      ..write(obj.pendiente)
      ..writeByte(3)
      ..write(obj.vencimiento)
      ..writeByte(4)
      ..write(obj.intervaloDias);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EvaluacionesPendientesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetVehiculoCollection on Isar {
  IsarCollection<Vehiculo> get vehiculos => getCollection();
}

const VehiculoSchema = CollectionSchema(
  name: 'Vehiculo',
  schema:
      '{"name":"Vehiculo","idName":"id","properties":[{"name":"en_uso","type":"Bool"},{"name":"hashCode","type":"Long"},{"name":"imei","type":"String"},{"name":"linea","type":"String"},{"name":"marca","type":"String"},{"name":"modelo","type":"String"},{"name":"nombre","type":"String"},{"name":"patente","type":"String"},{"name":"stringify","type":"Bool"}],"indexes":[],"links":[]}',
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
  linkIds: {},
  backlinkLinkNames: {},
  getId: _vehiculoGetId,
  setId: _vehiculoSetId,
  getLinks: _vehiculoGetLinks,
  attachLinks: _vehiculoAttachLinks,
  serializeNative: _vehiculoSerializeNative,
  deserializeNative: _vehiculoDeserializeNative,
  deserializePropNative: _vehiculoDeserializePropNative,
  serializeWeb: _vehiculoSerializeWeb,
  deserializeWeb: _vehiculoDeserializeWeb,
  deserializePropWeb: _vehiculoDeserializePropWeb,
  version: 3,
);

int? _vehiculoGetId(Vehiculo object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _vehiculoSetId(Vehiculo object, int id) {
  object.id = id;
}

List<IsarLinkBase> _vehiculoGetLinks(Vehiculo object) {
  return [];
}

void _vehiculoSerializeNative(
    IsarCollection<Vehiculo> collection,
    IsarRawObject rawObj,
    Vehiculo object,
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

Vehiculo _vehiculoDeserializeNative(IsarCollection<Vehiculo> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Vehiculo();
  object.en_uso = reader.readBoolOrNull(offsets[0]);
  object.id = id;
  object.imei = reader.readStringOrNull(offsets[2]);
  object.linea = reader.readStringOrNull(offsets[3]);
  object.marca = reader.readStringOrNull(offsets[4]);
  object.modelo = reader.readStringOrNull(offsets[5]);
  object.nombre = reader.readStringOrNull(offsets[6]);
  object.patente = reader.readStringOrNull(offsets[7]);
  return object;
}

P _vehiculoDeserializePropNative<P>(
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

dynamic _vehiculoSerializeWeb(
    IsarCollection<Vehiculo> collection, Vehiculo object) {
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

Vehiculo _vehiculoDeserializeWeb(
    IsarCollection<Vehiculo> collection, dynamic jsObj) {
  final object = Vehiculo();
  object.en_uso = IsarNative.jsObjectGet(jsObj, 'en_uso');
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.imei = IsarNative.jsObjectGet(jsObj, 'imei');
  object.linea = IsarNative.jsObjectGet(jsObj, 'linea');
  object.marca = IsarNative.jsObjectGet(jsObj, 'marca');
  object.modelo = IsarNative.jsObjectGet(jsObj, 'modelo');
  object.nombre = IsarNative.jsObjectGet(jsObj, 'nombre');
  object.patente = IsarNative.jsObjectGet(jsObj, 'patente');
  return object;
}

P _vehiculoDeserializePropWeb<P>(Object jsObj, String propertyName) {
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

void _vehiculoAttachLinks(IsarCollection col, int id, Vehiculo object) {}

extension VehiculoQueryWhereSort on QueryBuilder<Vehiculo, Vehiculo, QWhere> {
  QueryBuilder<Vehiculo, Vehiculo, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension VehiculoQueryWhere on QueryBuilder<Vehiculo, Vehiculo, QWhereClause> {
  QueryBuilder<Vehiculo, Vehiculo, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterWhereClause> idBetween(
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

extension VehiculoQueryFilter
    on QueryBuilder<Vehiculo, Vehiculo, QFilterCondition> {
  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> en_usoIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'en_uso',
      value: null,
    ));
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> en_usoEqualTo(
      bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'en_uso',
      value: value,
    ));
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> hashCodeEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> hashCodeGreaterThan(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> hashCodeLessThan(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> hashCodeBetween(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> imeiIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'imei',
      value: null,
    ));
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> imeiEqualTo(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> imeiGreaterThan(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> imeiLessThan(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> imeiBetween(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> imeiStartsWith(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> imeiEndsWith(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> imeiContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'imei',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> imeiMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'imei',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> lineaIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'linea',
      value: null,
    ));
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> lineaEqualTo(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> lineaGreaterThan(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> lineaLessThan(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> lineaBetween(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> lineaStartsWith(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> lineaEndsWith(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> lineaContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'linea',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> lineaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'linea',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> marcaIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'marca',
      value: null,
    ));
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> marcaEqualTo(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> marcaGreaterThan(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> marcaLessThan(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> marcaBetween(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> marcaStartsWith(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> marcaEndsWith(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> marcaContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'marca',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> marcaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'marca',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> modeloIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'modelo',
      value: null,
    ));
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> modeloEqualTo(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> modeloGreaterThan(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> modeloLessThan(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> modeloBetween(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> modeloStartsWith(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> modeloEndsWith(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> modeloContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'modelo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> modeloMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'modelo',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> nombreIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'nombre',
      value: null,
    ));
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> nombreEqualTo(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> nombreGreaterThan(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> nombreLessThan(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> nombreBetween(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> nombreStartsWith(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> nombreEndsWith(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> nombreContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'nombre',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> nombreMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'nombre',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> patenteIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'patente',
      value: null,
    ));
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> patenteEqualTo(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> patenteGreaterThan(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> patenteLessThan(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> patenteBetween(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> patenteStartsWith(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> patenteEndsWith(
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

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> patenteContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'patente',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> patenteMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'patente',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> stringifyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'stringify',
      value: null,
    ));
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterFilterCondition> stringifyEqualTo(
      bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'stringify',
      value: value,
    ));
  }
}

extension VehiculoQueryLinks
    on QueryBuilder<Vehiculo, Vehiculo, QFilterCondition> {}

extension VehiculoQueryWhereSortBy
    on QueryBuilder<Vehiculo, Vehiculo, QSortBy> {
  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> sortByEn_uso() {
    return addSortByInternal('en_uso', Sort.asc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> sortByEn_usoDesc() {
    return addSortByInternal('en_uso', Sort.desc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> sortByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> sortByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> sortByImei() {
    return addSortByInternal('imei', Sort.asc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> sortByImeiDesc() {
    return addSortByInternal('imei', Sort.desc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> sortByLinea() {
    return addSortByInternal('linea', Sort.asc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> sortByLineaDesc() {
    return addSortByInternal('linea', Sort.desc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> sortByMarca() {
    return addSortByInternal('marca', Sort.asc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> sortByMarcaDesc() {
    return addSortByInternal('marca', Sort.desc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> sortByModelo() {
    return addSortByInternal('modelo', Sort.asc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> sortByModeloDesc() {
    return addSortByInternal('modelo', Sort.desc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> sortByNombre() {
    return addSortByInternal('nombre', Sort.asc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> sortByNombreDesc() {
    return addSortByInternal('nombre', Sort.desc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> sortByPatente() {
    return addSortByInternal('patente', Sort.asc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> sortByPatenteDesc() {
    return addSortByInternal('patente', Sort.desc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> sortByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> sortByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }
}

extension VehiculoQueryWhereSortThenBy
    on QueryBuilder<Vehiculo, Vehiculo, QSortThenBy> {
  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> thenByEn_uso() {
    return addSortByInternal('en_uso', Sort.asc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> thenByEn_usoDesc() {
    return addSortByInternal('en_uso', Sort.desc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> thenByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> thenByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> thenByImei() {
    return addSortByInternal('imei', Sort.asc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> thenByImeiDesc() {
    return addSortByInternal('imei', Sort.desc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> thenByLinea() {
    return addSortByInternal('linea', Sort.asc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> thenByLineaDesc() {
    return addSortByInternal('linea', Sort.desc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> thenByMarca() {
    return addSortByInternal('marca', Sort.asc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> thenByMarcaDesc() {
    return addSortByInternal('marca', Sort.desc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> thenByModelo() {
    return addSortByInternal('modelo', Sort.asc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> thenByModeloDesc() {
    return addSortByInternal('modelo', Sort.desc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> thenByNombre() {
    return addSortByInternal('nombre', Sort.asc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> thenByNombreDesc() {
    return addSortByInternal('nombre', Sort.desc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> thenByPatente() {
    return addSortByInternal('patente', Sort.asc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> thenByPatenteDesc() {
    return addSortByInternal('patente', Sort.desc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> thenByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<Vehiculo, Vehiculo, QAfterSortBy> thenByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }
}

extension VehiculoQueryWhereDistinct
    on QueryBuilder<Vehiculo, Vehiculo, QDistinct> {
  QueryBuilder<Vehiculo, Vehiculo, QDistinct> distinctByEn_uso() {
    return addDistinctByInternal('en_uso');
  }

  QueryBuilder<Vehiculo, Vehiculo, QDistinct> distinctByHashCode() {
    return addDistinctByInternal('hashCode');
  }

  QueryBuilder<Vehiculo, Vehiculo, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Vehiculo, Vehiculo, QDistinct> distinctByImei(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('imei', caseSensitive: caseSensitive);
  }

  QueryBuilder<Vehiculo, Vehiculo, QDistinct> distinctByLinea(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('linea', caseSensitive: caseSensitive);
  }

  QueryBuilder<Vehiculo, Vehiculo, QDistinct> distinctByMarca(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('marca', caseSensitive: caseSensitive);
  }

  QueryBuilder<Vehiculo, Vehiculo, QDistinct> distinctByModelo(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('modelo', caseSensitive: caseSensitive);
  }

  QueryBuilder<Vehiculo, Vehiculo, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('nombre', caseSensitive: caseSensitive);
  }

  QueryBuilder<Vehiculo, Vehiculo, QDistinct> distinctByPatente(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('patente', caseSensitive: caseSensitive);
  }

  QueryBuilder<Vehiculo, Vehiculo, QDistinct> distinctByStringify() {
    return addDistinctByInternal('stringify');
  }
}

extension VehiculoQueryProperty
    on QueryBuilder<Vehiculo, Vehiculo, QQueryProperty> {
  QueryBuilder<Vehiculo, bool?, QQueryOperations> en_usoProperty() {
    return addPropertyNameInternal('en_uso');
  }

  QueryBuilder<Vehiculo, int, QQueryOperations> hashCodeProperty() {
    return addPropertyNameInternal('hashCode');
  }

  QueryBuilder<Vehiculo, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Vehiculo, String?, QQueryOperations> imeiProperty() {
    return addPropertyNameInternal('imei');
  }

  QueryBuilder<Vehiculo, String?, QQueryOperations> lineaProperty() {
    return addPropertyNameInternal('linea');
  }

  QueryBuilder<Vehiculo, String?, QQueryOperations> marcaProperty() {
    return addPropertyNameInternal('marca');
  }

  QueryBuilder<Vehiculo, String?, QQueryOperations> modeloProperty() {
    return addPropertyNameInternal('modelo');
  }

  QueryBuilder<Vehiculo, String?, QQueryOperations> nombreProperty() {
    return addPropertyNameInternal('nombre');
  }

  QueryBuilder<Vehiculo, String?, QQueryOperations> patenteProperty() {
    return addPropertyNameInternal('patente');
  }

  QueryBuilder<Vehiculo, bool?, QQueryOperations> stringifyProperty() {
    return addPropertyNameInternal('stringify');
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
