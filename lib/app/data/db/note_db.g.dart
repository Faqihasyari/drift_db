// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_db.dart';

// ignore_for_file: type=lint
class $NotesTable extends Notes with TableInfo<$NotesTable, Note> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String> desc = GeneratedColumn<String>(
      'desc', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, desc];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notes';
  @override
  VerificationContext validateIntegrity(Insertable<Note> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc']!, _descMeta));
    } else if (isInserting) {
      context.missing(_descMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Note map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Note(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      desc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}desc'])!,
    );
  }

  @override
  $NotesTable createAlias(String alias) {
    return $NotesTable(attachedDatabase, alias);
  }
}

class Note extends DataClass implements Insertable<Note> {
  final int? id;
  final String title;
  final String desc;
  const Note({this.id, required this.title, required this.desc});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['title'] = Variable<String>(title);
    map['desc'] = Variable<String>(desc);
    return map;
  }

  NotesCompanion toCompanion(bool nullToAbsent) {
    return NotesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title: Value(title),
      desc: Value(desc),
    );
  }

  factory Note.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Note(
      id: serializer.fromJson<int?>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      desc: serializer.fromJson<String>(json['desc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'title': serializer.toJson<String>(title),
      'desc': serializer.toJson<String>(desc),
    };
  }

  Note copyWith(
          {Value<int?> id = const Value.absent(),
          String? title,
          String? desc}) =>
      Note(
        id: id.present ? id.value : this.id,
        title: title ?? this.title,
        desc: desc ?? this.desc,
      );
  Note copyWithCompanion(NotesCompanion data) {
    return Note(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      desc: data.desc.present ? data.desc.value : this.desc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Note(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('desc: $desc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, desc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Note &&
          other.id == this.id &&
          other.title == this.title &&
          other.desc == this.desc);
}

class NotesCompanion extends UpdateCompanion<Note> {
  final Value<int?> id;
  final Value<String> title;
  final Value<String> desc;
  const NotesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.desc = const Value.absent(),
  });
  NotesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String desc,
  })  : title = Value(title),
        desc = Value(desc);
  static Insertable<Note> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? desc,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (desc != null) 'desc': desc,
    });
  }

  NotesCompanion copyWith(
      {Value<int?>? id, Value<String>? title, Value<String>? desc}) {
    return NotesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      desc: desc ?? this.desc,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('desc: $desc')
          ..write(')'))
        .toString();
  }
}

abstract class _$NoteDb extends GeneratedDatabase {
  _$NoteDb(QueryExecutor e) : super(e);
  $NoteDbManager get managers => $NoteDbManager(this);
  late final $NotesTable notes = $NotesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [notes];
}

typedef $$NotesTableCreateCompanionBuilder = NotesCompanion Function({
  Value<int?> id,
  required String title,
  required String desc,
});
typedef $$NotesTableUpdateCompanionBuilder = NotesCompanion Function({
  Value<int?> id,
  Value<String> title,
  Value<String> desc,
});

class $$NotesTableFilterComposer extends Composer<_$NoteDb, $NotesTable> {
  $$NotesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get desc => $composableBuilder(
      column: $table.desc, builder: (column) => ColumnFilters(column));
}

class $$NotesTableOrderingComposer extends Composer<_$NoteDb, $NotesTable> {
  $$NotesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get desc => $composableBuilder(
      column: $table.desc, builder: (column) => ColumnOrderings(column));
}

class $$NotesTableAnnotationComposer extends Composer<_$NoteDb, $NotesTable> {
  $$NotesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get desc =>
      $composableBuilder(column: $table.desc, builder: (column) => column);
}

class $$NotesTableTableManager extends RootTableManager<
    _$NoteDb,
    $NotesTable,
    Note,
    $$NotesTableFilterComposer,
    $$NotesTableOrderingComposer,
    $$NotesTableAnnotationComposer,
    $$NotesTableCreateCompanionBuilder,
    $$NotesTableUpdateCompanionBuilder,
    (Note, BaseReferences<_$NoteDb, $NotesTable, Note>),
    Note,
    PrefetchHooks Function()> {
  $$NotesTableTableManager(_$NoteDb db, $NotesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int?> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> desc = const Value.absent(),
          }) =>
              NotesCompanion(
            id: id,
            title: title,
            desc: desc,
          ),
          createCompanionCallback: ({
            Value<int?> id = const Value.absent(),
            required String title,
            required String desc,
          }) =>
              NotesCompanion.insert(
            id: id,
            title: title,
            desc: desc,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$NotesTableProcessedTableManager = ProcessedTableManager<
    _$NoteDb,
    $NotesTable,
    Note,
    $$NotesTableFilterComposer,
    $$NotesTableOrderingComposer,
    $$NotesTableAnnotationComposer,
    $$NotesTableCreateCompanionBuilder,
    $$NotesTableUpdateCompanionBuilder,
    (Note, BaseReferences<_$NoteDb, $NotesTable, Note>),
    Note,
    PrefetchHooks Function()>;

class $NoteDbManager {
  final _$NoteDb _db;
  $NoteDbManager(this._db);
  $$NotesTableTableManager get notes =>
      $$NotesTableTableManager(_db, _db.notes);
}
