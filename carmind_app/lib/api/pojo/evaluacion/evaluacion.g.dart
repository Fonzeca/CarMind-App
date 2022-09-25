// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluacion.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetEvaluacionDbCollection on Isar {
  IsarCollection<EvaluacionDb> get evaluacionDbs => getCollection();
}

const EvaluacionDbSchema = CollectionSchema(
  name: 'EvaluacionDb',
  schema:
      '{"name":"EvaluacionDb","idName":"id","properties":[{"name":"titulo","type":"String"},{"name":"vehiculo_id","type":"LongList"}],"indexes":[],"links":[{"name":"preguntasDb","target":"PreguntaPojoDb"}]}',
  idName: 'id',
  propertyIds: {'titulo': 0, 'vehiculo_id': 1},
  listProperties: {'vehiculo_id'},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {'preguntasDb': 0},
  backlinkLinkNames: {},
  getId: _evaluacionDbGetId,
  setId: _evaluacionDbSetId,
  getLinks: _evaluacionDbGetLinks,
  attachLinks: _evaluacionDbAttachLinks,
  serializeNative: _evaluacionDbSerializeNative,
  deserializeNative: _evaluacionDbDeserializeNative,
  deserializePropNative: _evaluacionDbDeserializePropNative,
  serializeWeb: _evaluacionDbSerializeWeb,
  deserializeWeb: _evaluacionDbDeserializeWeb,
  deserializePropWeb: _evaluacionDbDeserializePropWeb,
  version: 3,
);

int? _evaluacionDbGetId(EvaluacionDb object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _evaluacionDbSetId(EvaluacionDb object, int id) {
  object.id = id;
}

List<IsarLinkBase> _evaluacionDbGetLinks(EvaluacionDb object) {
  return [object.preguntasDb];
}

void _evaluacionDbSerializeNative(
    IsarCollection<EvaluacionDb> collection,
    IsarRawObject rawObj,
    EvaluacionDb object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.titulo;
  IsarUint8List? _titulo;
  if (value0 != null) {
    _titulo = IsarBinaryWriter.utf8Encoder.convert(value0);
  }
  dynamicSize += (_titulo?.length ?? 0) as int;
  final value1 = object.vehiculo_id;
  dynamicSize += (value1?.length ?? 0) * 8;
  final _vehiculo_id = value1;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _titulo);
  writer.writeLongList(offsets[1], _vehiculo_id);
}

EvaluacionDb _evaluacionDbDeserializeNative(
    IsarCollection<EvaluacionDb> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = EvaluacionDb();
  object.id = id;
  object.titulo = reader.readStringOrNull(offsets[0]);
  object.vehiculo_id = reader.readLongList(offsets[1]);
  _evaluacionDbAttachLinks(collection, id, object);
  return object;
}

P _evaluacionDbDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongList(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _evaluacionDbSerializeWeb(
    IsarCollection<EvaluacionDb> collection, EvaluacionDb object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'titulo', object.titulo);
  IsarNative.jsObjectSet(jsObj, 'vehiculo_id', object.vehiculo_id);
  return jsObj;
}

EvaluacionDb _evaluacionDbDeserializeWeb(
    IsarCollection<EvaluacionDb> collection, dynamic jsObj) {
  final object = EvaluacionDb();
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.titulo = IsarNative.jsObjectGet(jsObj, 'titulo');
  object.vehiculo_id = (IsarNative.jsObjectGet(jsObj, 'vehiculo_id') as List?)
      ?.map((e) => e ?? double.negativeInfinity)
      .toList()
      .cast<int>();
  _evaluacionDbAttachLinks(
      collection, IsarNative.jsObjectGet(jsObj, 'id'), object);
  return object;
}

P _evaluacionDbDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'titulo':
      return (IsarNative.jsObjectGet(jsObj, 'titulo')) as P;
    case 'vehiculo_id':
      return ((IsarNative.jsObjectGet(jsObj, 'vehiculo_id') as List?)
          ?.map((e) => e ?? double.negativeInfinity)
          .toList()
          .cast<int>()) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _evaluacionDbAttachLinks(IsarCollection col, int id, EvaluacionDb object) {
  object.preguntasDb.attach(col, col.isar.preguntaPojoDbs, 'preguntasDb', id);
}

extension EvaluacionDbQueryWhereSort
    on QueryBuilder<EvaluacionDb, EvaluacionDb, QWhere> {
  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension EvaluacionDbQueryWhere
    on QueryBuilder<EvaluacionDb, EvaluacionDb, QWhereClause> {
  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterWhereClause> idEqualTo(
      int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterWhereClause> idNotEqualTo(
      int id) {
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

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterWhereClause> idGreaterThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterWhereClause> idBetween(
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

extension EvaluacionDbQueryFilter
    on QueryBuilder<EvaluacionDb, EvaluacionDb, QFilterCondition> {
  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition> idBetween(
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

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      tituloIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'titulo',
      value: null,
    ));
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition> tituloEqualTo(
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

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      tituloGreaterThan(
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

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      tituloLessThan(
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

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition> tituloBetween(
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

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      tituloStartsWith(
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

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      tituloEndsWith(
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

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      tituloContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'titulo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition> tituloMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'titulo',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      vehiculo_idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'vehiculo_id',
      value: null,
    ));
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      vehiculo_idAnyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'vehiculo_id',
      value: null,
    ));
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      vehiculo_idAnyEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'vehiculo_id',
      value: value,
    ));
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      vehiculo_idAnyGreaterThan(
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

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      vehiculo_idAnyLessThan(
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

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition>
      vehiculo_idAnyBetween(
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

extension EvaluacionDbQueryLinks
    on QueryBuilder<EvaluacionDb, EvaluacionDb, QFilterCondition> {
  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterFilterCondition> preguntasDb(
      FilterQuery<PreguntaPojoDb> q) {
    return linkInternal(
      isar.preguntaPojoDbs,
      q,
      'preguntasDb',
    );
  }
}

extension EvaluacionDbQueryWhereSortBy
    on QueryBuilder<EvaluacionDb, EvaluacionDb, QSortBy> {
  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterSortBy> sortByTitulo() {
    return addSortByInternal('titulo', Sort.asc);
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterSortBy> sortByTituloDesc() {
    return addSortByInternal('titulo', Sort.desc);
  }
}

extension EvaluacionDbQueryWhereSortThenBy
    on QueryBuilder<EvaluacionDb, EvaluacionDb, QSortThenBy> {
  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterSortBy> thenByTitulo() {
    return addSortByInternal('titulo', Sort.asc);
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QAfterSortBy> thenByTituloDesc() {
    return addSortByInternal('titulo', Sort.desc);
  }
}

extension EvaluacionDbQueryWhereDistinct
    on QueryBuilder<EvaluacionDb, EvaluacionDb, QDistinct> {
  QueryBuilder<EvaluacionDb, EvaluacionDb, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<EvaluacionDb, EvaluacionDb, QDistinct> distinctByTitulo(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('titulo', caseSensitive: caseSensitive);
  }
}

extension EvaluacionDbQueryProperty
    on QueryBuilder<EvaluacionDb, EvaluacionDb, QQueryProperty> {
  QueryBuilder<EvaluacionDb, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<EvaluacionDb, String?, QQueryOperations> tituloProperty() {
    return addPropertyNameInternal('titulo');
  }

  QueryBuilder<EvaluacionDb, List<int>?, QQueryOperations>
      vehiculo_idProperty() {
    return addPropertyNameInternal('vehiculo_id');
  }
}

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetPreguntaPojoDbCollection on Isar {
  IsarCollection<PreguntaPojoDb> get preguntaPojoDbs => getCollection();
}

const PreguntaPojoDbSchema = CollectionSchema(
  name: 'PreguntaPojoDb',
  schema:
      '{"name":"PreguntaPojoDb","idName":"id","properties":[{"name":"descripcion","type":"String"},{"name":"tipo","type":"String"}],"indexes":[],"links":[{"name":"opcionesDb","target":"OpcionPojo"}]}',
  idName: 'id',
  propertyIds: {'descripcion': 0, 'tipo': 1},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {'opcionesDb': 0},
  backlinkLinkNames: {},
  getId: _preguntaPojoDbGetId,
  setId: _preguntaPojoDbSetId,
  getLinks: _preguntaPojoDbGetLinks,
  attachLinks: _preguntaPojoDbAttachLinks,
  serializeNative: _preguntaPojoDbSerializeNative,
  deserializeNative: _preguntaPojoDbDeserializeNative,
  deserializePropNative: _preguntaPojoDbDeserializePropNative,
  serializeWeb: _preguntaPojoDbSerializeWeb,
  deserializeWeb: _preguntaPojoDbDeserializeWeb,
  deserializePropWeb: _preguntaPojoDbDeserializePropWeb,
  version: 3,
);

int? _preguntaPojoDbGetId(PreguntaPojoDb object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _preguntaPojoDbSetId(PreguntaPojoDb object, int id) {
  object.id = id;
}

List<IsarLinkBase> _preguntaPojoDbGetLinks(PreguntaPojoDb object) {
  return [object.opcionesDb];
}

void _preguntaPojoDbSerializeNative(
    IsarCollection<PreguntaPojoDb> collection,
    IsarRawObject rawObj,
    PreguntaPojoDb object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.descripcion;
  IsarUint8List? _descripcion;
  if (value0 != null) {
    _descripcion = IsarBinaryWriter.utf8Encoder.convert(value0);
  }
  dynamicSize += (_descripcion?.length ?? 0) as int;
  final value1 = object.tipo;
  IsarUint8List? _tipo;
  if (value1 != null) {
    _tipo = IsarBinaryWriter.utf8Encoder.convert(value1);
  }
  dynamicSize += (_tipo?.length ?? 0) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _descripcion);
  writer.writeBytes(offsets[1], _tipo);
}

PreguntaPojoDb _preguntaPojoDbDeserializeNative(
    IsarCollection<PreguntaPojoDb> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = PreguntaPojoDb();
  object.descripcion = reader.readStringOrNull(offsets[0]);
  object.id = id;
  object.tipo = reader.readStringOrNull(offsets[1]);
  _preguntaPojoDbAttachLinks(collection, id, object);
  return object;
}

P _preguntaPojoDbDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _preguntaPojoDbSerializeWeb(
    IsarCollection<PreguntaPojoDb> collection, PreguntaPojoDb object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'descripcion', object.descripcion);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'tipo', object.tipo);
  return jsObj;
}

PreguntaPojoDb _preguntaPojoDbDeserializeWeb(
    IsarCollection<PreguntaPojoDb> collection, dynamic jsObj) {
  final object = PreguntaPojoDb();
  object.descripcion = IsarNative.jsObjectGet(jsObj, 'descripcion');
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.tipo = IsarNative.jsObjectGet(jsObj, 'tipo');
  _preguntaPojoDbAttachLinks(
      collection, IsarNative.jsObjectGet(jsObj, 'id'), object);
  return object;
}

P _preguntaPojoDbDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'descripcion':
      return (IsarNative.jsObjectGet(jsObj, 'descripcion')) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'tipo':
      return (IsarNative.jsObjectGet(jsObj, 'tipo')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _preguntaPojoDbAttachLinks(
    IsarCollection col, int id, PreguntaPojoDb object) {
  object.opcionesDb.attach(col, col.isar.opcionPojos, 'opcionesDb', id);
}

extension PreguntaPojoDbQueryWhereSort
    on QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QWhere> {
  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension PreguntaPojoDbQueryWhere
    on QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QWhereClause> {
  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterWhereClause> idEqualTo(
      int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterWhereClause> idNotEqualTo(
      int id) {
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

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterWhereClause> idGreaterThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterWhereClause> idLessThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterWhereClause> idBetween(
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

extension PreguntaPojoDbQueryFilter
    on QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QFilterCondition> {
  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      descripcionIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'descripcion',
      value: null,
    ));
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      descripcionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'descripcion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      descripcionGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'descripcion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      descripcionLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'descripcion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      descripcionBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'descripcion',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      descripcionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'descripcion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      descripcionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'descripcion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      descripcionContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'descripcion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      descripcionMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'descripcion',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      tipoIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'tipo',
      value: null,
    ));
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      tipoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'tipo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      tipoGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'tipo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      tipoLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'tipo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      tipoBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'tipo',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      tipoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'tipo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      tipoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'tipo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      tipoContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'tipo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      tipoMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'tipo',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension PreguntaPojoDbQueryLinks
    on QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QFilterCondition> {
  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterFilterCondition>
      opcionesDb(FilterQuery<OpcionPojo> q) {
    return linkInternal(
      isar.opcionPojos,
      q,
      'opcionesDb',
    );
  }
}

extension PreguntaPojoDbQueryWhereSortBy
    on QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QSortBy> {
  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterSortBy>
      sortByDescripcion() {
    return addSortByInternal('descripcion', Sort.asc);
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterSortBy>
      sortByDescripcionDesc() {
    return addSortByInternal('descripcion', Sort.desc);
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterSortBy> sortByTipo() {
    return addSortByInternal('tipo', Sort.asc);
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterSortBy> sortByTipoDesc() {
    return addSortByInternal('tipo', Sort.desc);
  }
}

extension PreguntaPojoDbQueryWhereSortThenBy
    on QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QSortThenBy> {
  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterSortBy>
      thenByDescripcion() {
    return addSortByInternal('descripcion', Sort.asc);
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterSortBy>
      thenByDescripcionDesc() {
    return addSortByInternal('descripcion', Sort.desc);
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterSortBy> thenByTipo() {
    return addSortByInternal('tipo', Sort.asc);
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QAfterSortBy> thenByTipoDesc() {
    return addSortByInternal('tipo', Sort.desc);
  }
}

extension PreguntaPojoDbQueryWhereDistinct
    on QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QDistinct> {
  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QDistinct> distinctByDescripcion(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('descripcion', caseSensitive: caseSensitive);
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QDistinct> distinctByTipo(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('tipo', caseSensitive: caseSensitive);
  }
}

extension PreguntaPojoDbQueryProperty
    on QueryBuilder<PreguntaPojoDb, PreguntaPojoDb, QQueryProperty> {
  QueryBuilder<PreguntaPojoDb, String?, QQueryOperations>
      descripcionProperty() {
    return addPropertyNameInternal('descripcion');
  }

  QueryBuilder<PreguntaPojoDb, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<PreguntaPojoDb, String?, QQueryOperations> tipoProperty() {
    return addPropertyNameInternal('tipo');
  }
}

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetOpcionPojoCollection on Isar {
  IsarCollection<OpcionPojo> get opcionPojos => getCollection();
}

const OpcionPojoSchema = CollectionSchema(
  name: 'OpcionPojo',
  schema:
      '{"name":"OpcionPojo","idName":"id","properties":[{"name":"opcion","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'opcion': 0},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _opcionPojoGetId,
  setId: _opcionPojoSetId,
  getLinks: _opcionPojoGetLinks,
  attachLinks: _opcionPojoAttachLinks,
  serializeNative: _opcionPojoSerializeNative,
  deserializeNative: _opcionPojoDeserializeNative,
  deserializePropNative: _opcionPojoDeserializePropNative,
  serializeWeb: _opcionPojoSerializeWeb,
  deserializeWeb: _opcionPojoDeserializeWeb,
  deserializePropWeb: _opcionPojoDeserializePropWeb,
  version: 3,
);

int? _opcionPojoGetId(OpcionPojo object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _opcionPojoSetId(OpcionPojo object, int id) {
  object.id = id;
}

List<IsarLinkBase> _opcionPojoGetLinks(OpcionPojo object) {
  return [];
}

void _opcionPojoSerializeNative(
    IsarCollection<OpcionPojo> collection,
    IsarRawObject rawObj,
    OpcionPojo object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.opcion;
  IsarUint8List? _opcion;
  if (value0 != null) {
    _opcion = IsarBinaryWriter.utf8Encoder.convert(value0);
  }
  dynamicSize += (_opcion?.length ?? 0) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _opcion);
}

OpcionPojo _opcionPojoDeserializeNative(IsarCollection<OpcionPojo> collection,
    int id, IsarBinaryReader reader, List<int> offsets) {
  final object = OpcionPojo();
  object.id = id;
  object.opcion = reader.readStringOrNull(offsets[0]);
  return object;
}

P _opcionPojoDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _opcionPojoSerializeWeb(
    IsarCollection<OpcionPojo> collection, OpcionPojo object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'opcion', object.opcion);
  return jsObj;
}

OpcionPojo _opcionPojoDeserializeWeb(
    IsarCollection<OpcionPojo> collection, dynamic jsObj) {
  final object = OpcionPojo();
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.opcion = IsarNative.jsObjectGet(jsObj, 'opcion');
  return object;
}

P _opcionPojoDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'opcion':
      return (IsarNative.jsObjectGet(jsObj, 'opcion')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _opcionPojoAttachLinks(IsarCollection col, int id, OpcionPojo object) {}

extension OpcionPojoQueryWhereSort
    on QueryBuilder<OpcionPojo, OpcionPojo, QWhere> {
  QueryBuilder<OpcionPojo, OpcionPojo, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension OpcionPojoQueryWhere
    on QueryBuilder<OpcionPojo, OpcionPojo, QWhereClause> {
  QueryBuilder<OpcionPojo, OpcionPojo, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterWhereClause> idBetween(
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

extension OpcionPojoQueryFilter
    on QueryBuilder<OpcionPojo, OpcionPojo, QFilterCondition> {
  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> idBetween(
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

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> opcionIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'opcion',
      value: null,
    ));
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> opcionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'opcion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> opcionGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'opcion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> opcionLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'opcion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> opcionBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'opcion',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> opcionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'opcion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> opcionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'opcion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> opcionContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'opcion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterFilterCondition> opcionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'opcion',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension OpcionPojoQueryLinks
    on QueryBuilder<OpcionPojo, OpcionPojo, QFilterCondition> {}

extension OpcionPojoQueryWhereSortBy
    on QueryBuilder<OpcionPojo, OpcionPojo, QSortBy> {
  QueryBuilder<OpcionPojo, OpcionPojo, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterSortBy> sortByOpcion() {
    return addSortByInternal('opcion', Sort.asc);
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterSortBy> sortByOpcionDesc() {
    return addSortByInternal('opcion', Sort.desc);
  }
}

extension OpcionPojoQueryWhereSortThenBy
    on QueryBuilder<OpcionPojo, OpcionPojo, QSortThenBy> {
  QueryBuilder<OpcionPojo, OpcionPojo, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterSortBy> thenByOpcion() {
    return addSortByInternal('opcion', Sort.asc);
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QAfterSortBy> thenByOpcionDesc() {
    return addSortByInternal('opcion', Sort.desc);
  }
}

extension OpcionPojoQueryWhereDistinct
    on QueryBuilder<OpcionPojo, OpcionPojo, QDistinct> {
  QueryBuilder<OpcionPojo, OpcionPojo, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<OpcionPojo, OpcionPojo, QDistinct> distinctByOpcion(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('opcion', caseSensitive: caseSensitive);
  }
}

extension OpcionPojoQueryProperty
    on QueryBuilder<OpcionPojo, OpcionPojo, QQueryProperty> {
  QueryBuilder<OpcionPojo, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<OpcionPojo, String?, QQueryOperations> opcionProperty() {
    return addPropertyNameInternal('opcion');
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
