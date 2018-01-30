CREATE DATABASE reviuuer CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
 
CREATE USER 'student'@'%' IDENTIFIED BY 'student18';

CREATE TABLE reviuuer.user (
    id int NOT NULL AUTO_INCREMENT,
    userName varchar(255),
    pWord varchar(255),
	PRIMARY KEY (id)
);

CREATE TABLE reviuuer.course (
	id int NOT NULL AUTO_INCREMENT,
	c_level ENUM('G1', 'G2', 'A1', 'A2'),
	pace_of_study int,
	teaching_form varchar(255),
	course_language ENUM('English', 'Swedish', 'Other'),
	app_code varchar(255),
	course_online bool,
	PRIMARY KEY (id)
);

CREATE TABLE reviuuer.teacher (
	id int NOT NULL AUTO_INCREMENT,
	first_name varchar(255),
	last_name varchar(255),
	title varchar(255),
	PRIMARY KEY (id)
);

CREATE TABLE reviuuer.review (
	id int NOT NULL AUTO_INCREMENT,
	course_id int,
	teacher_id int,
	quality ENUM('1','2','3','4','5'),
	difficulty ENUM('1','2','3','4','5'), 
	canRecommend bool,
	worthCredits ENUM('1','2','3','4','5'),
	booksReq bool,
	percentageMand ENUM('1','2','3','4','5'),
	exam bool,
	courseReview varchar(255),
	teacherReview varchar(255),
	PRIMARY KEY (id),
	FOREIGN KEY (course_id) REFERENCES reviuuer.course(id),
	FOREIGN KEY (teacher_id) REFERENCES reviuuer.teacher(id)
);

CREATE TABLE reviuuer.likeAndDislike (
	id int NOT NULL AUTO_INCREMENT,
	user_id int, 
	review_id int,
	comment_id int,
  	like_type ENUM('like', 'dislike'),
	PRIMARY KEY (id),
	FOREIGN KEY (user_id) REFERENCES reviuuer.user(id),
	FOREIGN KEY (review_id) REFERENCES reviuuer.review(id),
	FOREIGN KEY (comment_id) REFERENCES reviuuer.comment(id)
);

CREATE TABLE reviuuer.comments (
	id int NOT NULL AUTO_INCREMENT,
	user_id int,
	review_id int,
	comment_text varchar(255),
	PRIMARY KEY (id),
	FOREIGN KEY (user_id) REFERENCES reviuuer.user(id),
	FOREIGN KEY (review_id) REFERENCES reviuuer.review(id)
);

CREATE TABLE reviuuer.report (
	id int NOT NULL AUTO_INCREMENT ,
	user_id int,
	review_id int,
	comment_id int,
	description varchar(255),
	PRIMARY KEY (id),
	FOREIGN KEY (user_id) REFERENCES reviuuer.user(id),
	FOREIGN KEY (review_id) REFERENCES reviuuer.review(id),
	FOREIGN KEY (comment_id) REFERENCES reviuuer.comment(id)
);

CREATE TABLE reviuuer.period (
	id int NOT NULL AUTO_INCREMENT,
	course_id int,
	credits int,
	period int,
	semester ENUM('VT', 'HT'),
	PRIMARY KEY (id),
	FOREIGN KEY (course_id) REFERENCES reviuuer.course(id)
);

CREATE TABLE reviuuer.courseAndTeacher (
	id int NOT NULL AUTO_INCREMENT,
	course_id int,
	teacher_id int,
	PRIMARY KEY (id),
	FOREIGN KEY (course_id) REFERENCES reviuuer.course(id),
	FOREIGN KEY (teacher_id) REFERENCES reviuuer.teacher(id)
);

CREATE TABLE reviuuer.program (
	id int NOT NULL AUTO_INCREMENT,
	name varchar(255),
	credits int,
	master bool,
	PRIMARY KEY (id)
);

CREATE TABLE reviuuer.courseAndProgram (
	id int NOT NULL AUTO_INCREMENT,
	course_id int,
	program_id int,
	PRIMARY KEY (id),
	FOREIGN KEY (course_id) REFERENCES reviuuer.course(id),
	FOREIGN KEY (program_id) REFERENCES reviuuer.program(id)
);