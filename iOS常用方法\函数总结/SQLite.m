//
//  Created by Lining on 15/4/7.
//  Copyright (c) 2015年. All rights reserved.
//


/**
 *  打开数据库 可以打开已经存在的数据库文件 如果数据库不存在，可以创建新的数据库文件
 *  返回的 database_connection 对象是其他 SQLite APIs 的句柄参数
 *  可以在多个线程之间共享该对象指针
 *
 *  @param filename 文件路径:完整的C语言格式的路径字符串 Int8, Char, Byte, char *
 *  @param UTF-8    数据库句柄 数据库指针地址 后续通过句柄操作数据库
 *
 *  @return 返回结果 主要用于判断是否成功 SQLITE_OK
 */
SQLITE_API int sqlite3_open(const char *filename, sqlite3 **ppDb);

/**
 *  执行SQL语句
 *
 *  @param sqlite3  数据库句柄
 *  @param sql      C语言的SQL语句(evaluated)
 *  @param callback 回调 通常为nil
 *  @param void *   回调函数的第一个参数 通常为nil
 *  @param errmsg   错误信息 通常为nil
 *
 *  @return 返回结果 主要用于判断是否成功 SQLITE_OK
 */
SQLITE_API int sqlite3_exec(sqlite3*, const char *sql, int (*callback)(void*,int,char**,char**), void *, char **errmsg);

/**
 *  准备 SQL 预先编译 SQL，将 SQL 文本转换为 prepared_statement 对象
 *  不会执行指定的 SQL 语句，只是将 SQL 文本初始化为待执行的状态
 *
 *  @param db     数据库句柄
 *  @param zSql   SQL
 *  @param nByte  以字节为单位的 SQL 语句的长度，使用 -1 可以自动计算
 *  @param ppStmt 编译后的语句句柄，后续 step 操作都依赖这个句柄，需要释放
 *  @param pzTail 未使用的指针，nil
 *
 *  @return 返回结果 主要用于判断是否成功 SQLITE_OK
 */
SQLITE_API int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail);

/**
 *  sqlite3_step 逐行取出记录 需要配合使用 while
 *  执行一次 sqlite3_prepare 函数返回的 prepared_statement 对象
 *  执行完该函数后，prepared_statement 对象的内部指针将指向其返回结果集的第一行
 *  如果要获得后续的数据行，则需要不断地调用该函数，直到所有的数据行遍历完毕
 *
 *  @param sqlite3_stmt 语句句柄
 *
 *  @return 返回取出的结果 主要用于判断 SQLITE_ROW
 */
SQLITE_API int sqlite3_step(sqlite3_stmt*);

/**
 *  获得当前行的列数
 *
 *  @param pStmt 语句句柄
 *
 *  @return 返回列数
 */
SQLITE_API int sqlite3_column_count(sqlite3_stmt *pStmt);

/**
 *  获取到列号对应的列名
 *
 *  @param sqlite3_stmt 语句句柄
 *  @param N            列号
 *
 *  @return 列名
 */
SQLITE_API const char *sqlite3_column_name(sqlite3_stmt*, int N);

/**
 *  获取到列的字段类型
 *
 *  @param sqlite3_stmt 语句句柄
 *  @param iCol         列号
 *
 *  @return 字段类型
 */
SQLITE_API int sqlite3_column_type(sqlite3_stmt*, int iCol);

/**
 *  用于获取当前行指定列的数据 以下函数分别对应不同的数据类型
 */
SQLITE_API const void *sqlite3_column_blob(sqlite3_stmt*, int iCol);
SQLITE_API int sqlite3_column_bytes(sqlite3_stmt*, int iCol);
SQLITE_API int sqlite3_column_bytes16(sqlite3_stmt*, int iCol);
SQLITE_API double sqlite3_column_double(sqlite3_stmt*, int iCol);
SQLITE_API int sqlite3_column_int(sqlite3_stmt*, int iCol);
SQLITE_API sqlite3_int64 sqlite3_column_int64(sqlite3_stmt*, int iCol);
SQLITE_API const unsigned char *sqlite3_column_text(sqlite3_stmt*, int iCol);
SQLITE_API const void *sqlite3_column_text16(sqlite3_stmt*, int iCol);
SQLITE_API int sqlite3_column_type(sqlite3_stmt*, int iCol);
SQLITE_API sqlite3_value *sqlite3_column_value(sqlite3_stmt*, int iCol);

/**
 *  用于获取当前结果集中的字段数量
 */
SQLITE_API int sqlite3_column_count(sqlite3_stmt *pStmt);

/**
 *  释放语句句柄，销毁 prepared_statement 对象，否则会造成内存泄露
 *
 *  @param pStmt 语句句柄
 */
SQLITE_API int sqlite3_finalize(sqlite3_stmt *pStmt);

/**
 *  复位语句
 *
 *  @param pStmt 语句句柄
 *
 *  @return 返回复位的结果 主要用于判断 SQLITE_OK
 */
SQLITE_API int sqlite3_reset(sqlite3_stmt *pStmt);

/**
 *  关闭之前打开的 database_connection 对象
 *  所有和该对象相关的 prepared_statements 对象都必须在此之前被销毁
 */
SQLITE_API int sqlite3_close(sqlite3*);


