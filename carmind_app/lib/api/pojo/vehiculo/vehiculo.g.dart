// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehiculo.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetVehiculoDbCollection on Isar {
  IsarCollection<VehiculoDb> get vehiculoDbs => this.collection();
}

const VehiculoDbSchema = CollectionSchema(
  name: r'VehiculoDb',
  id: 7501981152251640766,
  properties: {
    r'en_uso': PropertySchema(
      id: 0,
      name: r'en_uso',
      type: IsarType.bool,
    ),
    r'imei': PropertySchema(
      id: 1,
      name: r'imei',
      type: IsarType.string,
    ),
    r'kilometraje': PropertySchema(
      id: 2,
      name: r'kilometraje',
      type: IsarType.long,
    ),
    r'linea': PropertySchema(
      id: 3,
      name: r'linea',
      type: IsarType.string,
    ),
    r'marca': PropertySchema(
      id: 4,
      name: r'marca',
      type: IsarType.string,
    ),
    r'modelo': PropertySchema(
      id: 5,
      name: r'modelo',
      type: IsarType.string,
    ),
    r'nombre': PropertySchema(
      id: 6,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'patente': PropertySchema(
      id: 7,
      name: r'patente',
      type: IsarType.string,
    ),
    r'tipo': PropertySchema(
      id: 8,
      name: r'tipo',
      type: IsarType.string,
    )
  },
  estimateSize: _vehiculoDbEstimateSize,
  serialize: _vehiculoDbSerialize,
  deserialize: _vehiculoDbDeserialize,
  deserializeProp: _vehiculoDbDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'pendientesDb': LinkSchema(
      id: -4737466920731331230,
      name: r'pendientesDb',
      target: r'EvaluacionesPendientesDb',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _vehiculoDbGetId,
  getLinks: _vehiculoDbGetLinks,
  attach: _vehiculoDbAttach,
  version: '3.0.2',
);

int _vehiculoDbEstimateSize(
  VehiculoDb object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.imei;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.linea;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.marca;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.modelo;
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
    final value = object.patente;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tipo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _vehiculoDbSerialize(
  VehiculoDb object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.en_uso);
  writer.writeString(offsets[1], object.imei);
  writer.writeLong(offsets[2], object.kilometraje);
  writer.writeString(offsets[3], object.linea);
  writer.writeString(offsets[4], object.marca);
  writer.writeString(offsets[5], object.modelo);
  writer.writeString(offsets[6], object.nombre);
  writer.writeString(offsets[7], object.patente);
  writer.writeString(offsets[8], object.tipo);
}

VehiculoDb _vehiculoDbDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VehiculoDb();
  object.en_uso = reader.readBoolOrNull(offsets[0]);
  object.id = id;
  object.imei = reader.readStringOrNull(offsets[1]);
  object.kilometraje = reader.readLongOrNull(offsets[2]);
  object.linea = reader.readStringOrNull(offsets[3]);
  object.marca = reader.readStringOrNull(offsets[4]);
  object.modelo = reader.readStringOrNull(offsets[5]);
  object.nombre = reader.readStringOrNull(offsets[6]);
  object.patente = reader.readStringOrNull(offsets[7]);
  object.tipo = reader.readStringOrNull(offsets[8]);
  return object;
}

P _vehiculoDbDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
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
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _vehiculoDbGetId(VehiculoDb object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _vehiculoDbGetLinks(VehiculoDb object) {
  return [object.pendientesDb];
}

void _vehiculoDbAttach(IsarCollection<dynamic> col, Id id, VehiculoDb object) {
  object.id = id;
  object.pendientesDb.attach(col,
      col.isar.collection<EvaluacionesPendientesDb>(), r'pendientesDb', id);
}

extension VehiculoDbQueryWhereSort
    on QueryBuilder<VehiculoDb, VehiculoDb, QWhere> {
  QueryBuilder<VehiculoDb, VehiculoDb, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VehiculoDbQueryWhere
    on QueryBuilder<VehiculoDb, VehiculoDb, QWhereClause> {
  QueryBuilder<VehiculoDb, VehiculoDb, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterWhereClause> idBetween(
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

extension VehiculoDbQueryFilter
    on QueryBuilder<VehiculoDb, VehiculoDb, QFilterCondition> {
  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> en_usoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'en_uso',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition>
      en_usoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'en_uso',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> en_usoEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'en_uso',
        value: value,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> idBetween(
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

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> imeiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imei',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> imeiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imei',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> imeiEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> imeiGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> imeiLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> imeiBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imei',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> imeiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> imeiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> imeiContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> imeiMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imei',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> imeiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imei',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> imeiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imei',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition>
      kilometrajeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'kilometraje',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition>
      kilometrajeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'kilometraje',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition>
      kilometrajeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kilometraje',
        value: value,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition>
      kilometrajeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kilometraje',
        value: value,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition>
      kilometrajeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kilometraje',
        value: value,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition>
      kilometrajeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kilometraje',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> lineaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'linea',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> lineaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'linea',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> lineaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> lineaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'linea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> lineaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'linea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> lineaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'linea',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> lineaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'linea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> lineaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'linea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> lineaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'linea',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> lineaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'linea',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> lineaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linea',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition>
      lineaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'linea',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> marcaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'marca',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> marcaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'marca',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> marcaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'marca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> marcaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'marca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> marcaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'marca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> marcaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'marca',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> marcaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'marca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> marcaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'marca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> marcaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'marca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> marcaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'marca',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> marcaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'marca',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition>
      marcaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'marca',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> modeloIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'modelo',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition>
      modeloIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'modelo',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> modeloEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modelo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> modeloGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'modelo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> modeloLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'modelo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> modeloBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'modelo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> modeloStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'modelo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> modeloEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'modelo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> modeloContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'modelo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> modeloMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'modelo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> modeloIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modelo',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition>
      modeloIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'modelo',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> nombreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nombre',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition>
      nombreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nombre',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> nombreEqualTo(
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

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> nombreGreaterThan(
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

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> nombreLessThan(
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

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> nombreBetween(
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

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> nombreStartsWith(
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

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> nombreEndsWith(
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

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> nombreContains(
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

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> nombreMatches(
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

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition>
      nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> patenteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'patente',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition>
      patenteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'patente',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> patenteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'patente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition>
      patenteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'patente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> patenteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'patente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> patenteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'patente',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> patenteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'patente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> patenteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'patente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> patenteContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'patente',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> patenteMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'patente',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> patenteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'patente',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition>
      patenteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'patente',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> tipoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tipo',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> tipoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tipo',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> tipoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> tipoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> tipoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> tipoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tipo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> tipoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> tipoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> tipoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> tipoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tipo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> tipoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipo',
        value: '',
      ));
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> tipoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipo',
        value: '',
      ));
    });
  }
}

extension VehiculoDbQueryObject
    on QueryBuilder<VehiculoDb, VehiculoDb, QFilterCondition> {}

extension VehiculoDbQueryLinks
    on QueryBuilder<VehiculoDb, VehiculoDb, QFilterCondition> {
  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition> pendientesDb(
      FilterQuery<EvaluacionesPendientesDb> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'pendientesDb');
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition>
      pendientesDbLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'pendientesDb', length, true, length, true);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition>
      pendientesDbIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'pendientesDb', 0, true, 0, true);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition>
      pendientesDbIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'pendientesDb', 0, false, 999999, true);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition>
      pendientesDbLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'pendientesDb', 0, true, length, include);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition>
      pendientesDbLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'pendientesDb', length, include, 999999, true);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterFilterCondition>
      pendientesDbLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'pendientesDb', lower, includeLower, upper, includeUpper);
    });
  }
}

extension VehiculoDbQuerySortBy
    on QueryBuilder<VehiculoDb, VehiculoDb, QSortBy> {
  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByEn_uso() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'en_uso', Sort.asc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByEn_usoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'en_uso', Sort.desc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByImei() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imei', Sort.asc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByImeiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imei', Sort.desc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByKilometraje() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kilometraje', Sort.asc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByKilometrajeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kilometraje', Sort.desc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByLinea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linea', Sort.asc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByLineaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linea', Sort.desc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByMarca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marca', Sort.asc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByMarcaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marca', Sort.desc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByModelo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelo', Sort.asc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByModeloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelo', Sort.desc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByPatente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patente', Sort.asc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByPatenteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patente', Sort.desc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> sortByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }
}

extension VehiculoDbQuerySortThenBy
    on QueryBuilder<VehiculoDb, VehiculoDb, QSortThenBy> {
  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByEn_uso() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'en_uso', Sort.asc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByEn_usoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'en_uso', Sort.desc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByImei() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imei', Sort.asc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByImeiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imei', Sort.desc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByKilometraje() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kilometraje', Sort.asc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByKilometrajeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kilometraje', Sort.desc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByLinea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linea', Sort.asc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByLineaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linea', Sort.desc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByMarca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marca', Sort.asc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByMarcaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marca', Sort.desc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByModelo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelo', Sort.asc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByModeloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelo', Sort.desc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByPatente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patente', Sort.asc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByPatenteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patente', Sort.desc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByTipo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.asc);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QAfterSortBy> thenByTipoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipo', Sort.desc);
    });
  }
}

extension VehiculoDbQueryWhereDistinct
    on QueryBuilder<VehiculoDb, VehiculoDb, QDistinct> {
  QueryBuilder<VehiculoDb, VehiculoDb, QDistinct> distinctByEn_uso() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'en_uso');
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QDistinct> distinctByImei(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imei', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QDistinct> distinctByKilometraje() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'kilometraje');
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QDistinct> distinctByLinea(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'linea', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QDistinct> distinctByMarca(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'marca', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QDistinct> distinctByModelo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modelo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QDistinct> distinctByPatente(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'patente', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VehiculoDb, VehiculoDb, QDistinct> distinctByTipo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipo', caseSensitive: caseSensitive);
    });
  }
}

extension VehiculoDbQueryProperty
    on QueryBuilder<VehiculoDb, VehiculoDb, QQueryProperty> {
  QueryBuilder<VehiculoDb, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VehiculoDb, bool?, QQueryOperations> en_usoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'en_uso');
    });
  }

  QueryBuilder<VehiculoDb, String?, QQueryOperations> imeiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imei');
    });
  }

  QueryBuilder<VehiculoDb, int?, QQueryOperations> kilometrajeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kilometraje');
    });
  }

  QueryBuilder<VehiculoDb, String?, QQueryOperations> lineaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'linea');
    });
  }

  QueryBuilder<VehiculoDb, String?, QQueryOperations> marcaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'marca');
    });
  }

  QueryBuilder<VehiculoDb, String?, QQueryOperations> modeloProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modelo');
    });
  }

  QueryBuilder<VehiculoDb, String?, QQueryOperations> nombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre');
    });
  }

  QueryBuilder<VehiculoDb, String?, QQueryOperations> patenteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'patente');
    });
  }

  QueryBuilder<VehiculoDb, String?, QQueryOperations> tipoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipo');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetEvaluacionesPendientesDbCollection on Isar {
  IsarCollection<EvaluacionesPendientesDb> get evaluacionesPendientesDbs =>
      this.collection();
}

const EvaluacionesPendientesDbSchema = CollectionSchema(
  name: r'EvaluacionesPendientesDb',
  id: -7239735741203287752,
  properties: {
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.long,
    ),
    r'intervaloDias': PropertySchema(
      id: 1,
      name: r'intervaloDias',
      type: IsarType.long,
    ),
    r'pendiente': PropertySchema(
      id: 2,
      name: r'pendiente',
      type: IsarType.bool,
    ),
    r'titulo': PropertySchema(
      id: 3,
      name: r'titulo',
      type: IsarType.string,
    ),
    r'vencimiento': PropertySchema(
      id: 4,
      name: r'vencimiento',
      type: IsarType.long,
    )
  },
  estimateSize: _evaluacionesPendientesDbEstimateSize,
  serialize: _evaluacionesPendientesDbSerialize,
  deserialize: _evaluacionesPendientesDbDeserialize,
  deserializeProp: _evaluacionesPendientesDbDeserializeProp,
  idName: r'privateId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _evaluacionesPendientesDbGetId,
  getLinks: _evaluacionesPendientesDbGetLinks,
  attach: _evaluacionesPendientesDbAttach,
  version: '3.0.2',
);

int _evaluacionesPendientesDbEstimateSize(
  EvaluacionesPendientesDb object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.titulo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _evaluacionesPendientesDbSerialize(
  EvaluacionesPendientesDb object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.id);
  writer.writeLong(offsets[1], object.intervaloDias);
  writer.writeBool(offsets[2], object.pendiente);
  writer.writeString(offsets[3], object.titulo);
  writer.writeLong(offsets[4], object.vencimiento);
}

EvaluacionesPendientesDb _evaluacionesPendientesDbDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EvaluacionesPendientesDb();
  object.id = reader.readLongOrNull(offsets[0]);
  object.intervaloDias = reader.readLongOrNull(offsets[1]);
  object.pendiente = reader.readBoolOrNull(offsets[2]);
  object.privateId = id;
  object.titulo = reader.readStringOrNull(offsets[3]);
  object.vencimiento = reader.readLongOrNull(offsets[4]);
  return object;
}

P _evaluacionesPendientesDbDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _evaluacionesPendientesDbGetId(EvaluacionesPendientesDb object) {
  return object.privateId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _evaluacionesPendientesDbGetLinks(
    EvaluacionesPendientesDb object) {
  return [];
}

void _evaluacionesPendientesDbAttach(
    IsarCollection<dynamic> col, Id id, EvaluacionesPendientesDb object) {
  object.privateId = id;
}

extension EvaluacionesPendientesDbQueryWhereSort on QueryBuilder<
    EvaluacionesPendientesDb, EvaluacionesPendientesDb, QWhere> {
  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb, QAfterWhere>
      anyPrivateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EvaluacionesPendientesDbQueryWhere on QueryBuilder<
    EvaluacionesPendientesDb, EvaluacionesPendientesDb, QWhereClause> {
  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterWhereClause> privateIdEqualTo(Id privateId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: privateId,
        upper: privateId,
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterWhereClause> privateIdNotEqualTo(Id privateId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: privateId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: privateId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: privateId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: privateId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
          QAfterWhereClause>
      privateIdGreaterThan(Id privateId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: privateId, includeLower: include),
      );
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
          QAfterWhereClause>
      privateIdLessThan(Id privateId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: privateId, includeUpper: include),
      );
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterWhereClause> privateIdBetween(
    Id lowerPrivateId,
    Id upperPrivateId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerPrivateId,
        includeLower: includeLower,
        upper: upperPrivateId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension EvaluacionesPendientesDbQueryFilter on QueryBuilder<
    EvaluacionesPendientesDb, EvaluacionesPendientesDb, QFilterCondition> {
  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> idGreaterThan(
    int? value, {
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

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> idLessThan(
    int? value, {
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

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> intervaloDiasIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'intervaloDias',
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> intervaloDiasIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'intervaloDias',
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> intervaloDiasEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'intervaloDias',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> intervaloDiasGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'intervaloDias',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> intervaloDiasLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'intervaloDias',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> intervaloDiasBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'intervaloDias',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> pendienteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pendiente',
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> pendienteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pendiente',
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> pendienteEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pendiente',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> privateIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'privateId',
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> privateIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'privateId',
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> privateIdEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'privateId',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> privateIdGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'privateId',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> privateIdLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'privateId',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> privateIdBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'privateId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> tituloIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'titulo',
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> tituloIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'titulo',
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> tituloEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> tituloGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> tituloLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> tituloBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'titulo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> tituloStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> tituloEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
          QAfterFilterCondition>
      tituloContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'titulo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
          QAfterFilterCondition>
      tituloMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'titulo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> tituloIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titulo',
        value: '',
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> tituloIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'titulo',
        value: '',
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> vencimientoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vencimiento',
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> vencimientoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vencimiento',
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> vencimientoEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vencimiento',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> vencimientoGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vencimiento',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> vencimientoLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vencimiento',
        value: value,
      ));
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb,
      QAfterFilterCondition> vencimientoBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vencimiento',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension EvaluacionesPendientesDbQueryObject on QueryBuilder<
    EvaluacionesPendientesDb, EvaluacionesPendientesDb, QFilterCondition> {}

extension EvaluacionesPendientesDbQueryLinks on QueryBuilder<
    EvaluacionesPendientesDb, EvaluacionesPendientesDb, QFilterCondition> {}

extension EvaluacionesPendientesDbQuerySortBy on QueryBuilder<
    EvaluacionesPendientesDb, EvaluacionesPendientesDb, QSortBy> {
  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb, QAfterSortBy>
      sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb, QAfterSortBy>
      sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb, QAfterSortBy>
      sortByIntervaloDias() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intervaloDias', Sort.asc);
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb, QAfterSortBy>
      sortByIntervaloDiasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intervaloDias', Sort.desc);
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb, QAfterSortBy>
      sortByPendiente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendiente', Sort.asc);
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb, QAfterSortBy>
      sortByPendienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendiente', Sort.desc);
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb, QAfterSortBy>
      sortByTitulo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.asc);
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb, QAfterSortBy>
      sortByTituloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.desc);
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb, QAfterSortBy>
      sortByVencimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vencimiento', Sort.asc);
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb, QAfterSortBy>
      sortByVencimientoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vencimiento', Sort.desc);
    });
  }
}

extension EvaluacionesPendientesDbQuerySortThenBy on QueryBuilder<
    EvaluacionesPendientesDb, EvaluacionesPendientesDb, QSortThenBy> {
  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb, QAfterSortBy>
      thenByIntervaloDias() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intervaloDias', Sort.asc);
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb, QAfterSortBy>
      thenByIntervaloDiasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intervaloDias', Sort.desc);
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb, QAfterSortBy>
      thenByPendiente() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendiente', Sort.asc);
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb, QAfterSortBy>
      thenByPendienteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendiente', Sort.desc);
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb, QAfterSortBy>
      thenByPrivateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'privateId', Sort.asc);
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb, QAfterSortBy>
      thenByPrivateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'privateId', Sort.desc);
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb, QAfterSortBy>
      thenByTitulo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.asc);
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb, QAfterSortBy>
      thenByTituloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titulo', Sort.desc);
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb, QAfterSortBy>
      thenByVencimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vencimiento', Sort.asc);
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb, QAfterSortBy>
      thenByVencimientoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vencimiento', Sort.desc);
    });
  }
}

extension EvaluacionesPendientesDbQueryWhereDistinct on QueryBuilder<
    EvaluacionesPendientesDb, EvaluacionesPendientesDb, QDistinct> {
  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb, QDistinct>
      distinctById() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id');
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb, QDistinct>
      distinctByIntervaloDias() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'intervaloDias');
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb, QDistinct>
      distinctByPendiente() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pendiente');
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb, QDistinct>
      distinctByTitulo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'titulo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, EvaluacionesPendientesDb, QDistinct>
      distinctByVencimiento() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vencimiento');
    });
  }
}

extension EvaluacionesPendientesDbQueryProperty on QueryBuilder<
    EvaluacionesPendientesDb, EvaluacionesPendientesDb, QQueryProperty> {
  QueryBuilder<EvaluacionesPendientesDb, int, QQueryOperations>
      privateIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'privateId');
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, int?, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, int?, QQueryOperations>
      intervaloDiasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'intervaloDias');
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, bool?, QQueryOperations>
      pendienteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pendiente');
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, String?, QQueryOperations>
      tituloProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titulo');
    });
  }

  QueryBuilder<EvaluacionesPendientesDb, int?, QQueryOperations>
      vencimientoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vencimiento');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vehiculo _$VehiculoFromJson(Map<String, dynamic> json) => Vehiculo()
  ..id = json['id'] as int?
  ..nombre = json['nombre'] as String?
  ..en_uso = json['en_uso'] as bool?
  ..kilometraje = json['kilometraje'] as int?
  ..marca = json['marca'] as String?
  ..modelo = json['modelo'] as String?
  ..linea = json['linea'] as String?
  ..patente = json['patente'] as String?
  ..imei = json['imei'] as String?
  ..tipo = json['tipo'] as String?
  ..pendientes = (json['pendientes'] as List<dynamic>?)
      ?.map((e) => EvaluacionesPendientes.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$VehiculoToJson(Vehiculo instance) => <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'en_uso': instance.en_uso,
      'kilometraje': instance.kilometraje,
      'marca': instance.marca,
      'modelo': instance.modelo,
      'linea': instance.linea,
      'patente': instance.patente,
      'imei': instance.imei,
      'tipo': instance.tipo,
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
