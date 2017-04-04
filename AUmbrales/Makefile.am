AUTOMAKE_OPTIONS = subdir-objects

COMMON_VALAFLAGS =			\
	--enable-experimental		\
	--target-glib=2.48		\
	--vapidir=$(srcdir)/vapi

# libtest
noinst_LTLIBRARIES = lib/libtest.la

lib_libtest_la_SOURCES = lib/test/test-case.vala

lib_libtest_la_VALAFLAGS =		\
	$(COMMON_VALAFLAGS)		\
	@GEE_PACKAGES@			\
	@GTK_PACKAGES@			\
	@SQLITE_PACKAGES@		\
	--header lib/test/test.h	\
	--vapi vapi/test.vapi

lib_libtest_la_CFLAGS =		\
	@GEE_CFLAGS@		\
	@GTK_CFLAGS@		\
	@SQLITE_CFLAGS@		\
	-I$(srcdir)/lib/test	\
	-w

lib_libtest_la_LIBADD = 	\
	@GEE_LIBS@		\
	@GTK_LIBS@		\
	@SQLITE_LIBS@

#libbase
noinst_LTLIBRARIES += lib/libbase.la

lib_libbase_la_SOURCES =lib/base/Ciudad.vala	

lib_libbase_la_VALAFLAGS =		\
	$(COMMON_VALAFLAGS)		\
	@GEE_PACKAGES@			\
	@GTK_PACKAGES@			\
	@SQLITE_PACKAGES@		\
	--header lib/base/base.h	\
	--vapi vapi/base.vapi

lib_libbase_la_CFLAGS =		\
	@GEE_CFLAGS@		\
	@GTK_CFLAGS@		\
	@SQLITE_CFLAGS@		\
	-w

lib_libbase_la_LIBADD =		\
	@GEE_LIBS@		\
	@GTK_LIBS@		\
	@SQLITE_LIBS@

#libaceptacion
noinst_LTLIBRARIES += lib/libaceptacion.la

lib_libaceptacion_la_SOURCES =lib/aceptacion/Solucion.vala	

lib_libaceptacion_la_VALAFLAGS =		\
	$(COMMON_VALAFLAGS)		\
	@GEE_PACKAGES@			\
	@GTK_PACKAGES@			\
	@SQLITE_PACKAGES@		\
	--header lib/aceptacion/aceptacion.h	\
	--vapi vapi/aceptacion.vapi

lib_libaceptacion_la_CFLAGS =		\
	@GEE_CFLAGS@		\
	@GTK_CFLAGS@		\
	@SQLITE_CFLAGS@		\
	-w

lib_libaceptacion_la_LIBADD =		\
	@GEE_LIBS@		\
	@GTK_LIBS@		\
	@SQLITE_LIBS@

#AUmbrales
bin_PROGRAMS = AUmbrales
AUMBRALESOURCES =		\
	src/ModeloDB.vala	\
	src/AUmbrales.vala

AUmbrales_SOURCES = 		\
	$(AUMBRALESOURCES)	\
	src/AUmbrales-main.vala	\
	vapi/aceptacion.vapi	\
	vapi/base.vapi

AUmbrales_VALAFLAGS =	        \
	--target-glib=2.38	\
	@GEE_PACKAGES@		\
	@GTK_PACKAGES@		\
	@SQLITE_PACKAGES@	

AUmbrales_CFLAGS =		\
	@GEE_CFLAGS@		\
	@GTK_CFLAGS@		\
	@SQLITE_CFLAGS@		\
	-I$(srcdir)/lib/aceptacion\
	-I$(srcdir)/lib/base	\
	-w

AUmbrales_LDADD =		\
	@GEE_LIBS@		\
	@GTK_LIBS@		\
	@SQLITE_LIBS@		\
	lib/libbase.la		\
	lib/libaceptacion.la


# tests
TESTS = test/test-aumbrales

TESTSOURCES =			\
	test/test-ciudad.vala 	\
	test/test-solucion.vala

test_test_aumbrales_SOURCES =			\
	$(TESTSOURCES)				\
	test/test-aumbrales-main.vala		\
	vapi/test.vapi				\
	vapi/base.vapi				\
	vapi/aceptacion.vapi

test_test_aumbrales_VALAFLAGS =			\
	$(COMMON_VALAFLAGS)			\
	@GEE_PACKAGES@				\
	@GTK_PACKAGES@				\
	@SQLITE_PACKAGES@			\
	--vapidir $(top_srcdir)/vapi

test_test_aumbrales_CFLAGS =		\
	@GEE_CFLAGS@			\
	@GTK_CFLAGS@			\
	@SQLITE_CFLAGS@			\
	-I$(srcdir)/lib/test		\
	-I$(srcdir)/lib/base		\
	-I$(srcdir)/lib/aceptacion
	-w

test_test_aumbrales_LDADD =	\
	@GEE_LIBS@		\
	@GTK_LIBS@		\
	@SQLITE_LIBS@		\
	lib/libtest.la		\
	lib/libbase.la		\
	lib/libaceptacion.la	\
	-lm

check_PROGRAMS = $(TESTS)



# valadoc
if HAVE_VALADOC

AM_V_VALADOC = $(AM_V_VALADOC_$(V))
AM_V_VALADOC_ = $(AM_V_VALADOC_$(AM_DEFAULT_VERBOSITY))
AM_V_VALADOC_0 = @echo "  VALADOC " $@;

docs: doc/aumbrales/index.htm

VALADOCSOURCES =						\
	$(lib_libtest_la_SOURCES)				\
	$(AUMBRALESOURCES)					\
	$(TESTSOURCES)

doc/aumbrales/index.htm: $(VALADOCSOURCES)
	$(AM_V_VALADOC)$(VALADOC)				\
		--directory=doc					\
		--force						\
		--package-name=${PACKAGE}			\
		--package-version=${VERSION}			\
		--target-glib=2.38				\
		--vapidir=vapi					\
		--verbose					\
		@GEE_PACKAGES@					\
		@GTK_PACKAGES@					\
		@SQLITE_PACKAGES@				\
		$(VALADOCSOURCES)

clean-docs:
	-rm -rf doc/

clean-local: clean-docs

endif

