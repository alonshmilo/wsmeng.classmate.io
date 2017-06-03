/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     2017/5/23 15:16:23                           */
/*==============================================================*/


alter table ACTIVE_INFO
   drop constraint FK_ACTIVE_I_REFERENCE_STUDENT_;

alter table ANSWER
   drop constraint FK_ANSWER_REFERENCE_QUESTION;

alter table ANSWER
   drop constraint FK_ANSWER_REFERENCE_SELECT;

alter table ANSWER
   drop constraint FK_ANSWER_REFERENCE_STUDENT;

alter table ANSWER
   drop constraint FK_ANS_REFERENCE_STUDENT;

alter table ANSWER
   drop constraint FK_ANSWER_REFERENCE_STUDENT_;

alter table IMAGE_INFO
   drop constraint FK_IMAGE_IN_REFERENCE_STUDENT_;

alter table MESSAGE_INFO
   drop constraint FK_MESSAGE__REFERENCE_STUDENT_;

alter table MOOD_INFO
   drop constraint FK_MOOD_INF_REFERENCE_STUDENT_;

alter table QUESTION
   drop constraint FK_QUESTION_REFERENCE_REPORT;

alter table QUESTION
   drop constraint FK_QUESTION_REFERENCE_TYPE;

alter table QUESTION
   drop constraint FK_QUES_REFERENCE_TYPE;

alter table QUESTION
   drop constraint FK_QUESTION_REFERENCE_QUESTION;

alter table QUESTIONJUDGEMENT
   drop constraint FK_JUDGEMENT_REFERENCE_REPORT;

alter table QUESTIONMUTIPLE
   drop constraint FK_MUTIPLE_REFERENCE_REPORT;

alter table QUESTIONPLAIN
   drop constraint FK_PLAIN_REFERENCE_REPORT;

alter table QUESTIONRADIO
   drop constraint FK_RADIO_REFERENCE_REPORT;

alter table QUESTIONREPORT
   drop constraint FK_QUESTION_REFERENCE_STUDENT_;

alter table "SELECT"
   drop constraint FK_SELECT_REFERENCE_QUESTION;

alter table STUDENT_INFO
   drop constraint FK_STUDENT__REFERENCE_ADRESS_I;

alter table WORDS_INFO
   drop constraint FK_WORDS_IN_REFERENCE_STUDENT_;

drop table ACTIVE_INFO cascade constraints;

drop table ADRESS_INFO cascade constraints;

drop table ANSWER cascade constraints;

drop table IMAGE_INFO cascade constraints;

drop table MESSAGE_INFO cascade constraints;

drop table MOOD_INFO cascade constraints;

drop table QUESTION cascade constraints;

drop table QUESTIONJUDGEMENT cascade constraints;

drop table QUESTIONMUTIPLE cascade constraints;

drop table QUESTIONPLAIN cascade constraints;

drop table QUESTIONRADIO cascade constraints;

drop table QUESTIONREPORT cascade constraints;

drop table QUESTIONTYPE cascade constraints;

drop table "SELECT" cascade constraints;

drop table STUDENT_INFO cascade constraints;

drop table WORDS_INFO cascade constraints;

/*==============================================================*/
/* Table: ACTIVE_INFO                                           */
/*==============================================================*/
create table ACTIVE_INFO 
(
   "Active_Name"        VARCHAR2(20),
   "Active_ID"          INT                  not null,
   "Student_ID"         INT,
   "Active_Cost"        NUMBER(5,2),
   "Active_Sum"         NUMBER(5,2),
   "Active_Balance"     NUMBER(5,2),
   "Active_Type"        INT,
   "Active_Descripe"    VARCHAR2(250),
   constraint PK_ACTIVE_INFO primary key ("Active_ID")
);

comment on column ACTIVE_INFO."Active_Cost" is
'该次活动总共花费的费用';

comment on column ACTIVE_INFO."Active_Sum" is
'该次活动总共筹集到的钱数';

comment on column ACTIVE_INFO."Active_Balance" is
'该次活动的剩余余额';

comment on column ACTIVE_INFO."Active_Type" is
'活动的类型(支出，收入)';

comment on column ACTIVE_INFO."Active_Descripe" is
'活动的描述';

/*==============================================================*/
/* Table: ADRESS_INFO                                           */
/*==============================================================*/
create table ADRESS_INFO 
(
   "Adress_ID"          INT                  not null,
   "Adress_City"        VARCHAR2(10),
   "Adress_Down"        VARCHAR2(20),
   "Adress_Number"      VARCHAR2(20),
   constraint PK_ADRESS_INFO primary key ("Adress_ID")
);

comment on column ADRESS_INFO."Adress_City" is
'城市';

comment on column ADRESS_INFO."Adress_Down" is
'乡镇';

comment on column ADRESS_INFO."Adress_Number" is
'房门号';

/*==============================================================*/
/* Table: ANSWER                                                */
/*==============================================================*/
create table ANSWER 
(
   ANSWER_ID            INTEGER              not null,
   QUESTION_ID          INTEGER,
   SELECT_ID            INTEGER,
   Student_ID         INT,
   STUDENT_NAME         VARCHAR2(20),
   constraint PK_ANSWER primary key (ANSWER_ID)
);

/*==============================================================*/
/* Table: IMAGE_INFO                                            */
/*==============================================================*/
create table IMAGE_INFO 
(
   IMAGE_ID             INTEGER              not null,
   IMAGE_CONTEXT        BLOB,
   STUDENT_ID           INTEGER,
   STUDENT_NAME         VARCHAR2(20),
   constraint PK_IMAGE_INFO primary key (IMAGE_ID)
);

/*==============================================================*/
/* Table: MESSAGE_INFO                                          */
/*==============================================================*/
create table MESSAGE_INFO 
(
   "Message_ID"         INT                  not null,
   "Message_Title"      VARCHAR2(50),
   "Message_Context"    VARCHAR2(250),
   "Student_ID"         INT,
   constraint PK_MESSAGE_INFO primary key ("Message_ID")
);

/*==============================================================*/
/* Table: MOOD_INFO                                             */
/*==============================================================*/
create table MOOD_INFO 
(
   MOOD_ID              INTEGER              not null,
   MOOD_CONTEXT         VARCHAR2(250),
   STUDENT_ID           INTEGER,
   STUDENT_NAME         VARCHAR2(20),
   constraint PK_MOOD_INFO primary key (MOOD_ID)
);

/*==============================================================*/
/* Table: QUESTION                                              */
/*==============================================================*/
create table QUESTION 
(
   QUESTION_ID          INTEGER              not null,
   QUESTION_NAME        VARCHAR2(100),
   MUSTANSWER           SMALLINT,
   REPORT_ID            INTEGER,
   TYPE_ID              INTEGER,
   constraint PK_QUESTION primary key (QUESTION_ID)
);

comment on column QUESTION.REPORT_ID is
'属于那个问卷调查中的题';

/*==============================================================*/
/* Table: QUESTIONREPORT                                        */
/*==============================================================*/
create table QUESTIONREPORT 
(
   REPORT_ID            INTEGER              not null,
   REPORT_TITLE         VARCHAR2(100),
   STUDENT_NAME         VARCHAR2(20),
   STUDENT_ID           INTEGER,
   POST_DATE            VARCHAR2(20),
   END_DATE             VARCHAR2(20),
   constraint PK_QUESTIONREPORT primary key (REPORT_ID)
);

comment on column QUESTIONREPORT.REPORT_TITLE is
'问卷调查的标题';

comment on column QUESTIONREPORT.POST_DATE is
'问卷发布的时间';

comment on column QUESTIONREPORT.END_DATE is
'问卷结束的时间';

/*==============================================================*/
/* Table: QUESTIONTYPE                                          */
/*==============================================================*/
create table QUESTIONTYPE 
(
   TYPE_ID              INTEGER              not null,
   QUESTION_TYPE        VARCHAR2(20),
   constraint PK_QUESTIONTYPE primary key (TYPE_ID)
);

/*==============================================================*/
/* Table: "OPTIONS"                                              */
/*==============================================================*/
create table OPTIONS
(
   SELECT_ID            INTEGER              not null,
   QUESTION_ID          INTEGER,
   SELECT_CONTENT       VARCHAR2(100),
   constraint PK_SELECT primary key (SELECT_ID)
);

/*==============================================================*/
/* Table: STUDENT_INFO                                          */
/*==============================================================*/
create table STUDENT_INFO 
(
   "Student_ID"         INT                  not null,
   "Student_Name"       VARCHAR2(10),
   "Student_Phone"      VARCHAR2(11),
   "Student_eMail"      VARCHAR2(20),
   "Adress_ID"          INT,
   "Student_Password"   VARCHAR2(20),
   "Student_Grade"      INT,
   constraint PK_STUDENT_INFO primary key ("Student_ID")
);

comment on column STUDENT_INFO."Adress_ID" is
'地址的ID';

/*==============================================================*/
/* Table: WORDS_INFO                                            */
/*==============================================================*/
create table WORDS_INFO 
(
   WORDS_ID             INTEGER              not null,
   WORDS_CONTEXT        VARCHAR2(250),
   GUEST_ID             INTEGER,
   PARENT_ID            INTEGER,
   HOST_ID              INTEGER,
   constraint PK_WORDS_INFO primary key (WORDS_ID)
);

comment on column WORDS_INFO.WORDS_ID is
'留言表的ID';

comment on column WORDS_INFO.WORDS_CONTEXT is
'留言的内容';

comment on column WORDS_INFO.GUEST_ID is
'谁留的言';

comment on column WORDS_INFO.PARENT_ID is
'回复的是那一条留言';

comment on column WORDS_INFO.HOST_ID is
'给谁留的言';

alter table ACTIVE_INFO
   add constraint FK_ACTIVE_I_REFERENCE_STUDENT_ foreign key ("Student_ID")
      references STUDENT_INFO ("Student_ID");

alter table ANSWER
   add constraint FK_ANSWER_REFERENCE_QUESTION foreign key (QUESTION_ID)
      references QUESTION (QUESTION_ID);

alter table ANSWER
   add constraint FK_ANSWER_REFERENCE_SELECT foreign key (SELECT_ID)
      references OPTIONS (SELECT_ID);

alter table ANSWER
   add constraint FK_ANSWER_REFERENCE_STUDENT foreign key (Student_ID)
      references STUDENT_INFO (Student_ID);

alter table ANSWER
   add constraint FK_ANS_REFERENCE_STUDENT foreign key ("Student_ID")
      references STUDENT_INFO ("Student_ID");

alter table IMAGE_INFO
   add constraint FK_IMAGE_IN_REFERENCE_STUDENT_ foreign key (STUDENT_ID)
      references STUDENT_INFO ("Student_ID");

alter table MESSAGE_INFO
   add constraint FK_MESSAGE__REFERENCE_STUDENT_ foreign key ("Student_ID")
      references STUDENT_INFO ("Student_ID");

alter table MOOD_INFO
   add constraint FK_MOOD_INF_REFERENCE_STUDENT_ foreign key (STUDENT_ID)
      references STUDENT_INFO ("Student_ID");

alter table QUESTION
   add constraint FK_QUESTION_REFERENCE_REPORT foreign key (REPORT_ID)
      references QUESTIONREPORT (REPORT_ID);

alter table QUESTION
   add constraint FK_QUESTION_REFERENCE_TYPE foreign key (TYPE_ID)
      references QUESTIONTYPE (TYPE_ID);

alter table QUESTIONREPORT
   add constraint FK_QUESTION_REFERENCE_STUDENT_ foreign key (STUDENT_ID)
      references STUDENT_INFO (Student_ID);

alter table OPTIONS
   add constraint FK_OPTIONS_REFERENCE_QUESTION foreign key (QUESTION_ID)
      references QUESTION (QUESTION_ID);

alter table STUDENT_INFO
   add constraint FK_STUDENT__REFERENCE_ADRESS_I foreign key ("Adress_ID")
      references ADRESS_INFO ("Adress_ID");

alter table WORDS_INFO
   add constraint FK_WORDS_IN_REFERENCE_STUDENT_ foreign key (GUEST_ID)
      references STUDENT_INFO ("Student_ID");

