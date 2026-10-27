
when ODIN_OS == .Linux {
	foreign import lib "system:sqlite3"
}

/*
** ------------------------------------------------------------------------
** Hand-written additions, appended by the bindgen footer mechanism
** (sqlite3_footer.odin). See bindgen.sjson.
**
** The enums below mirror the plain constants generated from the C macros;
** the values are identical. They exist so that procedures which return or
** accept these codes can be strongly typed via procedure_type_overrides.
** ------------------------------------------------------------------------
*/

/* All primary and extended result codes, see the [result codes] and
** [extended result codes] documentation above. */
Result_Code :: enum i32 {
	OK = 0, /* Successful result */
	ERROR = 1, /* Generic error */
	INTERNAL = 2, /* Internal logic error in SQLite */
	PERM = 3, /* Access permission denied */
	ABORT = 4, /* Callback routine requested an abort */
	BUSY = 5, /* The database file is locked */
	LOCKED = 6, /* A table in the database is locked */
	NOMEM = 7, /* A malloc() failed */
	READONLY = 8, /* Attempt to write a readonly database */
	INTERRUPT = 9, /* Operation terminated by sqlite3_interrupt() */
	IOERR = 10, /* Some kind of disk I/O error occurred */
	CORRUPT = 11, /* The database disk image is malformed */
	NOTFOUND = 12, /* Unknown opcode in sqlite3_file_control() */
	FULL = 13, /* Insertion failed because database is full */
	CANTOPEN = 14, /* Unable to open the database file */
	PROTOCOL = 15, /* Database lock protocol error */
	EMPTY = 16, /* Internal use only */
	SCHEMA = 17, /* The database schema changed */
	TOOBIG = 18, /* String or BLOB exceeds size limit */
	CONSTRAINT = 19, /* Abort due to constraint violation */
	MISMATCH = 20, /* Data type mismatch */
	MISUSE = 21, /* Library used incorrectly */
	NOLFS = 22, /* Uses OS features not supported on host */
	AUTH = 23, /* Authorization denied */
	FORMAT = 24, /* Not used */
	RANGE = 25, /* 2nd parameter to sqlite3_bind out of range */
	NOTADB = 26, /* File opened that is not a database file */
	NOTICE = 27, /* Notifications from sqlite3_log() */
	WARNING = 28, /* Warnings from sqlite3_log() */
	ROW = 100, /* sqlite3_step() has another row ready */
	DONE = 101, /* sqlite3_step() has finished executing */
	/* extended result codes */
	ERROR_MISSING_COLLSEQ = 257,
	ERROR_RETRY = 513,
	ERROR_SNAPSHOT = 769,
	ERROR_RESERVESIZE = 1025,
	ERROR_KEY = 1281,
	ERROR_UNABLE = 1537,
	IOERR_READ = 266,
	IOERR_SHORT_READ = 522,
	IOERR_WRITE = 778,
	IOERR_FSYNC = 1034,
	IOERR_DIR_FSYNC = 1290,
	IOERR_TRUNCATE = 1546,
	IOERR_FSTAT = 1802,
	IOERR_UNLOCK = 2058,
	IOERR_RDLOCK = 2314,
	IOERR_DELETE = 2570,
	IOERR_BLOCKED = 2826,
	IOERR_NOMEM = 3082,
	IOERR_ACCESS = 3338,
	IOERR_CHECKRESERVEDLOCK = 3594,
	IOERR_LOCK = 3850,
	IOERR_CLOSE = 4106,
	IOERR_DIR_CLOSE = 4362,
	IOERR_SHMOPEN = 4618,
	IOERR_SHMSIZE = 4874,
	IOERR_SHMLOCK = 5130,
	IOERR_SHMMAP = 5386,
	IOERR_SEEK = 5642,
	IOERR_DELETE_NOENT = 5898,
	IOERR_MMAP = 6154,
	IOERR_GETTEMPPATH = 6410,
	IOERR_CONVPATH = 6666,
	IOERR_VNODE = 6922,
	IOERR_AUTH = 7178,
	IOERR_BEGIN_ATOMIC = 7434,
	IOERR_COMMIT_ATOMIC = 7690,
	IOERR_ROLLBACK_ATOMIC = 7946,
	IOERR_DATA = 8202,
	IOERR_CORRUPTFS = 8458,
	IOERR_IN_PAGE = 8714,
	IOERR_BADKEY = 8970,
	IOERR_CODEC = 9226,
	LOCKED_SHAREDCACHE = 262,
	LOCKED_VTAB = 518,
	BUSY_RECOVERY = 261,
	BUSY_SNAPSHOT = 517,
	BUSY_TIMEOUT = 773,
	CANTOPEN_NOTEMPDIR = 270,
	CANTOPEN_ISDIR = 526,
	CANTOPEN_FULLPATH = 782,
	CANTOPEN_CONVPATH = 1038,
	CANTOPEN_DIRTYWAL = 1294, /* Not Used */
	CANTOPEN_SYMLINK = 1550,
	CORRUPT_VTAB = 267,
	CORRUPT_SEQUENCE = 523,
	CORRUPT_INDEX = 779,
	READONLY_RECOVERY = 264,
	READONLY_CANTLOCK = 520,
	READONLY_ROLLBACK = 776,
	READONLY_DBMOVED = 1032,
	READONLY_CANTINIT = 1288,
	READONLY_DIRECTORY = 1544,
	ABORT_ROLLBACK = 516,
	CONSTRAINT_CHECK = 275,
	CONSTRAINT_COMMITHOOK = 531,
	CONSTRAINT_FOREIGNKEY = 787,
	CONSTRAINT_FUNCTION = 1043,
	CONSTRAINT_NOTNULL = 1299,
	CONSTRAINT_PRIMARYKEY = 1555,
	CONSTRAINT_TRIGGER = 1811,
	CONSTRAINT_UNIQUE = 2067,
	CONSTRAINT_VTAB = 2323,
	CONSTRAINT_ROWID = 2579,
	CONSTRAINT_PINNED = 2835,
	CONSTRAINT_DATATYPE = 3091,
	NOTICE_RECOVER_WAL = 283,
	NOTICE_RECOVER_ROLLBACK = 539,
	NOTICE_RBU = 795,
	WARNING_AUTOINDEX = 284,
	AUTH_USER = 279,
	OK_LOAD_PERMANENTLY = 256,
	OK_SYMLINK = 512, /* internal only */
}

/* Fundamental datatypes returned by column_type()/value_type(). */
Datatype :: enum i32 {
	INTEGER = 1,
	FLOAT   = 2,
	TEXT    = 3,
	BLOB    = 4,
	NULL    = 5,
}

/* Conflict resolution modes returned by vtab_on_conflict(). IGNORE and
** ABORT share their values with the authorizer's IGNORE constant and
** Result_Code.ABORT respectively, as in the C API. */
Conflict_Resolution :: enum i32 {
	ROLLBACK = 1,
	IGNORE   = 2,
	FAIL     = 3,
	ABORT    = 4,
	REPLACE  = 5,
}

/* Special destructor values for bind_blob()/bind_text()/result_text() etc.
** In C these are the constants ((sqlite3_destructor_type)0) and
** ((sqlite3_destructor_type)-1); they are removed by the config and
** recreated here because a C cast cannot be expressed as an Odin constant. */
STATIC := Destructor_Type(nil)
TRANSIENT := transmute(Destructor_Type)(~uintptr(0))
