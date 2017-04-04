AC_INIT([AUmbrales],[2017.2])

AC_CONFIG_SRCDIR([src/AUmbrales-main.vala])

AC_CONFIG_MACRO_DIR([m4])

AC_CONFIG_AUX_DIR([build-aux])

AM_INIT_AUTOMAKE([1.11 foreign no-dist-gzip dist-xz])
AM_SILENT_RULES([yes])
LT_INIT

AC_PROG_CC
AM_PROG_CC_C_O
AC_PROG_CC_STDC
AM_PROG_VALAC([0.30])
AC_PROG_INSTALL

AC_PATH_PROG([VALADOC], [valadoc])
AM_CONDITIONAL([HAVE_VALADOC], [test "${VALADOC}" != ""])

AC_ARG_ENABLE([valadoc],
    AS_HELP_STRING([--enable-valadoc],
        [enable valadoc generation (default=yes if available)]),
    [enable_valadoc=yes], [enable_valadoc=no])
AS_IF([test "${enable_valadoc}" = "yes" && test "${VALADOC}" = ""],
    [AC_MSG_ERROR([valadoc is not available])])

AC_PATH_PROG(GLIB_COMPILE_RESOURCES, glib-compile-resources)

GEE_PACKAGES="--pkg gee-0.8"
PKG_CHECK_MODULES(GEE, [ gee-0.8 ])

AC_SUBST(GEE_CFLAGS)
AC_SUBST(GEE_LIBS)
AC_SUBST(GEE_PACKAGES)

GTK_PACKAGES="--pkg gtk+-3.0"
PKG_CHECK_MODULES(GTK, [ gtk+-3.0 ])

AC_SUBST(GTK_CFLAGS)
AC_SUBST(GTK_LIBS)
AC_SUBST(GTK_PACKAGES)

SQLITE_PACKAGES="--pkg sqlite3"
PKG_CHECK_MODULES(SQLITE, [ sqlite3  ])

AC_SUBST(SQLITE_CFLAGS)
AC_SUBST(SQLITE_LIBS)
AC_SUBST(SQLITE_PACKAGES)




AC_CONFIG_FILES([
	Makefile
])

AC_OUTPUT
