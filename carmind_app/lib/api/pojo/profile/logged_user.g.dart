// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_user.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetLoggedUserCollection on Isar {
  IsarCollection<LoggedUser> get loggedUsers => this.collection();
}

const LoggedUserSchema = CollectionSchema(
  name: r'LoggedUser',
  id: 2799415558654235009,
  properties: {
    r'administrador': PropertySchema(
      id: 0,
      name: r'administrador',
      type: IsarType.bool,
    ),
    r'apellido': PropertySchema(
      id: 1,
      name: r'apellido',
      type: IsarType.string,
    ),
    r'dni': PropertySchema(
      id: 2,
      name: r'dni',
      type: IsarType.string,
    ),
    r'empresa': PropertySchema(
      id: 3,
      name: r'empresa',
      type: IsarType.long,
    ),
    r'nombre': PropertySchema(
      id: 4,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'username': PropertySchema(
      id: 5,
      name: r'username',
      type: IsarType.string,
    )
  },
  estimateSize: _loggedUserEstimateSize,
  serialize: _loggedUserSerialize,
  deserialize: _loggedUserDeserialize,
  deserializeProp: _loggedUserDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _loggedUserGetId,
  getLinks: _loggedUserGetLinks,
  attach: _loggedUserAttach,
  version: '3.0.2',
);

int _loggedUserEstimateSize(
  LoggedUser object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.apellido;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.dni;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nombre;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.username;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _loggedUserSerialize(
  LoggedUser object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.administrador);
  writer.writeString(offsets[1], object.apellido);
  writer.writeString(offsets[2], object.dni);
  writer.writeLong(offsets[3], object.empresa);
  writer.writeString(offsets[4], object.nombre);
  writer.writeString(offsets[5], object.username);
}

LoggedUser _loggedUserDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
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

P _loggedUserDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
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
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _loggedUserGetId(LoggedUser object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _loggedUserGetLinks(LoggedUser object) {
  return [];
}

void _loggedUserAttach(IsarCollection<dynamic> col, Id id, LoggedUser object) {
  object.id = id;
}

extension LoggedUserQueryWhereSort
    on QueryBuilder<LoggedUser, LoggedUser, QWhere> {
  QueryBuilder<LoggedUser, LoggedUser, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LoggedUserQueryWhere
    on QueryBuilder<LoggedUser, LoggedUser, QWhereClause> {
  QueryBuilder<LoggedUser, LoggedUser, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<LoggedUser, LoggedUser, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterWhereClause> idBetween(
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

extension LoggedUserQueryFilter
    on QueryBuilder<LoggedUser, LoggedUser, QFilterCondition> {
  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition>
      administradorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'administrador',
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition>
      administradorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'administrador',
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition>
      administradorEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'administrador',
        value: value,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> apellidoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'apellido',
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition>
      apellidoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'apellido',
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> apellidoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apellido',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition>
      apellidoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'apellido',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> apellidoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'apellido',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> apellidoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'apellido',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition>
      apellidoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'apellido',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> apellidoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'apellido',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> apellidoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'apellido',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> apellidoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'apellido',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition>
      apellidoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apellido',
        value: '',
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition>
      apellidoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'apellido',
        value: '',
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> dniIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dni',
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> dniIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dni',
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> dniEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dni',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> dniGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dni',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> dniLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dni',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> dniBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dni',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> dniStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dni',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> dniEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dni',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> dniContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dni',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> dniMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dni',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> dniIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dni',
        value: '',
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> dniIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dni',
        value: '',
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> empresaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'empresa',
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition>
      empresaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'empresa',
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> empresaEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'empresa',
        value: value,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition>
      empresaGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'empresa',
        value: value,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> empresaLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'empresa',
        value: value,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> empresaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'empresa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> idBetween(
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

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> nombreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nombre',
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition>
      nombreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nombre',
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> nombreEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> nombreGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> nombreLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> nombreBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> nombreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> nombreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> nombreContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> nombreMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition>
      nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> usernameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'username',
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition>
      usernameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'username',
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> usernameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition>
      usernameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> usernameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> usernameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'username',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition>
      usernameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> usernameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> usernameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition> usernameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'username',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition>
      usernameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'username',
        value: '',
      ));
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterFilterCondition>
      usernameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'username',
        value: '',
      ));
    });
  }
}

extension LoggedUserQueryObject
    on QueryBuilder<LoggedUser, LoggedUser, QFilterCondition> {}

extension LoggedUserQueryLinks
    on QueryBuilder<LoggedUser, LoggedUser, QFilterCondition> {}

extension LoggedUserQuerySortBy
    on QueryBuilder<LoggedUser, LoggedUser, QSortBy> {
  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> sortByAdministrador() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'administrador', Sort.asc);
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> sortByAdministradorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'administrador', Sort.desc);
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> sortByApellido() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apellido', Sort.asc);
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> sortByApellidoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apellido', Sort.desc);
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> sortByDni() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dni', Sort.asc);
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> sortByDniDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dni', Sort.desc);
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> sortByEmpresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'empresa', Sort.asc);
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> sortByEmpresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'empresa', Sort.desc);
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> sortByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> sortByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> sortByUsername() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.asc);
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> sortByUsernameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.desc);
    });
  }
}

extension LoggedUserQuerySortThenBy
    on QueryBuilder<LoggedUser, LoggedUser, QSortThenBy> {
  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> thenByAdministrador() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'administrador', Sort.asc);
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> thenByAdministradorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'administrador', Sort.desc);
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> thenByApellido() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apellido', Sort.asc);
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> thenByApellidoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apellido', Sort.desc);
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> thenByDni() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dni', Sort.asc);
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> thenByDniDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dni', Sort.desc);
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> thenByEmpresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'empresa', Sort.asc);
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> thenByEmpresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'empresa', Sort.desc);
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> thenByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> thenByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> thenByUsername() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.asc);
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QAfterSortBy> thenByUsernameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.desc);
    });
  }
}

extension LoggedUserQueryWhereDistinct
    on QueryBuilder<LoggedUser, LoggedUser, QDistinct> {
  QueryBuilder<LoggedUser, LoggedUser, QDistinct> distinctByAdministrador() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'administrador');
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QDistinct> distinctByApellido(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'apellido', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QDistinct> distinctByDni(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dni', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QDistinct> distinctByEmpresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'empresa');
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LoggedUser, LoggedUser, QDistinct> distinctByUsername(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'username', caseSensitive: caseSensitive);
    });
  }
}

extension LoggedUserQueryProperty
    on QueryBuilder<LoggedUser, LoggedUser, QQueryProperty> {
  QueryBuilder<LoggedUser, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LoggedUser, bool?, QQueryOperations> administradorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'administrador');
    });
  }

  QueryBuilder<LoggedUser, String?, QQueryOperations> apellidoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'apellido');
    });
  }

  QueryBuilder<LoggedUser, String?, QQueryOperations> dniProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dni');
    });
  }

  QueryBuilder<LoggedUser, int?, QQueryOperations> empresaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'empresa');
    });
  }

  QueryBuilder<LoggedUser, String?, QQueryOperations> nombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre');
    });
  }

  QueryBuilder<LoggedUser, String?, QQueryOperations> usernameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'username');
    });
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
