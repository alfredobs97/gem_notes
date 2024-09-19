// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart' as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import '../../data/entities/document_entity.dart';
import '../../data/entities/note_entity.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 2967096039233691052),
      name: 'DocumentEntity',
      lastPropertyId: const obx_int.IdUid(5, 5040762889891455221),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(id: const obx_int.IdUid(1, 1151089012648025341), name: 'internalId', type: 6, flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 3148358006357723839),
            name: 'id',
            type: 9,
            flags: 34848,
            indexId: const obx_int.IdUid(1, 4183747512225015965)),
        obx_int.ModelProperty(id: const obx_int.IdUid(3, 3448369219669507715), name: 'content', type: 9, flags: 0),
        obx_int.ModelProperty(id: const obx_int.IdUid(4, 5258579284493782916), name: 'metadata', type: 9, flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 5040762889891455221),
            name: 'embedding',
            type: 28,
            flags: 8,
            indexId: const obx_int.IdUid(2, 2982447376058059143),
            hnswParams: obx_int.ModelHnswParams(
              dimensions: 768,
            ))
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(2, 3635119032225383272),
      name: 'NoteEntity',
      lastPropertyId: const obx_int.IdUid(5, 5509364441883811211),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(id: const obx_int.IdUid(1, 7311659951534772202), name: 'internalId', type: 6, flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 7693710975249712951),
            name: 'id',
            type: 9,
            flags: 34848,
            indexId: const obx_int.IdUid(3, 198404547475510926)),
        obx_int.ModelProperty(id: const obx_int.IdUid(3, 4768344853885082831), name: 'title', type: 9, flags: 0),
        obx_int.ModelProperty(id: const obx_int.IdUid(4, 5157714840131346526), name: 'content', type: 9, flags: 0),
        obx_int.ModelProperty(id: const obx_int.IdUid(5, 5509364441883811211), name: 'timestamp', type: 10, flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(2, 3635119032225383272),
      lastIndexId: const obx_int.IdUid(3, 198404547475510926),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    DocumentEntity: obx_int.EntityDefinition<DocumentEntity>(
        model: _entities[0],
        toOneRelations: (DocumentEntity object) => [],
        toManyRelations: (DocumentEntity object) => {},
        getId: (DocumentEntity object) => object.internalId,
        setId: (DocumentEntity object, int id) {
          object.internalId = id;
        },
        objectToFB: (DocumentEntity object, fb.Builder fbb) {
          final idOffset = fbb.writeString(object.id);
          final contentOffset = fbb.writeString(object.content);
          final metadataOffset = fbb.writeString(object.metadata);
          final embeddingOffset = fbb.writeListFloat32(object.embedding);
          fbb.startTable(6);
          fbb.addInt64(0, object.internalId);
          fbb.addOffset(1, idOffset);
          fbb.addOffset(2, contentOffset);
          fbb.addOffset(3, metadataOffset);
          fbb.addOffset(4, embeddingOffset);
          fbb.finish(fbb.endTable());
          return object.internalId;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam = const fb.StringReader(asciiOptimization: true).vTableGet(buffer, rootOffset, 6, '');
          final contentParam = const fb.StringReader(asciiOptimization: true).vTableGet(buffer, rootOffset, 8, '');
          final metadataParam = const fb.StringReader(asciiOptimization: true).vTableGet(buffer, rootOffset, 10, '');
          final embeddingParam =
              const fb.ListReader<double>(fb.Float32Reader(), lazy: false).vTableGet(buffer, rootOffset, 12, []);
          final object =
              DocumentEntity(id: idParam, content: contentParam, metadata: metadataParam, embedding: embeddingParam)
                ..internalId = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        }),
    NoteEntity: obx_int.EntityDefinition<NoteEntity>(
        model: _entities[1],
        toOneRelations: (NoteEntity object) => [],
        toManyRelations: (NoteEntity object) => {},
        getId: (NoteEntity object) => object.internalId,
        setId: (NoteEntity object, int id) {
          object.internalId = id;
        },
        objectToFB: (NoteEntity object, fb.Builder fbb) {
          final idOffset = fbb.writeString(object.id);
          final titleOffset = fbb.writeString(object.title);
          final contentOffset = fbb.writeString(object.content);
          fbb.startTable(6);
          fbb.addInt64(0, object.internalId);
          fbb.addOffset(1, idOffset);
          fbb.addOffset(2, titleOffset);
          fbb.addOffset(3, contentOffset);
          fbb.addInt64(4, object.timestamp.millisecondsSinceEpoch);
          fbb.finish(fbb.endTable());
          return object.internalId;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam = const fb.StringReader(asciiOptimization: true).vTableGet(buffer, rootOffset, 6, '');
          final titleParam = const fb.StringReader(asciiOptimization: true).vTableGet(buffer, rootOffset, 8, '');
          final contentParam = const fb.StringReader(asciiOptimization: true).vTableGet(buffer, rootOffset, 10, '');
          final timestampParam =
              DateTime.fromMillisecondsSinceEpoch(const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0));
          final object = NoteEntity(id: idParam, title: titleParam, content: contentParam, timestamp: timestampParam)
            ..internalId = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [DocumentEntity] entity fields to define ObjectBox queries.
class DocumentEntity_ {
  /// See [DocumentEntity.internalId].
  static final internalId = obx.QueryIntegerProperty<DocumentEntity>(_entities[0].properties[0]);

  /// See [DocumentEntity.id].
  static final id = obx.QueryStringProperty<DocumentEntity>(_entities[0].properties[1]);

  /// See [DocumentEntity.content].
  static final content = obx.QueryStringProperty<DocumentEntity>(_entities[0].properties[2]);

  /// See [DocumentEntity.metadata].
  static final metadata = obx.QueryStringProperty<DocumentEntity>(_entities[0].properties[3]);

  /// See [DocumentEntity.embedding].
  static final embedding = obx.QueryHnswProperty<DocumentEntity>(_entities[0].properties[4]);
}

/// [NoteEntity] entity fields to define ObjectBox queries.
class NoteEntity_ {
  /// See [NoteEntity.internalId].
  static final internalId = obx.QueryIntegerProperty<NoteEntity>(_entities[1].properties[0]);

  /// See [NoteEntity.id].
  static final id = obx.QueryStringProperty<NoteEntity>(_entities[1].properties[1]);

  /// See [NoteEntity.title].
  static final title = obx.QueryStringProperty<NoteEntity>(_entities[1].properties[2]);

  /// See [NoteEntity.content].
  static final content = obx.QueryStringProperty<NoteEntity>(_entities[1].properties[3]);

  /// See [NoteEntity.timestamp].
  static final timestamp = obx.QueryDateProperty<NoteEntity>(_entities[1].properties[4]);
}