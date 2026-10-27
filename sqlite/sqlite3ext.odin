/*
** 2006 June 7
**
** The author disclaims copyright to this source code.  In place of
** a legal notice, here is a blessing:
**
**    May you do good and not evil.
**    May you find forgiveness for yourself and forgive others.
**    May you share freely, never taking more than you give.
**
*************************************************************************
** This header file defines the SQLite interface for use by
** shared libraries that want to be imported as extensions into
** an SQLite instance.  Shared libraries that intend to be loaded
** as extensions by SQLite should #include this file instead of 
** sqlite3.h.
*/
package sqlite

import "core:c"

/*
** The following structure holds pointers to all of the SQLite API
** routines.
**
** WARNING:  In order to maintain backwards compatibility, add new
** interfaces to the end of this structure only.  If you insert new
** interfaces in the middle of this structure, then older different
** versions of SQLite will not be able to load each other's shared
** libraries!
*/
Api_Routines :: struct {
	aggregate_context:      proc "c" (_: ^Context, nBytes: i32) -> rawptr,
	aggregate_count:        proc "c" (^Context) -> i32,
	bind_blob:              proc "c" (_: ^Stmt, _: i32, _: rawptr, n: i32, _: proc "c" (rawptr)) -> Result_Code,
	bind_double:            proc "c" (^Stmt, i32, f64) -> Result_Code,
	bind_int:               proc "c" (^Stmt, i32, i32) -> Result_Code,
	bind_int64:             proc "c" (^Stmt, i32, i64) -> Result_Code,
	bind_null:              proc "c" (^Stmt, i32) -> Result_Code,
	bind_parameter_count:   proc "c" (^Stmt) -> i32,
	bind_parameter_index:   proc "c" (_: ^Stmt, zName: cstring) -> i32,
	bind_parameter_name:    proc "c" (^Stmt, i32) -> cstring,
	bind_text:              proc "c" (_: ^Stmt, _: i32, _: cstring, n: i32, _: proc "c" (rawptr)) -> Result_Code,
	bind_text16:            proc "c" (^Stmt, i32, rawptr, i32, proc "c" (rawptr)) -> Result_Code,
	bind_value:             proc "c" (^Stmt, i32, ^Value) -> Result_Code,
	busy_handler:           proc "c" (^Connection, proc "c" (rawptr, i32) -> i32, rawptr) -> Result_Code,
	busy_timeout:           proc "c" (_: ^Connection, ms: i32) -> Result_Code,
	changes:                proc "c" (^Connection) -> i32,
	close:                  proc "c" (^Connection) -> Result_Code,
	collation_needed:       proc "c" (^Connection, rawptr, proc "c" (_: rawptr, _: ^Connection, eTextRep: i32, _: cstring)) -> Result_Code,
	collation_needed16:     proc "c" (^Connection, rawptr, proc "c" (_: rawptr, _: ^Connection, eTextRep: i32, _: rawptr)) -> Result_Code,
	column_blob:            proc "c" (_: ^Stmt, iCol: i32) -> rawptr,
	column_bytes:           proc "c" (_: ^Stmt, iCol: i32) -> i32,
	column_bytes16:         proc "c" (_: ^Stmt, iCol: i32) -> i32,
	column_count:           proc "c" (pStmt: ^Stmt) -> i32,
	column_database_name:   proc "c" (^Stmt, i32) -> cstring,
	column_database_name16: proc "c" (^Stmt, i32) -> rawptr,
	column_decltype:        proc "c" (_: ^Stmt, i: i32) -> cstring,
	column_decltype16:      proc "c" (^Stmt, i32) -> rawptr,
	column_double:          proc "c" (_: ^Stmt, iCol: i32) -> f64,
	column_int:             proc "c" (_: ^Stmt, iCol: i32) -> i32,
	column_int64:           proc "c" (_: ^Stmt, iCol: i32) -> i64,
	column_name:            proc "c" (^Stmt, i32) -> cstring,
	column_name16:          proc "c" (^Stmt, i32) -> rawptr,
	column_origin_name:     proc "c" (^Stmt, i32) -> cstring,
	column_origin_name16:   proc "c" (^Stmt, i32) -> rawptr,
	column_table_name:      proc "c" (^Stmt, i32) -> cstring,
	column_table_name16:    proc "c" (^Stmt, i32) -> rawptr,
	column_text:            proc "c" (_: ^Stmt, iCol: i32) -> cstring,
	column_text16:          proc "c" (_: ^Stmt, iCol: i32) -> rawptr,
	column_type:            proc "c" (_: ^Stmt, iCol: i32) -> Datatype,
	column_value:           proc "c" (_: ^Stmt, iCol: i32) -> ^Value,
	commit_hook:            proc "c" (^Connection, proc "c" (rawptr) -> i32, rawptr) -> rawptr,
	complete:               proc "c" (sql: cstring) -> i32,
	complete16:             proc "c" (sql: rawptr) -> i32,
	create_collation:       proc "c" (^Connection, cstring, i32, rawptr, proc "c" (rawptr, i32, rawptr, i32, rawptr) -> i32) -> Result_Code,
	create_collation16:     proc "c" (^Connection, rawptr, i32, rawptr, proc "c" (rawptr, i32, rawptr, i32, rawptr) -> i32) -> Result_Code,
	create_function:        proc "c" (_: ^Connection, _: cstring, _: i32, _: i32, _: rawptr, xFunc: proc "c" (^Context, i32, ^^Value), xStep: proc "c" (^Context, i32, ^^Value), xFinal: proc "c" (^Context)) -> Result_Code,
	create_function16:      proc "c" (_: ^Connection, _: rawptr, _: i32, _: i32, _: rawptr, xFunc: proc "c" (^Context, i32, ^^Value), xStep: proc "c" (^Context, i32, ^^Value), xFinal: proc "c" (^Context)) -> Result_Code,
	create_module:          proc "c" (^Connection, cstring, ^Module, rawptr) -> Result_Code,
	data_count:             proc "c" (pStmt: ^Stmt) -> i32,
	db_handle:              proc "c" (^Stmt) -> ^Connection,
	declare_vtab:           proc "c" (^Connection, cstring) -> Result_Code,
	enable_shared_cache:    proc "c" (i32) -> Result_Code,
	errcode:                proc "c" (db: ^Connection) -> Result_Code,
	errmsg:                 proc "c" (^Connection) -> cstring,
	errmsg16:               proc "c" (^Connection) -> rawptr,
	exec:                   proc "c" (^Connection, cstring, proc "c" (rawptr, i32, ^cstring, ^cstring) -> i32, rawptr, ^cstring) -> Result_Code,
	expired:                proc "c" (^Stmt) -> i32,
	finalize:               proc "c" (pStmt: ^Stmt) -> Result_Code,
	free:                   proc "c" (rawptr),
	free_table:             proc "c" (result: ^cstring),
	get_autocommit:         proc "c" (^Connection) -> i32,
	get_auxdata:            proc "c" (^Context, i32) -> rawptr,
	get_table:              proc "c" (^Connection, cstring, ^^cstring, ^i32, ^i32, ^cstring) -> Result_Code,
	global_recover:         proc "c" () -> Result_Code,
	interruptx:             proc "c" (^Connection),
	last_insert_rowid:      proc "c" (^Connection) -> i64,
	libversion:             proc "c" () -> cstring,
	libversion_number:      proc "c" () -> i32,
	malloc:                 proc "c" (i32) -> rawptr,
	mprintf:                proc "c" (cstring, #c_vararg ..any) -> cstring,
	open:                   proc "c" (cstring, ^^Connection) -> Result_Code,
	open16:                 proc "c" (rawptr, ^^Connection) -> Result_Code,
	prepare:                proc "c" (^Connection, cstring, i32, ^^Stmt, ^cstring) -> Result_Code,
	prepare16:              proc "c" (^Connection, rawptr, i32, ^^Stmt, ^rawptr) -> Result_Code,
	profile:                proc "c" (^Connection, proc "c" (rawptr, cstring, u64), rawptr) -> rawptr,
	progress_handler:       proc "c" (^Connection, i32, proc "c" (rawptr) -> i32, rawptr),
	realloc:                proc "c" (rawptr, i32) -> rawptr,
	reset:                  proc "c" (pStmt: ^Stmt) -> Result_Code,
	result_blob:            proc "c" (^Context, rawptr, i32, proc "c" (rawptr)),
	result_double:          proc "c" (^Context, f64),
	result_error:           proc "c" (^Context, cstring, i32),
	result_error16:         proc "c" (^Context, rawptr, i32),
	result_int:             proc "c" (^Context, i32),
	result_int64:           proc "c" (^Context, i64),
	result_null:            proc "c" (^Context),
	result_text:            proc "c" (^Context, cstring, i32, proc "c" (rawptr)),
	result_text16:          proc "c" (^Context, rawptr, i32, proc "c" (rawptr)),
	result_text16be:        proc "c" (^Context, rawptr, i32, proc "c" (rawptr)),
	result_text16le:        proc "c" (^Context, rawptr, i32, proc "c" (rawptr)),
	result_value:           proc "c" (^Context, ^Value),
	rollback_hook:          proc "c" (^Connection, proc "c" (rawptr), rawptr) -> rawptr,
	set_authorizer:         proc "c" (^Connection, proc "c" (rawptr, i32, cstring, cstring, cstring, cstring) -> i32, rawptr) -> Result_Code,
	set_auxdata:            proc "c" (^Context, i32, rawptr, proc "c" (rawptr)),
	xsnprintf:              proc "c" (i32, cstring, cstring, #c_vararg ..any) -> cstring,
	step:                   proc "c" (^Stmt) -> Result_Code,
	table_column_metadata:  proc "c" (^Connection, cstring, cstring, cstring, ^cstring, ^cstring, ^i32, ^i32, ^i32) -> Result_Code,
	thread_cleanup:         proc "c" (),
	total_changes:          proc "c" (^Connection) -> i32,
	trace:                  proc "c" (_: ^Connection, xTrace: proc "c" (rawptr, cstring), _: rawptr) -> rawptr,
	transfer_bindings:      proc "c" (^Stmt, ^Stmt) -> Result_Code,
	update_hook:            proc "c" (^Connection, proc "c" (rawptr, i32, cstring, cstring, i64), rawptr) -> rawptr,
	user_data:              proc "c" (^Context) -> rawptr,
	value_blob:             proc "c" (^Value) -> rawptr,
	value_bytes:            proc "c" (^Value) -> i32,
	value_bytes16:          proc "c" (^Value) -> i32,
	value_double:           proc "c" (^Value) -> f64,
	value_int:              proc "c" (^Value) -> i32,
	value_int64:            proc "c" (^Value) -> i64,
	value_numeric_type:     proc "c" (^Value) -> Datatype,
	value_text:             proc "c" (^Value) -> cstring,
	value_text16:           proc "c" (^Value) -> rawptr,
	value_text16be:         proc "c" (^Value) -> rawptr,
	value_text16le:         proc "c" (^Value) -> rawptr,
	value_type:             proc "c" (^Value) -> Datatype,
	vmprintf:               proc "c" (cstring, c.va_list) -> cstring,

	/* Added ??? */
	overload_function: proc "c" (_: ^Connection, zFuncName: cstring, nArg: i32) -> Result_Code,

	/* Added by 3.3.13 */
	prepare_v2:     proc "c" (^Connection, cstring, i32, ^^Stmt, ^cstring) -> Result_Code,
	prepare16_v2:   proc "c" (^Connection, rawptr, i32, ^^Stmt, ^rawptr) -> Result_Code,
	clear_bindings: proc "c" (^Stmt) -> Result_Code,

	/* Added by 3.4.1 */
	create_module_v2: proc "c" (_: ^Connection, _: cstring, _: ^Module, _: rawptr, xDestroy: proc "c" (rawptr)) -> Result_Code,

	/* Added by 3.5.0 */
	bind_zeroblob:         proc "c" (^Stmt, i32, i32) -> Result_Code,
	blob_bytes:            proc "c" (^Blob) -> i32,
	blob_close:            proc "c" (^Blob) -> Result_Code,
	blob_open:             proc "c" (^Connection, cstring, cstring, cstring, i64, i32, ^^Blob) -> Result_Code,
	blob_read:             proc "c" (^Blob, rawptr, i32, i32) -> Result_Code,
	blob_write:            proc "c" (^Blob, rawptr, i32, i32) -> Result_Code,
	create_collation_v2:   proc "c" (^Connection, cstring, i32, rawptr, proc "c" (rawptr, i32, rawptr, i32, rawptr) -> i32, proc "c" (rawptr)) -> Result_Code,
	file_control:          proc "c" (^Connection, cstring, i32, rawptr) -> Result_Code,
	memory_highwater:      proc "c" (i32) -> i64,
	memory_used:           proc "c" () -> i64,
	mutex_alloc:           proc "c" (i32) -> ^Mutex,
	mutex_enter:           proc "c" (^Mutex),
	mutex_free:            proc "c" (^Mutex),
	mutex_leave:           proc "c" (^Mutex),
	mutex_try:             proc "c" (^Mutex) -> Result_Code,
	open_v2:               proc "c" (cstring, ^^Connection, Open_Flags, cstring) -> Result_Code,
	release_memory:        proc "c" (i32) -> i32,
	result_error_nomem:    proc "c" (^Context),
	result_error_toobig:   proc "c" (^Context),
	sleep:                 proc "c" (i32) -> i32,
	soft_heap_limit:       proc "c" (i32),
	vfs_find:              proc "c" (cstring) -> ^Vfs,
	vfs_register:          proc "c" (^Vfs, i32) -> Result_Code,
	vfs_unregister:        proc "c" (^Vfs) -> Result_Code,
	xthreadsafe:           proc "c" () -> i32,
	result_zeroblob:       proc "c" (^Context, i32),
	result_error_code:     proc "c" (^Context, Result_Code),
	test_control:          proc "c" (i32, #c_vararg ..any) -> i32,
	randomness:            proc "c" (i32, rawptr),
	context_db_handle:     proc "c" (^Context) -> ^Connection,
	extended_result_codes: proc "c" (^Connection, i32) -> Result_Code,
	limit:                 proc "c" (^Connection, i32, i32) -> i32,
	next_stmt:             proc "c" (^Connection, ^Stmt) -> ^Stmt,
	sql:                   proc "c" (^Stmt) -> cstring,
	status:                proc "c" (i32, ^i32, ^i32, i32) -> Result_Code,
	backup_finish:         proc "c" (^Backup) -> Result_Code,
	backup_init:           proc "c" (^Connection, cstring, ^Connection, cstring) -> ^Backup,
	backup_pagecount:      proc "c" (^Backup) -> i32,
	backup_remaining:      proc "c" (^Backup) -> i32,
	backup_step:           proc "c" (^Backup, i32) -> Result_Code,
	compileoption_get:     proc "c" (i32) -> cstring,
	compileoption_used:    proc "c" (cstring) -> i32,
	create_function_v2:    proc "c" (_: ^Connection, _: cstring, _: i32, _: i32, _: rawptr, xFunc: proc "c" (^Context, i32, ^^Value), xStep: proc "c" (^Context, i32, ^^Value), xFinal: proc "c" (^Context), xDestroy: proc "c" (rawptr)) -> Result_Code,
	db_config:             proc "c" (^Connection, i32, #c_vararg ..any) -> Result_Code,
	db_mutex:              proc "c" (^Connection) -> ^Mutex,
	db_status:             proc "c" (^Connection, i32, ^i32, ^i32, i32) -> Result_Code,
	extended_errcode:      proc "c" (^Connection) -> Result_Code,
	log:                   proc "c" (i32, cstring, #c_vararg ..any),
	soft_heap_limit64:     proc "c" (i64) -> i64,
	sourceid:              proc "c" () -> cstring,
	stmt_status:           proc "c" (^Stmt, i32, i32) -> i32,
	strnicmp:              proc "c" (cstring, cstring, i32) -> i32,
	unlock_notify:         proc "c" (^Connection, proc "c" (^rawptr, i32), rawptr) -> Result_Code,
	wal_autocheckpoint:    proc "c" (^Connection, i32) -> Result_Code,
	wal_checkpoint:        proc "c" (^Connection, cstring) -> Result_Code,
	wal_hook:              proc "c" (^Connection, proc "c" (rawptr, ^Connection, cstring, i32) -> i32, rawptr) -> rawptr,
	blob_reopen:           proc "c" (^Blob, i64) -> Result_Code,
	vtab_config:           proc "c" (_: ^Connection, op: i32, #c_vararg _: ..any) -> Result_Code,
	vtab_on_conflict:      proc "c" (^Connection) -> Conflict_Resolution,

	/* Version 3.7.16 and later */
	close_v2:          proc "c" (^Connection) -> Result_Code,
	db_filename:       proc "c" (^Connection, cstring) -> cstring,
	db_readonly:       proc "c" (^Connection, cstring) -> i32,
	db_release_memory: proc "c" (^Connection) -> Result_Code,
	errstr:            proc "c" (Result_Code) -> cstring,
	stmt_busy:         proc "c" (^Stmt) -> i32,
	stmt_readonly:     proc "c" (^Stmt) -> i32,
	stricmp:           proc "c" (cstring, cstring) -> i32,
	uri_boolean:       proc "c" (cstring, cstring, i32) -> i32,
	uri_int64:         proc "c" (cstring, cstring, i64) -> i64,
	uri_parameter:     proc "c" (cstring, cstring) -> cstring,
	xvsnprintf:        proc "c" (i32, cstring, cstring, c.va_list) -> cstring,
	wal_checkpoint_v2: proc "c" (^Connection, cstring, i32, ^i32, ^i32) -> Result_Code,

	/* Version 3.8.7 and later */
	auto_extension:        proc "c" (proc "c" ()) -> Result_Code,
	bind_blob64:           proc "c" (^Stmt, i32, rawptr, u64, proc "c" (rawptr)) -> Result_Code,
	bind_text64:           proc "c" (^Stmt, i32, cstring, u64, proc "c" (rawptr), u8) -> Result_Code,
	cancel_auto_extension: proc "c" (proc "c" ()) -> i32,
	load_extension:        proc "c" (^Connection, cstring, cstring, ^cstring) -> Result_Code,
	malloc64:              proc "c" (u64) -> rawptr,
	msize:                 proc "c" (rawptr) -> u64,
	realloc64:             proc "c" (rawptr, u64) -> rawptr,
	reset_auto_extension:  proc "c" (),
	result_blob64:         proc "c" (^Context, rawptr, u64, proc "c" (rawptr)),
	result_text64:         proc "c" (^Context, cstring, u64, proc "c" (rawptr), u8),
	strglob:               proc "c" (cstring, cstring) -> i32,

	/* Version 3.8.11 and later */
	value_dup:         proc "c" (^Value) -> ^Value,
	value_free:        proc "c" (^Value),
	result_zeroblob64: proc "c" (^Context, u64) -> Result_Code,
	bind_zeroblob64:   proc "c" (^Stmt, i32, u64) -> Result_Code,

	/* Version 3.9.0 and later */
	value_subtype:  proc "c" (^Value) -> u32,
	result_subtype: proc "c" (^Context, u32),

	/* Version 3.10.0 and later */
	status64:      proc "c" (i32, ^i64, ^i64, i32) -> Result_Code,
	strlike:       proc "c" (cstring, cstring, u32) -> i32,
	db_cacheflush: proc "c" (^Connection) -> Result_Code,

	/* Version 3.12.0 and later */
	system_errno: proc "c" (^Connection) -> i32,

	/* Version 3.14.0 and later */
	trace_v2:     proc "c" (^Connection, u32, proc "c" (u32, rawptr, rawptr, rawptr) -> i32, rawptr) -> Result_Code,
	expanded_sql: proc "c" (^Stmt) -> cstring,

	/* Version 3.18.0 and later */
	set_last_insert_rowid: proc "c" (^Connection, i64),

	/* Version 3.20.0 and later */
	prepare_v3:     proc "c" (^Connection, cstring, i32, u32, ^^Stmt, ^cstring) -> Result_Code,
	prepare16_v3:   proc "c" (^Connection, rawptr, i32, u32, ^^Stmt, ^rawptr) -> Result_Code,
	bind_pointer:   proc "c" (^Stmt, i32, rawptr, cstring, proc "c" (rawptr)) -> Result_Code,
	result_pointer: proc "c" (^Context, rawptr, cstring, proc "c" (rawptr)),
	value_pointer:  proc "c" (^Value, cstring) -> rawptr,
	vtab_nochange:  proc "c" (^Context) -> i32,
	value_nochange: proc "c" (^Value) -> i32,
	vtab_collation: proc "c" (^Index_Info, i32) -> cstring,

	/* Version 3.24.0 and later */
	keyword_count:  proc "c" () -> i32,
	keyword_name:   proc "c" (i32, ^cstring, ^i32) -> Result_Code,
	keyword_check:  proc "c" (cstring, i32) -> i32,
	str_new:        proc "c" (^Connection) -> ^Str,
	str_finish:     proc "c" (^Str) -> cstring,
	str_appendf:    proc "c" (_: ^Str, zFormat: cstring, #c_vararg _: ..any),
	str_vappendf:   proc "c" (_: ^Str, zFormat: cstring, _: c.va_list),
	str_append:     proc "c" (_: ^Str, zIn: cstring, N: i32),
	str_appendall:  proc "c" (_: ^Str, zIn: cstring),
	str_appendchar: proc "c" (_: ^Str, N: i32, C: i8),
	str_reset:      proc "c" (^Str),
	str_errcode:    proc "c" (^Str) -> Result_Code,
	str_length:     proc "c" (^Str) -> i32,
	str_value:      proc "c" (^Str) -> cstring,

	/* Version 3.25.0 and later */
	create_window_function: proc "c" (_: ^Connection, _: cstring, _: i32, _: i32, _: rawptr, xStep: proc "c" (^Context, i32, ^^Value), xFinal: proc "c" (^Context), xValue: proc "c" (^Context), xInv: proc "c" (^Context, i32, ^^Value), xDestroy: proc "c" (rawptr)) -> Result_Code,

	/* Version 3.26.0 and later */
	normalized_sql: proc "c" (^Stmt) -> cstring,

	/* Version 3.28.0 and later */
	stmt_isexplain: proc "c" (^Stmt) -> i32,
	value_frombind: proc "c" (^Value) -> i32,

	/* Version 3.30.0 and later */
	drop_modules: proc "c" (^Connection, ^cstring) -> Result_Code,

	/* Version 3.31.0 and later */
	hard_heap_limit64: proc "c" (i64) -> i64,
	uri_key:           proc "c" (cstring, i32) -> cstring,
	filename_database: proc "c" (cstring) -> cstring,
	filename_journal:  proc "c" (cstring) -> cstring,
	filename_wal:      proc "c" (cstring) -> cstring,

	/* Version 3.32.0 and later */
	create_filename:      proc "c" (cstring, cstring, cstring, i32, ^cstring) -> cstring,
	free_filename:        proc "c" (cstring),
	database_file_object: proc "c" (cstring) -> ^File,

	/* Version 3.34.0 and later */
	txn_state: proc "c" (^Connection, cstring) -> i32,

	/* Version 3.36.1 and later */
	changes64:       proc "c" (^Connection) -> i64,
	total_changes64: proc "c" (^Connection) -> i64,

	/* Version 3.37.0 and later */
	autovacuum_pages: proc "c" (^Connection, proc "c" (rawptr, cstring, u32, u32, u32) -> u32, rawptr, proc "c" (rawptr)) -> Result_Code,

	/* Version 3.38.0 and later */
	error_offset:   proc "c" (^Connection) -> i32,
	vtab_rhs_value: proc "c" (^Index_Info, i32, ^^Value) -> Result_Code,
	vtab_distinct:  proc "c" (^Index_Info) -> i32,
	vtab_in:        proc "c" (^Index_Info, i32, i32) -> i32,
	vtab_in_first:  proc "c" (^Value, ^^Value) -> Result_Code,
	vtab_in_next:   proc "c" (^Value, ^^Value) -> Result_Code,

	/* Version 3.39.0 and later */
	deserialize: proc "c" (^Connection, cstring, ^u8, i64, i64, u32) -> Result_Code,
	serialize:   proc "c" (^Connection, cstring, ^i64, u32) -> ^u8,
	db_name:     proc "c" (^Connection, i32) -> cstring,

	/* Version 3.40.0 and later */
	value_encoding: proc "c" (^Value) -> i32,

	/* Version 3.41.0 and later */
	is_interrupted: proc "c" (^Connection) -> i32,

	/* Version 3.43.0 and later */
	stmt_explain: proc "c" (^Stmt, i32) -> Result_Code,

	/* Version 3.44.0 and later */
	get_clientdata: proc "c" (^Connection, cstring) -> rawptr,
	set_clientdata: proc "c" (^Connection, cstring, rawptr, proc "c" (rawptr)) -> Result_Code,

	/* Version 3.50.0 and later */
	setlk_timeout: proc "c" (^Connection, i32, i32) -> Result_Code,

	/* Version 3.51.0 and later */
	set_errmsg:  proc "c" (^Connection, Result_Code, cstring) -> Result_Code,
	db_status64: proc "c" (^Connection, i32, ^i64, ^i64, i32) -> Result_Code,

	/* Version 3.52.0 and later */
	str_truncate:   proc "c" (^Str, i32),
	str_free:       proc "c" (^Str),
	carray_bind:    proc "c" (^Stmt, i32, rawptr, i32, i32, proc "c" (rawptr)) -> Result_Code,
	carray_bind_v2: proc "c" (^Stmt, i32, rawptr, i32, i32, proc "c" (rawptr), rawptr) -> Result_Code,

	/* Version 3.54.0 and later */
	incomplete: proc "c" (cstring) -> i64,
	result_str: proc "c" (^Context, ^Str, i32),
}

/*
** This is the function signature used for all extension entry points.  It
** is also defined in the file "loadext.c".
*/
Loadext_Entry :: proc "c" (db: ^Connection, pzErrMsg: ^cstring, pThunk: ^Api_Routines /* Extension API function pointers. */) -> i32

