CREATE TABLE "users" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "firstname" varchar(30) NOT NULL,
  "lastname" varchar(30) NOT NULL,
  "email" varchar(40) NOT NULL,
  "password" varchar(20) NOT NULL,
  "age" int NOT NULL,
  "id_rol" int NOT NULL
);

CREATE TABLE "users_courses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "id_user" int NOT NULL,
  "id_course" int NOT NULL
);

CREATE TABLE "courses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title_curse" varchar(50) NOT NULL,
  "description" varchar(250) NOT NULL,
  "level" varchar(30) NOT NULL
);

CREATE TABLE "videos" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title_video" varchar(50) NOT NULL,
  "url" varchar(250) NOT NULL
);

CREATE TABLE "courses_videos" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "id_course" int NOT NULL,
  "id_video" int NOT NULL
);

CREATE TABLE "categories" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name_categories" varchar(35) NOT NULL
);

CREATE TABLE "courses_categories" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "id_course" int NOT NULL,
  "id_categori" int NOT NULL
);

CREATE TABLE "roles" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name_role" varchar(30) NOT NULL
);

ALTER TABLE "users" ADD FOREIGN KEY ("id_rol") REFERENCES "roles" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("id_user") REFERENCES "users" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("id_course") REFERENCES "courses" ("id");

ALTER TABLE "courses_categories" ADD FOREIGN KEY ("id_categori") REFERENCES "categories" ("id");

ALTER TABLE "courses_categories" ADD FOREIGN KEY ("id_course") REFERENCES "courses" ("id");

ALTER TABLE "courses_videos" ADD FOREIGN KEY ("id_course") REFERENCES "courses" ("id");

ALTER TABLE "courses_videos" ADD FOREIGN KEY ("id_video") REFERENCES "videos" ("id");


INSERT INTO roles (name_role) VALUES('student'),('teacher'),('admin');

INSERT INTO users (firstname, lastname,  email, password, age, id_rol) VALUES('Alicia','Hernandez','alicia.hernandez@example.com','y1$8m#Kt', 29, 1),('Gabriel','Martinez','gabriel.martinez@example.com','B2t#7f$m',42, 2 ),('Sofia','Rodriguez','sofia.rodriguez@example.com','p8#5Ck@r',25, 1 ), ('Javier','Perez','javier.perez@example.com','M3q#9x$L',37, 3 ), ('Maria','Gonzalez','maria.gonzalez@example.com','f5#pK7^t',31, 1 );

INSERT INTO courses (title_curse, description, level) VALUES('Introduction to Python','Learn the basics of Python programming language and start coding like a pro.','Beginner'),('Data Science Fundamentals','Get started with data science and learn how to analyze data using Python.','Intermediate'),('Digital Marketing','Learn how to create and implement successful digital marketing campaigns.','Intermediate'),('Cybersecurity','Discover the fundamentals of cybersecurity and learn how to protect your systems.','Advanced');

INSERT INTO users_courses (id_user, id_course) VALUES(1,1),(1,2),(2,2),(2,3),(3,3);

INSERT INTO categories (name_categories) VALUES('Tecnologi'),('Bisnes'),('Marketing'),('security');

INSERT INTO courses_categories(id_course, id_categori) VALUES(1,1),(2,1),(3,1),(3,2),(4,1),(4,4);

INSERT INTO videos (title_video,url) VALUES('pyton','www.youtube/pyton'),('fundamental cibersecurity','www.youtube/cybersecurity'),('marketin','www.youtube/digitalm_marketing');


INSERT INTO courses_videos (id_course, id_video) VALUES(1,1),(4,2),(3,3),(2,3);



SELECT  users.firstname, roles.name_role,courses.title_curse,  categories.name_categories, videos.url  FROM users JOIN users_courses ON users.id=users_courses.id_user JOIN courses ON users_courses.id_course=courses.id JOIN roles ON roles.id=users.id_rol JOIN courses_categories ON courses_categories.id_course=courses.id JOIN categories ON categories.id=courses_categories.id_categori JOIN courses_videos ON courses_videos.id_course=courses.id JOIN videos ON videos.id=courses_videos.id_video WHERE  roles.id=1;

SELECT  users.firstname, roles.name_role, courses.title_curse,  categories.name_categories, videos.url  FROM users JOIN users_courses ON users.id=users_courses.id_user JOIN courses ON users_courses.id_course=courses.id JOIN roles ON roles.id=users.id_rol JOIN courses_categories ON courses_categories.id_course=courses.id JOIN categories ON categories.id=courses_categories.id_categori JOIN courses_videos ON courses_videos.id_course=courses.id JOIN videos ON videos.id=courses_videos.id_video WHERE  roles.id=2;

SELECT  users.firstname AS teacher, courses.title_curse, courses.level, roles.name_role FROM users JOIN users_courses ON users.id=users_courses.id_user JOIN courses ON users_courses.id_course=courses.id JOIN roles ON roles.id=users.id_rol WHERE  roles.id=2;

SELECT  users.firstname AS student, courses.title_curse, courses.level, roles.name_role FROM users JOIN users_courses ON users.id=users_courses.id_user JOIN courses ON users_courses.id_course=courses.id JOIN roles ON roles.id=users.id_rol WHERE  roles.id=1;