BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"first_name"	varchar(30) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"last_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "sales_agents" (
	"id"	integer NOT NULL,
	"first_name"	varchar(20) NOT NULL,
	"last_name"	varchar(30) NOT NULL,
	"hire_date"	date NOT NULL,
	"birthday_date"	date NOT NULL,
	"city"	varchar(20) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "sales_reports" (
	"id"	integer NOT NULL,
	"period"	varchar(20) NOT NULL,
	"sales_volume"	real NOT NULL,
	"agent_id_id"	integer,
	FOREIGN KEY("agent_id_id") REFERENCES "sales_agents"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (1,'contenttypes','0001_initial','2020-07-20 17:53:29.603963'),
 (2,'auth','0001_initial','2020-07-20 17:53:29.620938'),
 (3,'admin','0001_initial','2020-07-20 17:53:29.636873'),
 (4,'admin','0002_logentry_remove_auto_add','2020-07-20 17:53:29.653921'),
 (5,'admin','0003_logentry_add_action_flag_choices','2020-07-20 17:53:29.670964'),
 (6,'contenttypes','0002_remove_content_type_name','2020-07-20 17:53:29.711855'),
 (7,'auth','0002_alter_permission_name_max_length','2020-07-20 17:53:29.726534'),
 (8,'auth','0003_alter_user_email_max_length','2020-07-20 17:53:29.740877'),
 (9,'auth','0004_alter_user_username_opts','2020-07-20 17:53:29.753563'),
 (10,'auth','0005_alter_user_last_login_null','2020-07-20 17:53:29.769520'),
 (11,'auth','0006_require_contenttypes_0002','2020-07-20 17:53:29.779494'),
 (12,'auth','0007_alter_validators_add_error_messages','2020-07-20 17:53:29.794520'),
 (13,'auth','0008_alter_user_username_max_length','2020-07-20 17:53:29.808476'),
 (14,'auth','0009_alter_user_last_name_max_length','2020-07-20 17:53:29.831415'),
 (15,'auth','0010_alter_group_name_max_length','2020-07-20 17:53:29.852925'),
 (16,'auth','0011_update_proxy_permissions','2020-07-20 17:53:29.870419'),
 (17,'sessions','0001_initial','2020-07-20 17:53:29.887345'),
 (18,'sales','0001_initial','2020-07-20 18:04:18.099439'),
 (19,'sales','0002_auto_20200721_1323','2020-07-21 10:23:09.597867');
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (1,'2020-07-20 18:04:49.344230','1','Agents object (1)','[{"added": {}}]',7,1,1),
 (2,'2020-07-20 18:05:18.089080','1','Reports object (1)','[{"added": {}}]',8,1,1);
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (1,'admin','logentry'),
 (2,'auth','permission'),
 (3,'auth','group'),
 (4,'auth','user'),
 (5,'contenttypes','contenttype'),
 (6,'sessions','session'),
 (7,'sales','agents'),
 (8,'sales','reports');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (1,1,'add_logentry','Can add log entry'),
 (2,1,'change_logentry','Can change log entry'),
 (3,1,'delete_logentry','Can delete log entry'),
 (4,1,'view_logentry','Can view log entry'),
 (5,2,'add_permission','Can add permission'),
 (6,2,'change_permission','Can change permission'),
 (7,2,'delete_permission','Can delete permission'),
 (8,2,'view_permission','Can view permission'),
 (9,3,'add_group','Can add group'),
 (10,3,'change_group','Can change group'),
 (11,3,'delete_group','Can delete group'),
 (12,3,'view_group','Can view group'),
 (13,4,'add_user','Can add user'),
 (14,4,'change_user','Can change user'),
 (15,4,'delete_user','Can delete user'),
 (16,4,'view_user','Can view user'),
 (17,5,'add_contenttype','Can add content type'),
 (18,5,'change_contenttype','Can change content type'),
 (19,5,'delete_contenttype','Can delete content type'),
 (20,5,'view_contenttype','Can view content type'),
 (21,6,'add_session','Can add session'),
 (22,6,'change_session','Can change session'),
 (23,6,'delete_session','Can delete session'),
 (24,6,'view_session','Can view session'),
 (25,8,'add_reports','Can add reports'),
 (26,8,'change_reports','Can change reports'),
 (27,8,'delete_reports','Can delete reports'),
 (28,8,'view_reports','Can view reports'),
 (29,7,'add_agents','Can add agents'),
 (30,7,'change_agents','Can change agents'),
 (31,7,'delete_agents','Can delete agents'),
 (32,7,'view_agents','Can view agents');
INSERT INTO "auth_user" ("id","password","last_login","is_superuser","username","first_name","email","is_staff","is_active","date_joined","last_name") VALUES (1,'pbkdf2_sha256$180000$eGz3KWSDzf3l$hxUw6yPLxCBMzgEz+wrO82JkgjUbsB5xgtrZh8OmtII=','2020-07-20 17:55:36.455010',1,'ralph','','',1,1,'2020-07-20 17:55:23.296785','');
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ('c3dsda7n53te41b9sy1bxgsoe3ungbus','NTQ3OGNmZGU4MTM1Nzc3ZTZlMzRmYWIzZGY4ZTAyOTc5MTA5NDE0Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlZjY4ZWM1Mjg2MTRmOWY4NmUxODM1YThhNWFkZTBkYzdjNWRlZDFmIn0=','2020-08-03 17:55:36.461994');
INSERT INTO "sales_agents" ("id","first_name","last_name","hire_date","birthday_date","city") VALUES (13,'James','Romero','2019-01-25','1975-06-10','Munich'),
 (14,'Kayla','Arias','2019-04-26','1991-05-05','Berlin'),
 (15,'Gabriel','Appleton','2020-05-30','1995-03-06','Hamburg');
INSERT INTO "sales_reports" ("id","period","sales_volume","agent_id_id") VALUES (12,'2020-06',350.74,14),
 (13,'2020-05',255.42,13),
 (14,'2020-07',451.12,14);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "sales_reports_agent_id_id_bbb65a91" ON "sales_reports" (
	"agent_id_id"
);
COMMIT;
