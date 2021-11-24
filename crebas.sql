/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     20/11/2021 23:55:03                          */
/*==============================================================*/


drop table ADMINISTRATIVO;

drop table AGENDAMIENTO;

drop table DETALLECITA;

drop table EXAMENES;

drop table EXAMENESTIPO;

drop table INCUBACION;

drop table INSUMO;

drop table LIMPIEZA;

drop table MADRE;

drop table MANDA_A_REALIZAR;

drop table MANTENIMIENTO;

drop table MEDICO;

drop table PARTO;

drop table PIDE;

drop table QUIROFANO;

drop table SALAMATERNIDAD;

drop table SE_REUNE_MADRE_Y_DOCTOR;

drop table TIPO;

drop table TRANSALADO_A_INCUBACION;

drop table TRANSLADO_A_SALAMATERNIDAD;

/*==============================================================*/
/* Table: ADMINISTRATIVO                                        */
/*==============================================================*/
create table ADMINISTRATIVO (
   ID_ADMIN             INT4                 not null,
   CEDULA_ADMIN         VARCHAR(10)          not null,
   NOMBRE_ADMIN         CHAR(50)             not null,
   APELLIDO_ADMIN       CHAR(50)             not null,
   DIRECCION_ADMIN      CHAR(50)             not null,
   CORREO_ADMIN         CHAR(30)             not null,
   TELEFONO_ADMIN       CHAR(10)             not null,
   PROFESION_ADMIN      CHAR(50)             not null,
   constraint PK_ADMINISTRATIVO primary key (ID_ADMIN)
);

/*==============================================================*/
/* Table: AGENDAMIENTO                                          */
/*==============================================================*/
create table AGENDAMIENTO (
   FECHACITA_AGEN       DATE                 not null,
   ID_ADMIN             INT4                 null,
   FECHAINICIO_AGEN     DATE                 not null,
   FECHAAGENDA_AGEN     DATE                 not null,
   HORA_AGEN            TIME                 not null,
   DOCTOR_AGEN          CHAR(50)             not null,
   AGENDAREALIZADA_AGEN CHAR(50)             not null,
   AGENDACANCELADA_AGEN CHAR(50)             not null,
   constraint PK_AGENDAMIENTO primary key (FECHACITA_AGEN)
);

/*==============================================================*/
/* Table: DETALLECITA                                           */
/*==============================================================*/
create table DETALLECITA (
   FECHA_CITA           DATE                 not null,
   ID_MEDI              INT4                 null,
   ID_MADRE             INT4                 null,
   PRESCRIPCION_CITA    CHAR(200)            not null,
   constraint PK_DETALLECITA primary key (FECHA_CITA)
);

/*==============================================================*/
/* Table: EXAMENES                                              */
/*==============================================================*/
create table EXAMENES (
   FECHA_EXAM           DATE                 not null,
   FECHA_CITA           DATE                 null,
   DESCRIPCION_EXAM     CHAR(256)            not null,
   constraint PK_EXAMENES primary key (FECHA_EXAM)
);

/*==============================================================*/
/* Table: EXAMENESTIPO                                          */
/*==============================================================*/
create table EXAMENESTIPO (
   FECHA_EXAM           DATE                 not null,
   ID_TIPO              CHAR(5)              not null,
   RESULTADO_EXAM       CHAR(200)            not null,
   constraint PK_EXAMENESTIPO primary key (FECHA_EXAM, ID_TIPO)
);

/*==============================================================*/
/* Table: INCUBACION                                            */
/*==============================================================*/
create table INCUBACION (
   ID_INCUB             INT4                 not null,
   ID_LIM               INT4                 null,
   ID_MANTE             INT4                 null,
   FECHAINGRESO_INCUB   DATE                 not null,
   CONDICIONES_INCU     CHAR(200)            not null,
   VISITAS_INCUB        CHAR(256)            not null,
   TRATAMIENTO_INCUB    CHAR(256)            not null,
   constraint PK_INCUBACION primary key (ID_INCUB)
);

/*==============================================================*/
/* Table: INSUMO                                                */
/*==============================================================*/
create table INSUMO (
   FECHA_INSU           DATE                 not null,
   FECHA_CITA           DATE                 null,
   ROPAQIRURGICA_INSU   CHAR(200)            not null,
   MATERIALPRESIONARTERIAL_INSU CHAR(200)            not null,
   INSTRUMENTQUIRURGICA_INSU CHAR(200)            not null,
   MATERIALBIOSEGURIDAD_INSU CHAR(200)            not null,
   constraint PK_INSUMO primary key (FECHA_INSU)
);

/*==============================================================*/
/* Table: LIMPIEZA                                              */
/*==============================================================*/
create table LIMPIEZA (
   ID_LIM               INT4                 not null,
   CEDULA_LIM           VARCHAR(10)          not null,
   NOMBRE_LIM           CHAR(50)             not null,
   APELLIDO_LIM         CHAR(50)             not null,
   DIRECCION_LIM        CHAR(50)             not null,
   CORREO_LIM           CHAR(50)             not null,
   TELEFONO_LIM         CHAR(50)             not null,
   AREA_LIM             CHAR(50)             not null,
   ESPECIALIDAD_LIM     CHAR(50)             not null,
   constraint PK_LIMPIEZA primary key (ID_LIM)
);

/*==============================================================*/
/* Table: MADRE                                                 */
/*==============================================================*/
create table MADRE (
   ID_MADRE             INT4                 not null,
   ID_ADMIN             INT4                 null,
   CEDULA_MADRE         VARCHAR(10)          not null,
   NOMBRE_MADRE         CHAR(50)             not null,
   APELLIDO_MADRE       CHAR(50)             not null,
   NACIONALIDAD_MADRE   CHAR(50)             not null,
   TIPOSANGRE_MADRE     CHAR(20)             not null,
   FECHANACIMIENTO_MADRE DATE                 not null,
   CORREO_MADRE         CHAR(50)             not null,
   TELEFONO1_MADRE      CHAR(10)             not null,
   TELEFONO2_MADRE      CHAR(10)             not null,
   DIRECCION_MADRE      CHAR(50)             not null,
   constraint PK_MADRE primary key (ID_MADRE)
);

/*==============================================================*/
/* Table: MANDA_A_REALIZAR                                      */
/*==============================================================*/
create table MANDA_A_REALIZAR (
   FECHA_EXAM           DATE                 not null,
   ID_MEDI              INT4                 not null,
   constraint PK_MANDA_A_REALIZAR primary key (FECHA_EXAM, ID_MEDI)
);

/*==============================================================*/
/* Table: MANTENIMIENTO                                         */
/*==============================================================*/
create table MANTENIMIENTO (
   ID_MANTE             INT4                 not null,
   NOMBRE_MANT          CHAR(50)             not null,
   APELLIDO_MANT        CHAR(50)             not null,
   EQUIPOUTILIZADO_MANT CHAR(50)             not null,
   REPARACION_MAT       CHAR(50)             not null,
   FECHA_MANT           DATE                 not null,
   constraint PK_MANTENIMIENTO primary key (ID_MANTE)
);

/*==============================================================*/
/* Table: MEDICO                                                */
/*==============================================================*/
create table MEDICO (
   ID_MEDI              INT4                 not null,
   CEDULA_MEDI          VARCHAR(10)          not null,
   NOMBRE_MEDI          CHAR(50)             not null,
   APELLIDO_MEDI        CHAR(50)             not null,
   DIRECCION_MEDI       CHAR(50)             not null,
   CORREO_MEDI          CHAR(50)             not null,
   TELEFONO_MEDI        CHAR(50)             not null,
   ESPECIALIDAD         CHAR(50)             not null,
   constraint PK_MEDICO primary key (ID_MEDI)
);

/*==============================================================*/
/* Table: PARTO                                                 */
/*==============================================================*/
create table PARTO (
   ID_PART              INT4                 not null,
   ID_LIM               INT4                 null,
   ID_MEDI              INT4                 null,
   ID_MANTE             INT4                 null,
   ID_MADRE             INT4                 null,
   OBSTRETA_PART        CHAR(100)            not null,
   PEDIATRA_PART        CHAR(100)            not null,
   NEONATOLOGO_PART     CHAR(100)            not null,
   CANTIDAD_DE_PART     CHAR(200)            not null,
   FECHA_DE_PART        DATE                 not null,
   SEXONEONATO_PART     CHAR(20)             not null,
   PESONEONATO_PART     CHAR(50)             not null,
   NOVEDAD_PART         CHAR(200)            not null,
   constraint PK_PARTO primary key (ID_PART)
);

/*==============================================================*/
/* Table: PIDE                                                  */
/*==============================================================*/
create table PIDE (
   ID_MEDI              INT4                 not null,
   FECHA_INSU           DATE                 not null,
   constraint PK_PIDE primary key (ID_MEDI, FECHA_INSU)
);

/*==============================================================*/
/* Table: QUIROFANO                                             */
/*==============================================================*/
create table QUIROFANO (
   ID_QUIROFANO_QUIROF  INT4                 not null,
   ID_PART              INT4                 null,
   TEMPERATURA_QUIROF   CHAR(100)            not null,
   HUMEDAD_QUIROF       CHAR(100)            not null,
   NIVELRUIDO_QUIROF    CHAR(100)            not null,
   FILTRADO_QUIROF      CHAR(100)            not null,
   CONDICION_QUIROF     CHAR(120)            not null,
   constraint PK_QUIROFANO primary key (ID_QUIROFANO_QUIROF)
);

/*==============================================================*/
/* Table: SALAMATERNIDAD                                        */
/*==============================================================*/
create table SALAMATERNIDAD (
   ID_MATER             INT4                 not null,
   ID_LIM               INT4                 null,
   ID_MANTE             INT4                 null,
   FECHAINGRESO_MATER   DATE                 not null,
   CONDICIONES_MATER    CHAR(50)             not null,
   VISITAS_MATER        CHAR(50)             not null,
   PRESCRIPCION_MATER   CHAR(100)            not null,
   constraint PK_SALAMATERNIDAD primary key (ID_MATER)
);

/*==============================================================*/
/* Table: SE_REUNE_MADRE_Y_DOCTOR                               */
/*==============================================================*/
create table SE_REUNE_MADRE_Y_DOCTOR (
   FECHACITA_AGEN       DATE                 not null,
   ID_MADRE             INT4                 not null,
   constraint PK_SE_REUNE_MADRE_Y_DOCTOR primary key (FECHACITA_AGEN, ID_MADRE)
);

/*==============================================================*/
/* Table: TIPO                                                  */
/*==============================================================*/
create table TIPO (
   ID_TIPO              CHAR(5)              not null,
   NOMBRETIPO           CHAR(50)             not null,
   constraint PK_TIPO primary key (ID_TIPO)
);

/*==============================================================*/
/* Table: TRANSALADO_A_INCUBACION                               */
/*==============================================================*/
create table TRANSALADO_A_INCUBACION (
   ID_PART              INT4                 not null,
   ID_INCUB             INT4                 not null,
   constraint PK_TRANSALADO_A_INCUBACION primary key (ID_PART, ID_INCUB)
);

/*==============================================================*/
/* Table: TRANSLADO_A_SALAMATERNIDAD                            */
/*==============================================================*/
create table TRANSLADO_A_SALAMATERNIDAD (
   ID_MATER             INT4                 not null,
   ID_PART              INT4                 not null,
   constraint PK_TRANSLADO_A_SALAMATERNIDAD primary key (ID_MATER, ID_PART)
);

alter table AGENDAMIENTO
   add constraint FK_AGENDAMI_ADMIN_AGE_ADMINIST foreign key (ID_ADMIN)
      references ADMINISTRATIVO (ID_ADMIN)
      on delete restrict on update restrict;

alter table DETALLECITA
   add constraint FK_DETALLEC_CONOCE_MADRE foreign key (ID_MADRE)
      references MADRE (ID_MADRE)
      on delete restrict on update restrict;

alter table DETALLECITA
   add constraint FK_DETALLEC_ESPECIFIC_MEDICO foreign key (ID_MEDI)
      references MEDICO (ID_MEDI)
      on delete restrict on update restrict;

alter table EXAMENES
   add constraint FK_EXAMENES_PRESCRIBE_DETALLEC foreign key (FECHA_CITA)
      references DETALLECITA (FECHA_CITA)
      on delete restrict on update restrict;

alter table EXAMENESTIPO
   add constraint FK_EXAMENES_TIENE_EXAMENES foreign key (FECHA_EXAM)
      references EXAMENES (FECHA_EXAM)
      on delete restrict on update restrict;

alter table EXAMENESTIPO
   add constraint FK_EXAMENES_TIENE2_TIPO foreign key (ID_TIPO)
      references TIPO (ID_TIPO)
      on delete restrict on update restrict;

alter table INCUBACION
   add constraint FK_INCUBACI_MANTENIMI_MANTENIM foreign key (ID_MANTE)
      references MANTENIMIENTO (ID_MANTE)
      on delete restrict on update restrict;

alter table INCUBACION
   add constraint FK_INCUBACI_REALIZA_L_LIMPIEZA foreign key (ID_LIM)
      references LIMPIEZA (ID_LIM)
      on delete restrict on update restrict;

alter table INSUMO
   add constraint FK_INSUMO_PRESCRIBE_DETALLEC foreign key (FECHA_CITA)
      references DETALLECITA (FECHA_CITA)
      on delete restrict on update restrict;

alter table MADRE
   add constraint FK_MADRE_ENCONTACT_ADMINIST foreign key (ID_ADMIN)
      references ADMINISTRATIVO (ID_ADMIN)
      on delete restrict on update restrict;

alter table MANDA_A_REALIZAR
   add constraint FK_MANDA_A__MANDA_A_R_EXAMENES foreign key (FECHA_EXAM)
      references EXAMENES (FECHA_EXAM)
      on delete restrict on update restrict;

alter table MANDA_A_REALIZAR
   add constraint FK_MANDA_A__MANDA_A_R_MEDICO foreign key (ID_MEDI)
      references MEDICO (ID_MEDI)
      on delete restrict on update restrict;

alter table PARTO
   add constraint FK_PARTO_DATOS_PAR_MADRE foreign key (ID_MADRE)
      references MADRE (ID_MADRE)
      on delete restrict on update restrict;

alter table PARTO
   add constraint FK_PARTO_INCLUYE_MEDICO foreign key (ID_MEDI)
      references MEDICO (ID_MEDI)
      on delete restrict on update restrict;

alter table PARTO
   add constraint FK_PARTO_MANTENIMI_MANTENIM foreign key (ID_MANTE)
      references MANTENIMIENTO (ID_MANTE)
      on delete restrict on update restrict;

alter table PARTO
   add constraint FK_PARTO_REALIZA_LIMPIEZA foreign key (ID_LIM)
      references LIMPIEZA (ID_LIM)
      on delete restrict on update restrict;

alter table PIDE
   add constraint FK_PIDE_PIDE_MEDICO foreign key (ID_MEDI)
      references MEDICO (ID_MEDI)
      on delete restrict on update restrict;

alter table PIDE
   add constraint FK_PIDE_PIDE2_INSUMO foreign key (FECHA_INSU)
      references INSUMO (FECHA_INSU)
      on delete restrict on update restrict;

alter table QUIROFANO
   add constraint FK_QUIROFAN_QUIROFANO_PARTO foreign key (ID_PART)
      references PARTO (ID_PART)
      on delete restrict on update restrict;

alter table SALAMATERNIDAD
   add constraint FK_SALAMATE_MANTENIMI_MANTENIM foreign key (ID_MANTE)
      references MANTENIMIENTO (ID_MANTE)
      on delete restrict on update restrict;

alter table SALAMATERNIDAD
   add constraint FK_SALAMATE_REALIZA_L_LIMPIEZA foreign key (ID_LIM)
      references LIMPIEZA (ID_LIM)
      on delete restrict on update restrict;

alter table SE_REUNE_MADRE_Y_DOCTOR
   add constraint FK_SE_REUNE_SE_REUNE__AGENDAMI foreign key (FECHACITA_AGEN)
      references AGENDAMIENTO (FECHACITA_AGEN)
      on delete restrict on update restrict;

alter table SE_REUNE_MADRE_Y_DOCTOR
   add constraint FK_SE_REUNE_SE_REUNE__MADRE foreign key (ID_MADRE)
      references MADRE (ID_MADRE)
      on delete restrict on update restrict;

alter table TRANSALADO_A_INCUBACION
   add constraint FK_TRANSALA_TRANSALAD_PARTO foreign key (ID_PART)
      references PARTO (ID_PART)
      on delete restrict on update restrict;

alter table TRANSALADO_A_INCUBACION
   add constraint FK_TRANSALA_TRANSALAD_INCUBACI foreign key (ID_INCUB)
      references INCUBACION (ID_INCUB)
      on delete restrict on update restrict;

alter table TRANSLADO_A_SALAMATERNIDAD
   add constraint FK_TRANSLAD_TRANSLADO_SALAMATE foreign key (ID_MATER)
      references SALAMATERNIDAD (ID_MATER)
      on delete restrict on update restrict;

alter table TRANSLADO_A_SALAMATERNIDAD
   add constraint FK_TRANSLAD_TRANSLADO_PARTO foreign key (ID_PART)
      references PARTO (ID_PART)
      on delete restrict on update restrict;

