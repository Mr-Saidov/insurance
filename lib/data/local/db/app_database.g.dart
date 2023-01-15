// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $BranchTableTable extends BranchTable
    with TableInfo<$BranchTableTable, BranchTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BranchTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, address, phone];
  @override
  String get aliasedName => _alias ?? 'branch_table';
  @override
  String get actualTableName => 'branch_table';
  @override
  VerificationContext validateIntegrity(Insertable<BranchTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BranchTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BranchTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
    );
  }

  @override
  $BranchTableTable createAlias(String alias) {
    return $BranchTableTable(attachedDatabase, alias);
  }
}

class BranchTableData extends DataClass implements Insertable<BranchTableData> {
  final int? id;
  final String? name;
  final String? address;
  final String? phone;
  const BranchTableData({this.id, this.name, this.address, this.phone});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    return map;
  }

  BranchTableCompanion toCompanion(bool nullToAbsent) {
    return BranchTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
    );
  }

  factory BranchTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BranchTableData(
      id: serializer.fromJson<int?>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      address: serializer.fromJson<String?>(json['address']),
      phone: serializer.fromJson<String?>(json['phone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'name': serializer.toJson<String?>(name),
      'address': serializer.toJson<String?>(address),
      'phone': serializer.toJson<String?>(phone),
    };
  }

  BranchTableData copyWith(
          {Value<int?> id = const Value.absent(),
          Value<String?> name = const Value.absent(),
          Value<String?> address = const Value.absent(),
          Value<String?> phone = const Value.absent()}) =>
      BranchTableData(
        id: id.present ? id.value : this.id,
        name: name.present ? name.value : this.name,
        address: address.present ? address.value : this.address,
        phone: phone.present ? phone.value : this.phone,
      );
  @override
  String toString() {
    return (StringBuffer('BranchTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('phone: $phone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, address, phone);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BranchTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.address == this.address &&
          other.phone == this.phone);
}

class BranchTableCompanion extends UpdateCompanion<BranchTableData> {
  final Value<int?> id;
  final Value<String?> name;
  final Value<String?> address;
  final Value<String?> phone;
  const BranchTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
  });
  BranchTableCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
  });
  static Insertable<BranchTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? address,
    Expression<String>? phone,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (phone != null) 'phone': phone,
    });
  }

  BranchTableCompanion copyWith(
      {Value<int?>? id,
      Value<String?>? name,
      Value<String?>? address,
      Value<String?>? phone}) {
    return BranchTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BranchTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('phone: $phone')
          ..write(')'))
        .toString();
  }
}

class $EmployeeTableTable extends EmployeeTable
    with TableInfo<$EmployeeTableTable, EmployeeTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmployeeTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _pinflMeta = const VerificationMeta('pinfl');
  @override
  late final GeneratedColumn<String> pinfl = GeneratedColumn<String>(
      'pinfl', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _branchIdMeta =
      const VerificationMeta('branchId');
  @override
  late final GeneratedColumn<int> branchId = GeneratedColumn<int>(
      'branch_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, fullName, phone, pinfl, branchId];
  @override
  String get aliasedName => _alias ?? 'employee_table';
  @override
  String get actualTableName => 'employee_table';
  @override
  VerificationContext validateIntegrity(Insertable<EmployeeTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('pinfl')) {
      context.handle(
          _pinflMeta, pinfl.isAcceptableOrUnknown(data['pinfl']!, _pinflMeta));
    }
    if (data.containsKey('branch_id')) {
      context.handle(_branchIdMeta,
          branchId.isAcceptableOrUnknown(data['branch_id']!, _branchIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EmployeeTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EmployeeTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name']),
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      pinfl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pinfl']),
      branchId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}branch_id']),
    );
  }

  @override
  $EmployeeTableTable createAlias(String alias) {
    return $EmployeeTableTable(attachedDatabase, alias);
  }
}

class EmployeeTableData extends DataClass
    implements Insertable<EmployeeTableData> {
  final int? id;
  final String? fullName;
  final String? phone;
  final String? pinfl;
  final int? branchId;
  const EmployeeTableData(
      {this.id, this.fullName, this.phone, this.pinfl, this.branchId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || fullName != null) {
      map['full_name'] = Variable<String>(fullName);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || pinfl != null) {
      map['pinfl'] = Variable<String>(pinfl);
    }
    if (!nullToAbsent || branchId != null) {
      map['branch_id'] = Variable<int>(branchId);
    }
    return map;
  }

  EmployeeTableCompanion toCompanion(bool nullToAbsent) {
    return EmployeeTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      fullName: fullName == null && nullToAbsent
          ? const Value.absent()
          : Value(fullName),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      pinfl:
          pinfl == null && nullToAbsent ? const Value.absent() : Value(pinfl),
      branchId: branchId == null && nullToAbsent
          ? const Value.absent()
          : Value(branchId),
    );
  }

  factory EmployeeTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EmployeeTableData(
      id: serializer.fromJson<int?>(json['id']),
      fullName: serializer.fromJson<String?>(json['fullName']),
      phone: serializer.fromJson<String?>(json['phone']),
      pinfl: serializer.fromJson<String?>(json['pinfl']),
      branchId: serializer.fromJson<int?>(json['branchId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'fullName': serializer.toJson<String?>(fullName),
      'phone': serializer.toJson<String?>(phone),
      'pinfl': serializer.toJson<String?>(pinfl),
      'branchId': serializer.toJson<int?>(branchId),
    };
  }

  EmployeeTableData copyWith(
          {Value<int?> id = const Value.absent(),
          Value<String?> fullName = const Value.absent(),
          Value<String?> phone = const Value.absent(),
          Value<String?> pinfl = const Value.absent(),
          Value<int?> branchId = const Value.absent()}) =>
      EmployeeTableData(
        id: id.present ? id.value : this.id,
        fullName: fullName.present ? fullName.value : this.fullName,
        phone: phone.present ? phone.value : this.phone,
        pinfl: pinfl.present ? pinfl.value : this.pinfl,
        branchId: branchId.present ? branchId.value : this.branchId,
      );
  @override
  String toString() {
    return (StringBuffer('EmployeeTableData(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('phone: $phone, ')
          ..write('pinfl: $pinfl, ')
          ..write('branchId: $branchId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, fullName, phone, pinfl, branchId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmployeeTableData &&
          other.id == this.id &&
          other.fullName == this.fullName &&
          other.phone == this.phone &&
          other.pinfl == this.pinfl &&
          other.branchId == this.branchId);
}

class EmployeeTableCompanion extends UpdateCompanion<EmployeeTableData> {
  final Value<int?> id;
  final Value<String?> fullName;
  final Value<String?> phone;
  final Value<String?> pinfl;
  final Value<int?> branchId;
  const EmployeeTableCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.phone = const Value.absent(),
    this.pinfl = const Value.absent(),
    this.branchId = const Value.absent(),
  });
  EmployeeTableCompanion.insert({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.phone = const Value.absent(),
    this.pinfl = const Value.absent(),
    this.branchId = const Value.absent(),
  });
  static Insertable<EmployeeTableData> custom({
    Expression<int>? id,
    Expression<String>? fullName,
    Expression<String>? phone,
    Expression<String>? pinfl,
    Expression<int>? branchId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (phone != null) 'phone': phone,
      if (pinfl != null) 'pinfl': pinfl,
      if (branchId != null) 'branch_id': branchId,
    });
  }

  EmployeeTableCompanion copyWith(
      {Value<int?>? id,
      Value<String?>? fullName,
      Value<String?>? phone,
      Value<String?>? pinfl,
      Value<int?>? branchId}) {
    return EmployeeTableCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      pinfl: pinfl ?? this.pinfl,
      branchId: branchId ?? this.branchId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (pinfl.present) {
      map['pinfl'] = Variable<String>(pinfl.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<int>(branchId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmployeeTableCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('phone: $phone, ')
          ..write('pinfl: $pinfl, ')
          ..write('branchId: $branchId')
          ..write(')'))
        .toString();
  }
}

class $ClientTableTable extends ClientTable
    with TableInfo<$ClientTableTable, ClientTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClientTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _pinflMeta = const VerificationMeta('pinfl');
  @override
  late final GeneratedColumn<String> pinfl = GeneratedColumn<String>(
      'pinfl', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _branchIdMeta =
      const VerificationMeta('branchId');
  @override
  late final GeneratedColumn<int> branchId = GeneratedColumn<int>(
      'branch_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, fullName, phone, pinfl, branchId];
  @override
  String get aliasedName => _alias ?? 'client_table';
  @override
  String get actualTableName => 'client_table';
  @override
  VerificationContext validateIntegrity(Insertable<ClientTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('pinfl')) {
      context.handle(
          _pinflMeta, pinfl.isAcceptableOrUnknown(data['pinfl']!, _pinflMeta));
    }
    if (data.containsKey('branch_id')) {
      context.handle(_branchIdMeta,
          branchId.isAcceptableOrUnknown(data['branch_id']!, _branchIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ClientTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClientTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name']),
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      pinfl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pinfl']),
      branchId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}branch_id']),
    );
  }

  @override
  $ClientTableTable createAlias(String alias) {
    return $ClientTableTable(attachedDatabase, alias);
  }
}

class ClientTableData extends DataClass implements Insertable<ClientTableData> {
  final int? id;
  final String? fullName;
  final String? phone;
  final String? pinfl;
  final int? branchId;
  const ClientTableData(
      {this.id, this.fullName, this.phone, this.pinfl, this.branchId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || fullName != null) {
      map['full_name'] = Variable<String>(fullName);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || pinfl != null) {
      map['pinfl'] = Variable<String>(pinfl);
    }
    if (!nullToAbsent || branchId != null) {
      map['branch_id'] = Variable<int>(branchId);
    }
    return map;
  }

  ClientTableCompanion toCompanion(bool nullToAbsent) {
    return ClientTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      fullName: fullName == null && nullToAbsent
          ? const Value.absent()
          : Value(fullName),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      pinfl:
          pinfl == null && nullToAbsent ? const Value.absent() : Value(pinfl),
      branchId: branchId == null && nullToAbsent
          ? const Value.absent()
          : Value(branchId),
    );
  }

  factory ClientTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClientTableData(
      id: serializer.fromJson<int?>(json['id']),
      fullName: serializer.fromJson<String?>(json['fullName']),
      phone: serializer.fromJson<String?>(json['phone']),
      pinfl: serializer.fromJson<String?>(json['pinfl']),
      branchId: serializer.fromJson<int?>(json['branchId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'fullName': serializer.toJson<String?>(fullName),
      'phone': serializer.toJson<String?>(phone),
      'pinfl': serializer.toJson<String?>(pinfl),
      'branchId': serializer.toJson<int?>(branchId),
    };
  }

  ClientTableData copyWith(
          {Value<int?> id = const Value.absent(),
          Value<String?> fullName = const Value.absent(),
          Value<String?> phone = const Value.absent(),
          Value<String?> pinfl = const Value.absent(),
          Value<int?> branchId = const Value.absent()}) =>
      ClientTableData(
        id: id.present ? id.value : this.id,
        fullName: fullName.present ? fullName.value : this.fullName,
        phone: phone.present ? phone.value : this.phone,
        pinfl: pinfl.present ? pinfl.value : this.pinfl,
        branchId: branchId.present ? branchId.value : this.branchId,
      );
  @override
  String toString() {
    return (StringBuffer('ClientTableData(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('phone: $phone, ')
          ..write('pinfl: $pinfl, ')
          ..write('branchId: $branchId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, fullName, phone, pinfl, branchId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClientTableData &&
          other.id == this.id &&
          other.fullName == this.fullName &&
          other.phone == this.phone &&
          other.pinfl == this.pinfl &&
          other.branchId == this.branchId);
}

class ClientTableCompanion extends UpdateCompanion<ClientTableData> {
  final Value<int?> id;
  final Value<String?> fullName;
  final Value<String?> phone;
  final Value<String?> pinfl;
  final Value<int?> branchId;
  const ClientTableCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.phone = const Value.absent(),
    this.pinfl = const Value.absent(),
    this.branchId = const Value.absent(),
  });
  ClientTableCompanion.insert({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.phone = const Value.absent(),
    this.pinfl = const Value.absent(),
    this.branchId = const Value.absent(),
  });
  static Insertable<ClientTableData> custom({
    Expression<int>? id,
    Expression<String>? fullName,
    Expression<String>? phone,
    Expression<String>? pinfl,
    Expression<int>? branchId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (phone != null) 'phone': phone,
      if (pinfl != null) 'pinfl': pinfl,
      if (branchId != null) 'branch_id': branchId,
    });
  }

  ClientTableCompanion copyWith(
      {Value<int?>? id,
      Value<String?>? fullName,
      Value<String?>? phone,
      Value<String?>? pinfl,
      Value<int?>? branchId}) {
    return ClientTableCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      pinfl: pinfl ?? this.pinfl,
      branchId: branchId ?? this.branchId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (pinfl.present) {
      map['pinfl'] = Variable<String>(pinfl.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<int>(branchId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClientTableCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('phone: $phone, ')
          ..write('pinfl: $pinfl, ')
          ..write('branchId: $branchId')
          ..write(')'))
        .toString();
  }
}

class $InsuranceTableTable extends InsuranceTable
    with TableInfo<$InsuranceTableTable, InsuranceTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InsuranceTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _employeeIdMeta =
      const VerificationMeta('employeeId');
  @override
  late final GeneratedColumn<int> employeeId = GeneratedColumn<int>(
      'employee_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _clientIdMeta =
      const VerificationMeta('clientId');
  @override
  late final GeneratedColumn<int> clientId = GeneratedColumn<int>(
      'client_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _branchIdMeta =
      const VerificationMeta('branchId');
  @override
  late final GeneratedColumn<int> branchId = GeneratedColumn<int>(
      'branch_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _sumInsuranceMeta =
      const VerificationMeta('sumInsurance');
  @override
  late final GeneratedColumn<String> sumInsurance = GeneratedColumn<String>(
      'sum_insurance', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _insuranceMoneyMeta =
      const VerificationMeta('insuranceMoney');
  @override
  late final GeneratedColumn<String> insuranceMoney = GeneratedColumn<String>(
      'insurance_money', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _percentMeta =
      const VerificationMeta('percent');
  @override
  late final GeneratedColumn<int> percent = GeneratedColumn<int>(
      'percent', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        employeeId,
        clientId,
        branchId,
        sumInsurance,
        insuranceMoney,
        startDate,
        endDate,
        percent
      ];
  @override
  String get aliasedName => _alias ?? 'insurance_table';
  @override
  String get actualTableName => 'insurance_table';
  @override
  VerificationContext validateIntegrity(Insertable<InsuranceTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('employee_id')) {
      context.handle(
          _employeeIdMeta,
          employeeId.isAcceptableOrUnknown(
              data['employee_id']!, _employeeIdMeta));
    }
    if (data.containsKey('client_id')) {
      context.handle(_clientIdMeta,
          clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta));
    }
    if (data.containsKey('branch_id')) {
      context.handle(_branchIdMeta,
          branchId.isAcceptableOrUnknown(data['branch_id']!, _branchIdMeta));
    }
    if (data.containsKey('sum_insurance')) {
      context.handle(
          _sumInsuranceMeta,
          sumInsurance.isAcceptableOrUnknown(
              data['sum_insurance']!, _sumInsuranceMeta));
    }
    if (data.containsKey('insurance_money')) {
      context.handle(
          _insuranceMoneyMeta,
          insuranceMoney.isAcceptableOrUnknown(
              data['insurance_money']!, _insuranceMoneyMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    }
    if (data.containsKey('percent')) {
      context.handle(_percentMeta,
          percent.isAcceptableOrUnknown(data['percent']!, _percentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InsuranceTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InsuranceTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      employeeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}employee_id']),
      clientId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}client_id']),
      branchId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}branch_id']),
      sumInsurance: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sum_insurance']),
      insuranceMoney: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}insurance_money']),
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date']),
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date']),
      percent: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}percent']),
    );
  }

  @override
  $InsuranceTableTable createAlias(String alias) {
    return $InsuranceTableTable(attachedDatabase, alias);
  }
}

class InsuranceTableData extends DataClass
    implements Insertable<InsuranceTableData> {
  final int? id;
  final String? name;
  final int? employeeId;
  final int? clientId;
  final int? branchId;
  final String? sumInsurance;
  final String? insuranceMoney;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? percent;
  const InsuranceTableData(
      {this.id,
      this.name,
      this.employeeId,
      this.clientId,
      this.branchId,
      this.sumInsurance,
      this.insuranceMoney,
      this.startDate,
      this.endDate,
      this.percent});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || employeeId != null) {
      map['employee_id'] = Variable<int>(employeeId);
    }
    if (!nullToAbsent || clientId != null) {
      map['client_id'] = Variable<int>(clientId);
    }
    if (!nullToAbsent || branchId != null) {
      map['branch_id'] = Variable<int>(branchId);
    }
    if (!nullToAbsent || sumInsurance != null) {
      map['sum_insurance'] = Variable<String>(sumInsurance);
    }
    if (!nullToAbsent || insuranceMoney != null) {
      map['insurance_money'] = Variable<String>(insuranceMoney);
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    if (!nullToAbsent || percent != null) {
      map['percent'] = Variable<int>(percent);
    }
    return map;
  }

  InsuranceTableCompanion toCompanion(bool nullToAbsent) {
    return InsuranceTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      employeeId: employeeId == null && nullToAbsent
          ? const Value.absent()
          : Value(employeeId),
      clientId: clientId == null && nullToAbsent
          ? const Value.absent()
          : Value(clientId),
      branchId: branchId == null && nullToAbsent
          ? const Value.absent()
          : Value(branchId),
      sumInsurance: sumInsurance == null && nullToAbsent
          ? const Value.absent()
          : Value(sumInsurance),
      insuranceMoney: insuranceMoney == null && nullToAbsent
          ? const Value.absent()
          : Value(insuranceMoney),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      percent: percent == null && nullToAbsent
          ? const Value.absent()
          : Value(percent),
    );
  }

  factory InsuranceTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InsuranceTableData(
      id: serializer.fromJson<int?>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      employeeId: serializer.fromJson<int?>(json['employeeId']),
      clientId: serializer.fromJson<int?>(json['clientId']),
      branchId: serializer.fromJson<int?>(json['branchId']),
      sumInsurance: serializer.fromJson<String?>(json['sumInsurance']),
      insuranceMoney: serializer.fromJson<String?>(json['insuranceMoney']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      percent: serializer.fromJson<int?>(json['percent']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'name': serializer.toJson<String?>(name),
      'employeeId': serializer.toJson<int?>(employeeId),
      'clientId': serializer.toJson<int?>(clientId),
      'branchId': serializer.toJson<int?>(branchId),
      'sumInsurance': serializer.toJson<String?>(sumInsurance),
      'insuranceMoney': serializer.toJson<String?>(insuranceMoney),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'percent': serializer.toJson<int?>(percent),
    };
  }

  InsuranceTableData copyWith(
          {Value<int?> id = const Value.absent(),
          Value<String?> name = const Value.absent(),
          Value<int?> employeeId = const Value.absent(),
          Value<int?> clientId = const Value.absent(),
          Value<int?> branchId = const Value.absent(),
          Value<String?> sumInsurance = const Value.absent(),
          Value<String?> insuranceMoney = const Value.absent(),
          Value<DateTime?> startDate = const Value.absent(),
          Value<DateTime?> endDate = const Value.absent(),
          Value<int?> percent = const Value.absent()}) =>
      InsuranceTableData(
        id: id.present ? id.value : this.id,
        name: name.present ? name.value : this.name,
        employeeId: employeeId.present ? employeeId.value : this.employeeId,
        clientId: clientId.present ? clientId.value : this.clientId,
        branchId: branchId.present ? branchId.value : this.branchId,
        sumInsurance:
            sumInsurance.present ? sumInsurance.value : this.sumInsurance,
        insuranceMoney:
            insuranceMoney.present ? insuranceMoney.value : this.insuranceMoney,
        startDate: startDate.present ? startDate.value : this.startDate,
        endDate: endDate.present ? endDate.value : this.endDate,
        percent: percent.present ? percent.value : this.percent,
      );
  @override
  String toString() {
    return (StringBuffer('InsuranceTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('employeeId: $employeeId, ')
          ..write('clientId: $clientId, ')
          ..write('branchId: $branchId, ')
          ..write('sumInsurance: $sumInsurance, ')
          ..write('insuranceMoney: $insuranceMoney, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('percent: $percent')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, employeeId, clientId, branchId,
      sumInsurance, insuranceMoney, startDate, endDate, percent);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InsuranceTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.employeeId == this.employeeId &&
          other.clientId == this.clientId &&
          other.branchId == this.branchId &&
          other.sumInsurance == this.sumInsurance &&
          other.insuranceMoney == this.insuranceMoney &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.percent == this.percent);
}

class InsuranceTableCompanion extends UpdateCompanion<InsuranceTableData> {
  final Value<int?> id;
  final Value<String?> name;
  final Value<int?> employeeId;
  final Value<int?> clientId;
  final Value<int?> branchId;
  final Value<String?> sumInsurance;
  final Value<String?> insuranceMoney;
  final Value<DateTime?> startDate;
  final Value<DateTime?> endDate;
  final Value<int?> percent;
  const InsuranceTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.employeeId = const Value.absent(),
    this.clientId = const Value.absent(),
    this.branchId = const Value.absent(),
    this.sumInsurance = const Value.absent(),
    this.insuranceMoney = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.percent = const Value.absent(),
  });
  InsuranceTableCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.employeeId = const Value.absent(),
    this.clientId = const Value.absent(),
    this.branchId = const Value.absent(),
    this.sumInsurance = const Value.absent(),
    this.insuranceMoney = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.percent = const Value.absent(),
  });
  static Insertable<InsuranceTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? employeeId,
    Expression<int>? clientId,
    Expression<int>? branchId,
    Expression<String>? sumInsurance,
    Expression<String>? insuranceMoney,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<int>? percent,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (employeeId != null) 'employee_id': employeeId,
      if (clientId != null) 'client_id': clientId,
      if (branchId != null) 'branch_id': branchId,
      if (sumInsurance != null) 'sum_insurance': sumInsurance,
      if (insuranceMoney != null) 'insurance_money': insuranceMoney,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (percent != null) 'percent': percent,
    });
  }

  InsuranceTableCompanion copyWith(
      {Value<int?>? id,
      Value<String?>? name,
      Value<int?>? employeeId,
      Value<int?>? clientId,
      Value<int?>? branchId,
      Value<String?>? sumInsurance,
      Value<String?>? insuranceMoney,
      Value<DateTime?>? startDate,
      Value<DateTime?>? endDate,
      Value<int?>? percent}) {
    return InsuranceTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      employeeId: employeeId ?? this.employeeId,
      clientId: clientId ?? this.clientId,
      branchId: branchId ?? this.branchId,
      sumInsurance: sumInsurance ?? this.sumInsurance,
      insuranceMoney: insuranceMoney ?? this.insuranceMoney,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      percent: percent ?? this.percent,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (employeeId.present) {
      map['employee_id'] = Variable<int>(employeeId.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<int>(clientId.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<int>(branchId.value);
    }
    if (sumInsurance.present) {
      map['sum_insurance'] = Variable<String>(sumInsurance.value);
    }
    if (insuranceMoney.present) {
      map['insurance_money'] = Variable<String>(insuranceMoney.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (percent.present) {
      map['percent'] = Variable<int>(percent.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InsuranceTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('employeeId: $employeeId, ')
          ..write('clientId: $clientId, ')
          ..write('branchId: $branchId, ')
          ..write('sumInsurance: $sumInsurance, ')
          ..write('insuranceMoney: $insuranceMoney, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('percent: $percent')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $BranchTableTable branchTable = $BranchTableTable(this);
  late final $EmployeeTableTable employeeTable = $EmployeeTableTable(this);
  late final $ClientTableTable clientTable = $ClientTableTable(this);
  late final $InsuranceTableTable insuranceTable = $InsuranceTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [branchTable, employeeTable, clientTable, insuranceTable];
}
