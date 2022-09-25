// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_user.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetLoggedUserCollection on Isar {
  IsarCollection<LoggedUser> get loggedUsers => getCollection();
}

const LoggedUserSchema = CollectionSchema(
  name: 'LoggedUser',
  schema:
      '{"name":"LoggedUser","idName":"id","properties":[{"name":"administrador","type":"Bool"},{"name":"apellido","type":"String"},{"name":"dni","type":"String"},{"name":"empresa","type":"Long"},{"name":"nombre","type":"String"},{"name":"username","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'administrador': 0,
    'apellido': 1,
    'dni': 2,
    'empresa': 3,
    'nombre': 4,
    'username': 5
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _loggedUserGetId,
  setId: _loggedUserSetId,
  getLinks: _loggedUserGetLinks,
  attachLinks: _loggedUserAttachLinks,
  serializeNative: _loggedUserSerializeNative,
  deserializeNative: _loggedUserDeserializeNative,
  deserializePropNative: _loggedUserDeserializePropNative,
  serializeWeb: _loggedUserSerializeWeb,
  deserializeWeb: _loggedUserDeserializeWeb,
  deserializePropWeb: _loggedUserDeserializePropWeb,
  version: 3,
);

int? _loggedUserGetId(LoggedUser object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _loggedUserSetId(LoggedUser object, int id) {
  object.id = id;
}

List<IsarLinkBase> _loggedUserGetLinks(LoggedUser object) {
  return [];
}

void _loggedUserSerializeNative(
    IsarCollection<LoggedUser> collection,
    IsarRawObject rawObj,
    LoggedUser object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.administrador;
  final _administrador = value0;
  final value1 = object.apellido;
  IsarUint8List? _apellido;
  if (value1 != null) {
    _apellido = IsarBinaryWriter.utf8Encoder.convert(value1);
  }
  dynamicSize += (_apellido?.length ?? 0) as int;
  final value2 = object.dni;
  IsarUint8List? _dni;
  if (value2 != null) {
    _dni = IsarBinaryWriter.utf8Encoder.convert(value2);
  }
  dynamicSize += (_dni?.length ?? 0) as int;
  final value3 = object.empresa;
  final _empresa = value3;
  final value4 = object.nombre;
  IsarUint8List? _nombre;
  if (value4 != null) {
    _nombre = IsarBinaryWriter.utf8Encoder.convert(value4);
  }
  dynamicSize += (_nombre?.length ?? 0) as int;
  final value5 = object.username;
  IsarUint8List? _username;
  if (value5 != null) {
    _username = IsarBinaryWriter.utf8Encoder.convert(value5);
  }
  dynamicSize += (_username?.length ?? 0) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBool(offsets[0], _administrador);
  writer.writeBytes(offsets[1], _apellido);
  writer.writeBytes(offsets[2], _dni);
  writer.writeLong(offsets[3], _empresa);
  writer.writeBytes(offsets[4], _nombre);
  writer.writeBytes(offsets[5], _username);
}

LoggedUser _loggedUserDeserializeNative(IsarCollection<LoggedUser> collection,
    int id, IsarBinaryReader reader, List<int> offsets) {
  final object = LoggedUser();
  object.administrador = reader.readBoolOrNull(offsets[0]);
  object.apellido = reader.readStringOrNull(offsets[1]);
  object.dni = reader.readStringOrNull(offsets[2]);
  object.empresa = reader.readLongOrNull(offsets[3]);
  object.id = id;
  object.nombre = reader.readStringOrNull(offsets[4]);
  object.username = reader.readStringOrNull(offsets[5]);
  return object;
}

P _loggedUserDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _loggedUserSerializeWeb(
    IsarCollection<LoggedUser> collection, LoggedUser object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'administrador', object.administrador);
  IsarNative.jsObjectSet(jsObj, 'apellido', object.apellido);
  IsarNative.jsObjectSet(jsObj, 'dni', object.dni);
  IsarNative.jsObjectSet(jsObj, 'empresa', object.empresa);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'nombre', object.nombre);
  IsarNative.jsObjectSet(jsObj, 'username', object.username);
  return jsObj;
}

LoggedUser _loggedUserDeserializeWeb(
    IsarCollection<LoggedUser> collection, dynamic jsObj) {
  final object = LoggedUser();
  object.administrador = IsarNative.jsObjectGet(jsObj, 'administrador');
  object.apellido = IsarNative.jsObjectGet(jsObj, 'apellido');
  object.dni = IsarNative.jsObjectGet(jsObj, 'dni');
  object.empresa = IsarNative.jsObjectGet(jsObj, 'empresa');
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.nombre = IsarNative.jsObjectGet(jsObj, 'nombre');
  object.username = IsarNative.jsObjectGet(jsObj, 'username');
  return object;
}

P _loggedUserDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'administrador':
      return (IsarNative.jsObjectGet(jsObj, 'administrador')) as P;
    case 'apellido':
      return (IsarNative.jsObjectGet(jsObj, 'apellido')) as P;
    case 'dni':
      return (IsarNative.jsObjectGet(jsObj, 'dni')) as P;
    case 'empresa':
      return (IsarNative.jsObjectGet(jsObj, 'empresa')) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'nombre':
      return (IsarNative.jsObjectGet(jsObj, 'nombre')) as P;
    case 'username':
      return (IsarNative.jsObjectGet(jsObj, 'username')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _loggedUserAttachLinks(IsarCollection col, int id, LoggedUser object) {}

extension LoggedUserQueryWhereSort
    on QueryBuilder<LoggedUser, LoggedUser, QWhere> {
  QueryBuilder<LoggedUser, LoggedUser, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension LoggedUserQueryWhere
    on QueryBuilder<LoggedUser, LoggedUser, QWhereClause> {
  QueryBuilder<LoggedUser, LoggedUser, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<LoggedUser, LoggedUser, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterWhereClause> idBetween(
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

extension LoggedUserQueryFilter
    on QueryBuilder<LoggedUser, LoggedUser, QFilterCondition> {
  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition>
      administradorIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'administrador',
      value: null,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition>
      administradorEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'administrador',
      value: value,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> apellidoIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'apellido',
      value: null,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> apellidoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'apellido',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition>
      apellidoGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'apellido',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> apellidoLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'apellido',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> apellidoBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'apellido',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition>
      apellidoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'apellido',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> apellidoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'apellido',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> apellidoContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'apellido',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> apellidoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'apellido',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> dniIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'dni',
      value: null,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> dniEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'dni',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> dniGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'dni',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> dniLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'dni',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> dniBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'dni',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> dniStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'dni',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> dniEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'dni',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> dniContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'dni',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> dniMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'dni',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> empresaIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'empresa',
      value: null,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> empresaEqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'empresa',
      value: value,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition>
      empresaGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'empresa',
      value: value,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> empresaLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'empresa',
      value: value,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> empresaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'empresa',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> idBetween(
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

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> nombreIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'nombre',
      value: null,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> nombreEqualTo(
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

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> nombreGreaterThan(
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

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> nombreLessThan(
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

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> nombreBetween(
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

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> nombreStartsWith(
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

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> nombreEndsWith(
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

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> nombreContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'nombre',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> nombreMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'nombre',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> usernameIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'username',
      value: null,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> usernameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'username',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition>
      usernameGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'username',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> usernameLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'username',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> usernameBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'username',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition>
      usernameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'username',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> usernameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'username',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> usernameContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'username',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> usernameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'username',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension LoggedUserQueryLinks
    on QueryBuilder<LoggedUser, LoggedUser, QFilterCondition> {}

extension LoggedUserQueryWhereSortBy
    on QueryBuilder<LoggedUser, LoggedUser, QSortBy> {
  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> sortByAdministrador() {
    return addSortByInternal('administrador', Sort.asc);
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> sortByAdministradorDesc() {
    return addSortByInternal('administrador', Sort.desc);
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> sortByApellido() {
    return addSortByInternal('apellido', Sort.asc);
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> sortByApellidoDesc() {
    return addSortByInternal('apellido', Sort.desc);
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> sortByDni() {
    return addSortByInternal('dni', Sort.asc);
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> sortByDniDesc() {
    return addSortByInternal('dni', Sort.desc);
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> sortByEmpresa() {
    return addSortByInternal('empresa', Sort.asc);
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> sortByEmpresaDesc() {
    return addSortByInternal('empresa', Sort.desc);
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> sortByNombre() {
    return addSortByInternal('nombre', Sort.asc);
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> sortByNombreDesc() {
    return addSortByInternal('nombre', Sort.desc);
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> sortByUsername() {
    return addSortByInternal('username', Sort.asc);
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> sortByUsernameDesc() {
    return addSortByInternal('username', Sort.desc);
  }
}

extension LoggedUserQueryWhereSortThenBy
    on QueryBuilder<LoggedUser, LoggedUser, QSortThenBy> {
  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> thenByAdministrador() {
    return addSortByInternal('administrador', Sort.asc);
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> thenByAdministradorDesc() {
    return addSortByInternal('administrador', Sort.desc);
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> thenByApellido() {
    return addSortByInternal('apellido', Sort.asc);
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> thenByApellidoDesc() {
    return addSortByInternal('apellido', Sort.desc);
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> thenByDni() {
    return addSortByInternal('dni', Sort.asc);
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> thenByDniDesc() {
    return addSortByInternal('dni', Sort.desc);
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> thenByEmpresa() {
    return addSortByInternal('empresa', Sort.asc);
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> thenByEmpresaDesc() {
    return addSortByInternal('empresa', Sort.desc);
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> thenByNombre() {
    return addSortByInternal('nombre', Sort.asc);
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> thenByNombreDesc() {
    return addSortByInternal('nombre', Sort.desc);
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> thenByUsername() {
    return addSortByInternal('username', Sort.asc);
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> thenByUsernameDesc() {
    return addSortByInternal('username', Sort.desc);
  }
}

extension LoggedUserQueryWhereDistinct
    on QueryBuilder<LoggedUser, LoggedUser, QDistinct> {
  QueryBuilder<LoggedUser, LoggedUser, QDistinct> distinctByAdministrador() {
    return addDistinctByInternal('administrador');
  }

  QueryBuilder<LoggedUser, LoggedUser, QDistinct> distinctByApellido(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('apellido', caseSensitive: caseSensitive);
  }

  QueryBuilder<LoggedUser, LoggedUser, QDistinct> distinctByDni(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('dni', caseSensitive: caseSensitive);
  }

  QueryBuilder<LoggedUser, LoggedUser, QDistinct> distinctByEmpresa() {
    return addDistinctByInternal('empresa');
  }

  QueryBuilder<LoggedUser, LoggedUser, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<LoggedUser, LoggedUser, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('nombre', caseSensitive: caseSensitive);
  }

  QueryBuilder<LoggedUser, LoggedUser, QDistinct> distinctByUsername(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('username', caseSensitive: caseSensitive);
  }
}

extension LoggedUserQueryProperty
    on QueryBuilder<LoggedUser, LoggedUser, QQueryProperty> {
  QueryBuilder<LoggedUser, bool?, QQueryOperations> administradorProperty() {
    return addPropertyNameInternal('administrador');
  }

  QueryBuilder<LoggedUser, String?, QQueryOperations> apellidoProperty() {
    return addPropertyNameInternal('apellido');
  }

  QueryBuilder<LoggedUser, String?, QQueryOperations> dniProperty() {
    return addPropertyNameInternal('dni');
  }

  QueryBuilder<LoggedUser, int?, QQueryOperations> empresaProperty() {
    return addPropertyNameInternal('empresa');
  }

  QueryBuilder<LoggedUser, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<LoggedUser, String?, QQueryOperations> nombreProperty() {
    return addPropertyNameInternal('nombre');
  }

  QueryBuilder<LoggedUser, String?, QQueryOperations> usernameProperty() {
    return addPropertyNameInternal('username');
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoggedUser _$LoggedUserFromJson(Map<String, dynamic> json) => LoggedUser()
  ..id = json['id'] as int?
  ..nombre = json['nombre'] as String?
  ..apellido = json['apellido'] as String?
  ..username = json['username'] as String?
  ..dni = json['dni'] as String?
  ..empresa = json['empresa'] as int?
  ..administrador = json['administrador'] as bool?;

Map<String, dynamic> _$LoggedUserToJson(LoggedUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'apellido': instance.apellido,
      'username': instance.username,
      'dni': instance.dni,
      'empresa': instance.empresa,
      'administrador': instance.administrador,
    };
