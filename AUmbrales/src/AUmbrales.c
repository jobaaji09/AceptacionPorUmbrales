/* AUmbrales.c generated by valac 0.34.7, the Vala compiler
 * generated from AUmbrales.vala, do not modify */


#include <glib.h>
#include <glib-object.h>
#include "aceptacion.h"
#include <float.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


#define AUMBRALES_TYPE_AUMBRALES (aumbrales_aumbrales_get_type ())
#define AUMBRALES_AUMBRALES(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), AUMBRALES_TYPE_AUMBRALES, AumbralesAumbrales))
#define AUMBRALES_AUMBRALES_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), AUMBRALES_TYPE_AUMBRALES, AumbralesAumbralesClass))
#define AUMBRALES_IS_AUMBRALES(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), AUMBRALES_TYPE_AUMBRALES))
#define AUMBRALES_IS_AUMBRALES_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), AUMBRALES_TYPE_AUMBRALES))
#define AUMBRALES_AUMBRALES_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), AUMBRALES_TYPE_AUMBRALES, AumbralesAumbralesClass))

typedef struct _AumbralesAumbrales AumbralesAumbrales;
typedef struct _AumbralesAumbralesClass AumbralesAumbralesClass;
typedef struct _AumbralesAumbralesPrivate AumbralesAumbralesPrivate;
#define _g_object_unref0(var) ((var == NULL) ? NULL : (var = (g_object_unref (var), NULL)))
#define _g_free0(var) (var = (g_free (var), NULL))

struct _AumbralesAumbrales {
	GObject parent_instance;
	AumbralesAumbralesPrivate * priv;
};

struct _AumbralesAumbralesClass {
	GObjectClass parent_class;
};

struct _AumbralesAumbralesPrivate {
	AumbralesAceptacionSolucion* s;
	gint lote;
	gint* _mejor;
	gint _mejor_length1;
	gint __mejor_size_;
	gint* ultima;
	gint ultima_length1;
	gint _ultima_size_;
	gdouble psi;
	gdouble epsilon;
	gdouble epsilonp;
	gint fac;
};


static gpointer aumbrales_aumbrales_parent_class = NULL;

GType aumbrales_aumbrales_get_type (void) G_GNUC_CONST;
#define AUMBRALES_AUMBRALES_GET_PRIVATE(o) (G_TYPE_INSTANCE_GET_PRIVATE ((o), AUMBRALES_TYPE_AUMBRALES, AumbralesAumbralesPrivate))
enum  {
	AUMBRALES_AUMBRALES_DUMMY_PROPERTY
};
AumbralesAumbrales* aumbrales_aumbrales_new (AumbralesAceptacionSolucion* solucion, gint lote, gdouble psi, gdouble epsilon, gdouble epsilonp);
AumbralesAumbrales* aumbrales_aumbrales_construct (GType object_type, AumbralesAceptacionSolucion* solucion, gint lote, gdouble psi, gdouble epsilon, gdouble epsilonp);
gdouble aumbrales_aumbrales_temperaturaInicial (AumbralesAumbrales* self, gint* s, int s_length1, gdouble t, gdouble pacept);
static gdouble aumbrales_aumbrales_porcentajesAceptados (AumbralesAumbrales* self, gint* sol, int sol_length1, gdouble t);
static gdouble aumbrales_aumbrales_busquedaBinaria (AumbralesAumbrales* self, gint* sol, int sol_length1, gdouble t1, gdouble t2, gdouble pacept);
gdouble aumbrales_aumbrales_calculaLote (AumbralesAumbrales* self, gdouble t);
gint* aumbrales_aumbrales_get_mejor (AumbralesAumbrales* self, int* result_length1);
void aumbrales_aumbrales_set_mejor (AumbralesAumbrales* self, gint* value, int value_length1);
static gint* _vala_array_dup1 (gint* self, int length);
void aumbrales_aumbrales_aceptacionPorUmbrales (AumbralesAumbrales* self, gdouble t, gint* sol, int sol_length1);
static gint* _vala_array_dup2 (gint* self, int length);
static gint* _vala_array_dup3 (gint* self, int length);
static void aumbrales_aumbrales_finalize (GObject* obj);
static void _vala_aumbrales_aumbrales_get_property (GObject * object, guint property_id, GValue * value, GParamSpec * pspec);
static void _vala_aumbrales_aumbrales_set_property (GObject * object, guint property_id, const GValue * value, GParamSpec * pspec);


static gpointer _g_object_ref0 (gpointer self) {
	return self ? g_object_ref (self) : NULL;
}


AumbralesAumbrales* aumbrales_aumbrales_construct (GType object_type, AumbralesAceptacionSolucion* solucion, gint lote, gdouble psi, gdouble epsilon, gdouble epsilonp) {
	AumbralesAumbrales * self = NULL;
	AumbralesAceptacionSolucion* _tmp0_ = NULL;
	AumbralesAceptacionSolucion* _tmp1_ = NULL;
	gint _tmp2_ = 0;
	gdouble _tmp3_ = 0.0;
	gdouble _tmp4_ = 0.0;
	gdouble _tmp5_ = 0.0;
	g_return_val_if_fail (solucion != NULL, NULL);
	self = (AumbralesAumbrales*) g_object_new (object_type, NULL);
	_tmp0_ = solucion;
	_tmp1_ = _g_object_ref0 (_tmp0_);
	_g_object_unref0 (self->priv->s);
	self->priv->s = _tmp1_;
	_tmp2_ = lote;
	self->priv->lote = _tmp2_;
	_tmp3_ = psi;
	self->priv->psi = _tmp3_;
	_tmp4_ = epsilon;
	self->priv->epsilon = _tmp4_;
	_tmp5_ = epsilonp;
	self->priv->epsilonp = _tmp5_;
	return self;
}


AumbralesAumbrales* aumbrales_aumbrales_new (AumbralesAceptacionSolucion* solucion, gint lote, gdouble psi, gdouble epsilon, gdouble epsilonp) {
	return aumbrales_aumbrales_construct (AUMBRALES_TYPE_AUMBRALES, solucion, lote, psi, epsilon, epsilonp);
}


static gchar* double_to_string (gdouble self) {
	gchar* result = NULL;
	gchar* _tmp0_ = NULL;
	gchar* _tmp1_ = NULL;
	gint _tmp1__length1 = 0;
	const gchar* _tmp2_ = NULL;
	gchar* _tmp3_ = NULL;
	gchar* _tmp4_ = NULL;
	_tmp0_ = g_new0 (gchar, G_ASCII_DTOSTR_BUF_SIZE);
	_tmp1_ = _tmp0_;
	_tmp1__length1 = G_ASCII_DTOSTR_BUF_SIZE;
	_tmp2_ = g_ascii_dtostr (_tmp1_, G_ASCII_DTOSTR_BUF_SIZE, self);
	_tmp3_ = g_strdup (_tmp2_);
	_tmp4_ = _tmp3_;
	_tmp1_ = (g_free (_tmp1_), NULL);
	result = _tmp4_;
	return result;
}


gdouble aumbrales_aumbrales_temperaturaInicial (AumbralesAumbrales* self, gint* s, int s_length1, gdouble t, gdouble pacept) {
	gdouble result = 0.0;
	gdouble p = 0.0;
	gint* _tmp0_ = NULL;
	gint _tmp0__length1 = 0;
	gdouble _tmp1_ = 0.0;
	gdouble _tmp2_ = 0.0;
	FILE* _tmp3_ = NULL;
	gdouble _tmp4_ = 0.0;
	gchar* _tmp5_ = NULL;
	gchar* _tmp6_ = NULL;
	gdouble _tmp7_ = 0.0;
	gdouble _tmp8_ = 0.0;
	gdouble _tmp9_ = 0.0;
	gdouble _tmp10_ = 0.0;
	gdouble t1 = 0.0;
	gdouble t2 = 0.0;
	gdouble _tmp12_ = 0.0;
	gdouble _tmp13_ = 0.0;
	FILE* _tmp38_ = NULL;
	gdouble _tmp39_ = 0.0;
	gchar* _tmp40_ = NULL;
	gchar* _tmp41_ = NULL;
	gdouble _tmp42_ = 0.0;
	gchar* _tmp43_ = NULL;
	gchar* _tmp44_ = NULL;
	gint* _tmp45_ = NULL;
	gint _tmp45__length1 = 0;
	gdouble _tmp46_ = 0.0;
	gdouble _tmp47_ = 0.0;
	gdouble _tmp48_ = 0.0;
	gdouble _tmp49_ = 0.0;
	g_return_val_if_fail (self != NULL, 0.0);
	_tmp0_ = s;
	_tmp0__length1 = s_length1;
	_tmp1_ = t;
	_tmp2_ = aumbrales_aumbrales_porcentajesAceptados (self, _tmp0_, _tmp0__length1, _tmp1_);
	p = _tmp2_;
	_tmp3_ = stdout;
	_tmp4_ = p;
	_tmp5_ = double_to_string (_tmp4_);
	_tmp6_ = _tmp5_;
	fprintf (_tmp3_, "porcentage = %s\n", _tmp6_);
	_g_free0 (_tmp6_);
	_tmp7_ = pacept;
	_tmp8_ = p;
	_tmp9_ = fabs (_tmp7_ - _tmp8_);
	_tmp10_ = self->priv->epsilonp;
	if (_tmp9_ <= _tmp10_) {
		gdouble _tmp11_ = 0.0;
		_tmp11_ = t;
		result = _tmp11_;
		return result;
	}
	t1 = (gdouble) 0;
	t2 = (gdouble) 0;
	_tmp12_ = p;
	_tmp13_ = pacept;
	if (_tmp12_ < _tmp13_) {
		gdouble _tmp24_ = 0.0;
		gdouble _tmp25_ = 0.0;
		while (TRUE) {
			gdouble _tmp14_ = 0.0;
			gdouble _tmp15_ = 0.0;
			gdouble _tmp16_ = 0.0;
			gint* _tmp17_ = NULL;
			gint _tmp17__length1 = 0;
			gdouble _tmp18_ = 0.0;
			gdouble _tmp19_ = 0.0;
			FILE* _tmp20_ = NULL;
			gdouble _tmp21_ = 0.0;
			gchar* _tmp22_ = NULL;
			gchar* _tmp23_ = NULL;
			_tmp14_ = p;
			_tmp15_ = pacept;
			if (!(_tmp14_ < _tmp15_)) {
				break;
			}
			_tmp16_ = t;
			t = _tmp16_ * 2;
			_tmp17_ = s;
			_tmp17__length1 = s_length1;
			_tmp18_ = t;
			_tmp19_ = aumbrales_aumbrales_porcentajesAceptados (self, _tmp17_, _tmp17__length1, _tmp18_);
			p = _tmp19_;
			_tmp20_ = stdout;
			_tmp21_ = p;
			_tmp22_ = double_to_string (_tmp21_);
			_tmp23_ = _tmp22_;
			fprintf (_tmp20_, "p<pacept , %s\n", _tmp23_);
			_g_free0 (_tmp23_);
		}
		_tmp24_ = t;
		t1 = _tmp24_ / 2;
		_tmp25_ = t;
		t2 = _tmp25_;
	} else {
		gdouble _tmp36_ = 0.0;
		gdouble _tmp37_ = 0.0;
		while (TRUE) {
			gdouble _tmp26_ = 0.0;
			gdouble _tmp27_ = 0.0;
			gdouble _tmp28_ = 0.0;
			gint* _tmp29_ = NULL;
			gint _tmp29__length1 = 0;
			gdouble _tmp30_ = 0.0;
			gdouble _tmp31_ = 0.0;
			FILE* _tmp32_ = NULL;
			gdouble _tmp33_ = 0.0;
			gchar* _tmp34_ = NULL;
			gchar* _tmp35_ = NULL;
			_tmp26_ = p;
			_tmp27_ = pacept;
			if (!(_tmp26_ > _tmp27_)) {
				break;
			}
			_tmp28_ = t;
			t = _tmp28_ / 2;
			_tmp29_ = s;
			_tmp29__length1 = s_length1;
			_tmp30_ = t;
			_tmp31_ = aumbrales_aumbrales_porcentajesAceptados (self, _tmp29_, _tmp29__length1, _tmp30_);
			p = _tmp31_;
			_tmp32_ = stdout;
			_tmp33_ = p;
			_tmp34_ = double_to_string (_tmp33_);
			_tmp35_ = _tmp34_;
			fprintf (_tmp32_, "p>pacept , %s\n", _tmp35_);
			_g_free0 (_tmp35_);
		}
		_tmp36_ = t;
		t1 = _tmp36_;
		_tmp37_ = t;
		t2 = _tmp37_ * 2;
	}
	_tmp38_ = stdout;
	_tmp39_ = t1;
	_tmp40_ = double_to_string (_tmp39_);
	_tmp41_ = _tmp40_;
	_tmp42_ = t2;
	_tmp43_ = double_to_string (_tmp42_);
	_tmp44_ = _tmp43_;
	fprintf (_tmp38_, " antes de bin t1 = %s,t2=%s", _tmp41_, _tmp44_);
	_g_free0 (_tmp44_);
	_g_free0 (_tmp41_);
	_tmp45_ = s;
	_tmp45__length1 = s_length1;
	_tmp46_ = t1;
	_tmp47_ = t2;
	_tmp48_ = pacept;
	_tmp49_ = aumbrales_aumbrales_busquedaBinaria (self, _tmp45_, _tmp45__length1, _tmp46_, _tmp47_, _tmp48_);
	result = _tmp49_;
	return result;
}


static gdouble aumbrales_aumbrales_porcentajesAceptados (AumbralesAumbrales* self, gint* sol, int sol_length1, gdouble t) {
	gdouble result = 0.0;
	gdouble c = 0.0;
	gint* sprima = NULL;
	gint sprima_length1 = 0;
	gint _sprima_size_ = 0;
	gdouble _tmp17_ = 0.0;
	gint* _tmp18_ = NULL;
	gint _tmp18__length1 = 0;
	g_return_val_if_fail (self != NULL, 0.0);
	c = (gdouble) 0;
	sprima = NULL;
	sprima_length1 = 0;
	_sprima_size_ = sprima_length1;
	{
		gint i = 0;
		i = 1;
		{
			gboolean _tmp0_ = FALSE;
			_tmp0_ = TRUE;
			while (TRUE) {
				gint _tmp2_ = 0;
				gint* _tmp3_ = NULL;
				gint _tmp3__length1 = 0;
				AumbralesAceptacionSolucion* _tmp4_ = NULL;
				gint* _tmp5_ = NULL;
				gint _tmp5__length1 = 0;
				gint _tmp6_ = 0;
				gint* _tmp7_ = NULL;
				AumbralesAceptacionSolucion* _tmp8_ = NULL;
				gint* _tmp9_ = NULL;
				gint _tmp9__length1 = 0;
				gdouble _tmp10_ = 0.0;
				AumbralesAceptacionSolucion* _tmp11_ = NULL;
				gint* _tmp12_ = NULL;
				gint _tmp12__length1 = 0;
				gdouble _tmp13_ = 0.0;
				gdouble _tmp14_ = 0.0;
				gint* _tmp16_ = NULL;
				gint _tmp16__length1 = 0;
				if (!_tmp0_) {
					gint _tmp1_ = 0;
					_tmp1_ = i;
					i = _tmp1_ + 1;
				}
				_tmp0_ = FALSE;
				_tmp2_ = i;
				_tmp3_ = sol;
				_tmp3__length1 = sol_length1;
				if (!(_tmp2_ < _tmp3__length1)) {
					break;
				}
				_tmp4_ = self->priv->s;
				_tmp5_ = sol;
				_tmp5__length1 = sol_length1;
				_tmp7_ = aumbrales_aceptacion_solucion_vecino (_tmp4_, _tmp5_, _tmp5__length1, &_tmp6_);
				sprima = (g_free (sprima), NULL);
				sprima = _tmp7_;
				sprima_length1 = _tmp6_;
				_sprima_size_ = sprima_length1;
				_tmp8_ = self->priv->s;
				_tmp9_ = sprima;
				_tmp9__length1 = sprima_length1;
				_tmp10_ = aumbrales_aceptacion_solucion_fcosto (_tmp8_, _tmp9_, _tmp9__length1);
				_tmp11_ = self->priv->s;
				_tmp12_ = sol;
				_tmp12__length1 = sol_length1;
				_tmp13_ = aumbrales_aceptacion_solucion_fcosto (_tmp11_, _tmp12_, _tmp12__length1);
				_tmp14_ = t;
				if (_tmp10_ <= (_tmp13_ + _tmp14_)) {
					gdouble _tmp15_ = 0.0;
					_tmp15_ = c;
					c = _tmp15_ + 1;
				}
				_tmp16_ = sprima;
				_tmp16__length1 = sprima_length1;
				sol = _tmp16_;
				sol_length1 = _tmp16__length1;
			}
		}
	}
	_tmp17_ = c;
	_tmp18_ = sol;
	_tmp18__length1 = sol_length1;
	result = _tmp17_ / _tmp18__length1;
	sprima = (g_free (sprima), NULL);
	return result;
}


/**
 * Busqueda binaria
 */
static gdouble aumbrales_aumbrales_busquedaBinaria (AumbralesAumbrales* self, gint* sol, int sol_length1, gdouble t1, gdouble t2, gdouble pacept) {
	gdouble result = 0.0;
	gdouble tmedia = 0.0;
	gdouble _tmp0_ = 0.0;
	gdouble _tmp1_ = 0.0;
	gdouble _tmp2_ = 0.0;
	gdouble _tmp3_ = 0.0;
	gdouble _tmp4_ = 0.0;
	gdouble p = 0.0;
	gint* _tmp5_ = NULL;
	gint _tmp5__length1 = 0;
	gdouble _tmp6_ = 0.0;
	gdouble _tmp7_ = 0.0;
	gdouble _tmp8_ = 0.0;
	gdouble _tmp9_ = 0.0;
	gdouble _tmp10_ = 0.0;
	gdouble _tmp11_ = 0.0;
	gdouble _tmp12_ = 0.0;
	gdouble _tmp13_ = 0.0;
	g_return_val_if_fail (self != NULL, 0.0);
	_tmp0_ = t1;
	_tmp1_ = t2;
	tmedia = (_tmp0_ + _tmp1_) / 2;
	_tmp2_ = t2;
	_tmp3_ = t1;
	_tmp4_ = self->priv->epsilonp;
	if ((_tmp2_ - _tmp3_) < _tmp4_) {
		result = tmedia;
		return result;
	}
	_tmp5_ = sol;
	_tmp5__length1 = sol_length1;
	_tmp6_ = tmedia;
	_tmp7_ = aumbrales_aumbrales_porcentajesAceptados (self, _tmp5_, _tmp5__length1, _tmp6_);
	p = _tmp7_;
	_tmp8_ = pacept;
	_tmp9_ = p;
	_tmp10_ = fabs (_tmp8_ - _tmp9_);
	_tmp11_ = self->priv->epsilonp;
	if (_tmp10_ < _tmp11_) {
		result = tmedia;
		return result;
	}
	_tmp12_ = p;
	_tmp13_ = pacept;
	if (_tmp12_ > _tmp13_) {
		gint* _tmp14_ = NULL;
		gint _tmp14__length1 = 0;
		gdouble _tmp15_ = 0.0;
		gdouble _tmp16_ = 0.0;
		gdouble _tmp17_ = 0.0;
		gdouble _tmp18_ = 0.0;
		_tmp14_ = sol;
		_tmp14__length1 = sol_length1;
		_tmp15_ = t1;
		_tmp16_ = tmedia;
		_tmp17_ = p;
		_tmp18_ = aumbrales_aumbrales_busquedaBinaria (self, _tmp14_, _tmp14__length1, _tmp15_, _tmp16_, _tmp17_);
		result = _tmp18_;
		return result;
	} else {
		gint* _tmp19_ = NULL;
		gint _tmp19__length1 = 0;
		gdouble _tmp20_ = 0.0;
		gdouble _tmp21_ = 0.0;
		gdouble _tmp22_ = 0.0;
		gdouble _tmp23_ = 0.0;
		_tmp19_ = sol;
		_tmp19__length1 = sol_length1;
		_tmp20_ = tmedia;
		_tmp21_ = t2;
		_tmp22_ = pacept;
		_tmp23_ = aumbrales_aumbrales_busquedaBinaria (self, _tmp19_, _tmp19__length1, _tmp20_, _tmp21_, _tmp22_);
		result = _tmp23_;
		return result;
	}
}


/**
 *Calcula un lote
 */
static gint* _vala_array_dup1 (gint* self, int length) {
	return g_memdup (self, length * sizeof (gint));
}


gdouble aumbrales_aumbrales_calculaLote (AumbralesAumbrales* self, gdouble t) {
	gdouble result = 0.0;
	FILE* _tmp0_ = NULL;
	gint c = 0;
	gdouble r = 0.0;
	FILE* _tmp32_ = NULL;
	gdouble _tmp33_ = 0.0;
	gint _tmp34_ = 0;
	g_return_val_if_fail (self != NULL, 0.0);
	_tmp0_ = stdout;
	fprintf (_tmp0_, "EMPIEZA LOTE\n");
	c = 0;
	r = (gdouble) 0;
	while (TRUE) {
		gint _tmp1_ = 0;
		gint _tmp2_ = 0;
		gdouble fsl = 0.0;
		AumbralesAceptacionSolucion* _tmp3_ = NULL;
		gint* _tmp4_ = NULL;
		gint _tmp4__length1 = 0;
		gdouble _tmp5_ = 0.0;
		gdouble _tmp6_ = 0.0;
		gint* sprima = NULL;
		AumbralesAceptacionSolucion* _tmp7_ = NULL;
		gint* _tmp8_ = NULL;
		gint _tmp8__length1 = 0;
		gint _tmp9_ = 0;
		gint* _tmp10_ = NULL;
		gint sprima_length1 = 0;
		gint _sprima_size_ = 0;
		gdouble fsp = 0.0;
		AumbralesAceptacionSolucion* _tmp11_ = NULL;
		gint* _tmp12_ = NULL;
		gint _tmp12__length1 = 0;
		gdouble _tmp13_ = 0.0;
		gdouble _tmp14_ = 0.0;
		gdouble _tmp15_ = 0.0;
		AumbralesAceptacionSolucion* _tmp28_ = NULL;
		gint* _tmp29_ = NULL;
		gint _tmp29__length1 = 0;
		gboolean _tmp30_ = FALSE;
		_tmp1_ = c;
		_tmp2_ = self->priv->lote;
		if (!(_tmp1_ < _tmp2_)) {
			break;
		}
		_tmp3_ = self->priv->s;
		_tmp4_ = self->priv->ultima;
		_tmp4__length1 = self->priv->ultima_length1;
		_tmp5_ = aumbrales_aceptacion_solucion_fcosto (_tmp3_, _tmp4_, _tmp4__length1);
		_tmp6_ = t;
		fsl = _tmp5_ + _tmp6_;
		_tmp7_ = self->priv->s;
		_tmp8_ = self->priv->ultima;
		_tmp8__length1 = self->priv->ultima_length1;
		_tmp10_ = aumbrales_aceptacion_solucion_vecino (_tmp7_, _tmp8_, _tmp8__length1, &_tmp9_);
		sprima = _tmp10_;
		sprima_length1 = _tmp9_;
		_sprima_size_ = sprima_length1;
		_tmp11_ = self->priv->s;
		_tmp12_ = sprima;
		_tmp12__length1 = sprima_length1;
		_tmp13_ = aumbrales_aceptacion_solucion_fcosto (_tmp11_, _tmp12_, _tmp12__length1);
		fsp = _tmp13_;
		_tmp14_ = fsp;
		_tmp15_ = fsl;
		if (_tmp14_ <= _tmp15_) {
			gdouble fm = 0.0;
			AumbralesAceptacionSolucion* _tmp16_ = NULL;
			gint* _tmp17_ = NULL;
			gint _tmp17__length1 = 0;
			gint* _tmp18_ = NULL;
			gint _tmp18__length1 = 0;
			gdouble _tmp19_ = 0.0;
			gdouble _tmp20_ = 0.0;
			gdouble _tmp21_ = 0.0;
			gdouble _tmp23_ = 0.0;
			gdouble _tmp24_ = 0.0;
			gint* _tmp25_ = NULL;
			gint _tmp25__length1 = 0;
			gint* _tmp26_ = NULL;
			gint _tmp26__length1 = 0;
			gint _tmp27_ = 0;
			_tmp16_ = self->priv->s;
			_tmp17_ = aumbrales_aumbrales_get_mejor (self, &_tmp17__length1);
			_tmp18_ = _tmp17_;
			_tmp18__length1 = _tmp17__length1;
			_tmp19_ = aumbrales_aceptacion_solucion_fcosto (_tmp16_, _tmp18_, _tmp18__length1);
			fm = _tmp19_;
			_tmp20_ = fsp;
			_tmp21_ = fm;
			if (_tmp20_ <= _tmp21_) {
				gint* _tmp22_ = NULL;
				gint _tmp22__length1 = 0;
				_tmp22_ = sprima;
				_tmp22__length1 = sprima_length1;
				aumbrales_aumbrales_set_mejor (self, _tmp22_, _tmp22__length1);
			}
			_tmp23_ = r;
			_tmp24_ = fsp;
			r = _tmp23_ + _tmp24_;
			_tmp25_ = sprima;
			_tmp25__length1 = sprima_length1;
			_tmp26_ = (_tmp25_ != NULL) ? _vala_array_dup1 (_tmp25_, _tmp25__length1) : ((gpointer) _tmp25_);
			_tmp26__length1 = _tmp25__length1;
			self->priv->ultima = (g_free (self->priv->ultima), NULL);
			self->priv->ultima = _tmp26_;
			self->priv->ultima_length1 = _tmp26__length1;
			self->priv->_ultima_size_ = self->priv->ultima_length1;
			_tmp27_ = c;
			c = _tmp27_ + 1;
		}
		_tmp28_ = self->priv->s;
		_tmp29_ = self->priv->ultima;
		_tmp29__length1 = self->priv->ultima_length1;
		_tmp30_ = aumbrales_aceptacion_solucion_factible (_tmp28_, _tmp29_, _tmp29__length1);
		if (_tmp30_) {
			gint _tmp31_ = 0;
			_tmp31_ = self->priv->fac;
			self->priv->fac = _tmp31_ + 1;
		}
		sprima = (g_free (sprima), NULL);
	}
	_tmp32_ = stdout;
	fprintf (_tmp32_, "TERMINA LOTE\n");
	_tmp33_ = r;
	_tmp34_ = self->priv->lote;
	result = _tmp33_ / _tmp34_;
	return result;
}


/**
 *Aceptacion por umbrales
 */
static gint* _vala_array_dup2 (gint* self, int length) {
	return g_memdup (self, length * sizeof (gint));
}


void aumbrales_aumbrales_aceptacionPorUmbrales (AumbralesAumbrales* self, gdouble t, gint* sol, int sol_length1) {
	gint* _tmp0_ = NULL;
	gint _tmp0__length1 = 0;
	gint* _tmp1_ = NULL;
	gint _tmp1__length1 = 0;
	gint* _tmp2_ = NULL;
	gint _tmp2__length1 = 0;
	gdouble p = 0.0;
	g_return_if_fail (self != NULL);
	_tmp0_ = sol;
	_tmp0__length1 = sol_length1;
	aumbrales_aumbrales_set_mejor (self, _tmp0_, _tmp0__length1);
	_tmp1_ = sol;
	_tmp1__length1 = sol_length1;
	_tmp2_ = (_tmp1_ != NULL) ? _vala_array_dup2 (_tmp1_, _tmp1__length1) : ((gpointer) _tmp1_);
	_tmp2__length1 = _tmp1__length1;
	self->priv->ultima = (g_free (self->priv->ultima), NULL);
	self->priv->ultima = _tmp2_;
	self->priv->ultima_length1 = _tmp2__length1;
	self->priv->_ultima_size_ = self->priv->ultima_length1;
	p = DBL_MAX;
	while (TRUE) {
		gdouble _tmp3_ = 0.0;
		gdouble _tmp4_ = 0.0;
		gdouble pprima = 0.0;
		FILE* _tmp13_ = NULL;
		AumbralesAceptacionSolucion* _tmp14_ = NULL;
		gint* _tmp15_ = NULL;
		gint _tmp15__length1 = 0;
		gdouble _tmp16_ = 0.0;
		FILE* _tmp17_ = NULL;
		gint _tmp18_ = 0;
		gdouble _tmp19_ = 0.0;
		gdouble _tmp20_ = 0.0;
		FILE* _tmp21_ = NULL;
		gdouble _tmp22_ = 0.0;
		_tmp3_ = t;
		_tmp4_ = self->priv->epsilon;
		if (!(_tmp3_ > _tmp4_)) {
			break;
		}
		pprima = (gdouble) 0;
		self->priv->fac = 0;
		while (TRUE) {
			gdouble _tmp5_ = 0.0;
			gdouble _tmp6_ = 0.0;
			gdouble _tmp7_ = 0.0;
			gdouble _tmp8_ = 0.0;
			gdouble _tmp9_ = 0.0;
			gdouble _tmp10_ = 0.0;
			gdouble _tmp11_ = 0.0;
			FILE* _tmp12_ = NULL;
			_tmp5_ = p;
			_tmp6_ = pprima;
			_tmp7_ = fabs (_tmp5_ - _tmp6_);
			_tmp8_ = self->priv->epsilonp;
			if (!(_tmp7_ > _tmp8_)) {
				break;
			}
			_tmp9_ = p;
			pprima = _tmp9_;
			_tmp10_ = t;
			_tmp11_ = aumbrales_aumbrales_calculaLote (self, _tmp10_);
			p = _tmp11_;
			_tmp12_ = stdout;
			fprintf (_tmp12_, "Un Lote lleno\n");
		}
		_tmp13_ = stdout;
		_tmp14_ = self->priv->s;
		_tmp15_ = self->priv->ultima;
		_tmp15__length1 = self->priv->ultima_length1;
		_tmp16_ = aumbrales_aceptacion_solucion_fcosto (_tmp14_, _tmp15_, _tmp15__length1);
		fprintf (_tmp13_, "fcosto=%2.9f\n", _tmp16_);
		_tmp17_ = stdout;
		_tmp18_ = self->priv->fac;
		fprintf (_tmp17_, "factibles = %d\n ", _tmp18_);
		_tmp19_ = self->priv->psi;
		_tmp20_ = t;
		t = _tmp19_ * _tmp20_;
		_tmp21_ = stdout;
		_tmp22_ = t;
		fprintf (_tmp21_, "temperatura=%2.9f\n", _tmp22_);
	}
}


gint* aumbrales_aumbrales_get_mejor (AumbralesAumbrales* self, int* result_length1) {
	gint* result;
	gint* _tmp0_ = NULL;
	gint _tmp0__length1 = 0;
	gint* _tmp1_ = NULL;
	gint _tmp1__length1 = 0;
	g_return_val_if_fail (self != NULL, NULL);
	_tmp0_ = self->priv->_mejor;
	_tmp0__length1 = self->priv->_mejor_length1;
	_tmp1_ = _tmp0_;
	_tmp1__length1 = _tmp0__length1;
	if (result_length1) {
		*result_length1 = _tmp1__length1;
	}
	result = _tmp1_;
	return result;
}


static gint* _vala_array_dup3 (gint* self, int length) {
	return g_memdup (self, length * sizeof (gint));
}


void aumbrales_aumbrales_set_mejor (AumbralesAumbrales* self, gint* value, int value_length1) {
	gint* _tmp0_ = NULL;
	gint _tmp0__length1 = 0;
	gint* _tmp1_ = NULL;
	gint _tmp1__length1 = 0;
	g_return_if_fail (self != NULL);
	_tmp0_ = value;
	_tmp0__length1 = value_length1;
	_tmp1_ = (_tmp0_ != NULL) ? _vala_array_dup3 (_tmp0_, _tmp0__length1) : ((gpointer) _tmp0_);
	_tmp1__length1 = _tmp0__length1;
	self->priv->_mejor = (g_free (self->priv->_mejor), NULL);
	self->priv->_mejor = _tmp1_;
	self->priv->_mejor_length1 = _tmp1__length1;
	self->priv->__mejor_size_ = self->priv->_mejor_length1;
}


static void aumbrales_aumbrales_class_init (AumbralesAumbralesClass * klass) {
	aumbrales_aumbrales_parent_class = g_type_class_peek_parent (klass);
	g_type_class_add_private (klass, sizeof (AumbralesAumbralesPrivate));
	G_OBJECT_CLASS (klass)->get_property = _vala_aumbrales_aumbrales_get_property;
	G_OBJECT_CLASS (klass)->set_property = _vala_aumbrales_aumbrales_set_property;
	G_OBJECT_CLASS (klass)->finalize = aumbrales_aumbrales_finalize;
}


static void aumbrales_aumbrales_instance_init (AumbralesAumbrales * self) {
	self->priv = AUMBRALES_AUMBRALES_GET_PRIVATE (self);
}


static void aumbrales_aumbrales_finalize (GObject* obj) {
	AumbralesAumbrales * self;
	self = G_TYPE_CHECK_INSTANCE_CAST (obj, AUMBRALES_TYPE_AUMBRALES, AumbralesAumbrales);
	_g_object_unref0 (self->priv->s);
	self->priv->_mejor = (g_free (self->priv->_mejor), NULL);
	self->priv->ultima = (g_free (self->priv->ultima), NULL);
	G_OBJECT_CLASS (aumbrales_aumbrales_parent_class)->finalize (obj);
}


GType aumbrales_aumbrales_get_type (void) {
	static volatile gsize aumbrales_aumbrales_type_id__volatile = 0;
	if (g_once_init_enter (&aumbrales_aumbrales_type_id__volatile)) {
		static const GTypeInfo g_define_type_info = { sizeof (AumbralesAumbralesClass), (GBaseInitFunc) NULL, (GBaseFinalizeFunc) NULL, (GClassInitFunc) aumbrales_aumbrales_class_init, (GClassFinalizeFunc) NULL, NULL, sizeof (AumbralesAumbrales), 0, (GInstanceInitFunc) aumbrales_aumbrales_instance_init, NULL };
		GType aumbrales_aumbrales_type_id;
		aumbrales_aumbrales_type_id = g_type_register_static (G_TYPE_OBJECT, "AumbralesAumbrales", &g_define_type_info, 0);
		g_once_init_leave (&aumbrales_aumbrales_type_id__volatile, aumbrales_aumbrales_type_id);
	}
	return aumbrales_aumbrales_type_id__volatile;
}


static void _vala_aumbrales_aumbrales_get_property (GObject * object, guint property_id, GValue * value, GParamSpec * pspec) {
	AumbralesAumbrales * self;
	self = G_TYPE_CHECK_INSTANCE_CAST (object, AUMBRALES_TYPE_AUMBRALES, AumbralesAumbrales);
	switch (property_id) {
		default:
		G_OBJECT_WARN_INVALID_PROPERTY_ID (object, property_id, pspec);
		break;
	}
}


static void _vala_aumbrales_aumbrales_set_property (GObject * object, guint property_id, const GValue * value, GParamSpec * pspec) {
	AumbralesAumbrales * self;
	self = G_TYPE_CHECK_INSTANCE_CAST (object, AUMBRALES_TYPE_AUMBRALES, AumbralesAumbrales);
	switch (property_id) {
		default:
		G_OBJECT_WARN_INVALID_PROPERTY_ID (object, property_id, pspec);
		break;
	}
}



