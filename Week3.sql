-- Week 3 SQL Assignment by Srini Illapani
-- ---------------------------------------

-- 1. Videos table. Create one table to keep track of the videos. This table should include a unique ID, the title of the video, the length in minutes, and the URL.
-- Populate the table with at least three related videos from YouTube or other publicly available resources.

DROP TABLE IF EXISTS si_videos;

CREATE TABLE si_videos
(
  video_id int PRIMARY KEY,
  title varchar NOT NULL,
  length decimal,
  url varchar
);

INSERT INTO si_videos ( video_id, title, length, url ) VALUES ( 1, 'Introduction to Practical Data Science with R', 16.20, 'https://www.youtube.com/watch?v=vNm7qU9ecrs');
INSERT INTO si_videos ( video_id, title, length, url ) VALUES ( 2, 'R Tutorial 01: Installing R', 2.01, 'https://www.youtube.com/watch?v=tCjns0EpAo8&list=PLw5h0DiJ-9PAOOFS2LfXxoEVla4w_59Th');
INSERT INTO si_videos ( video_id, title, length, url ) VALUES ( 3, 'R Programming Tutorial Lesson 2: Copying Data from Excel', 12.42, 'https://www.youtube.com/watch?v=U69k3hjDlM0&index=2&list=PLou2j1IrPSzxrng2U3Li0eDFzWIhRwfR5');

SELECT * FROM si_videos;

-- 2. Reviewers table. Create a second table that provides at least two user reviews for each of at least two of the videos. These should be imaginary reviews that include
-- columns for the user’s name (“Mohan”, “Joy”, etc.), the rating (which could be NULL, or a number between 0 and 5), and a short text review (“Loved it!”). There should be
-- a column that links back to the ID column in the table of videos.

DROP TABLE IF EXISTS si_reviewers;

CREATE TABLE si_reviewers
(
  reviewer_id int PRIMARY KEY,
  r_name varchar,
  rating int,
  review varchar,
  video_id int NULL REFERENCES si_videos
);
INSERT INTO si_reviewers ( reviewer_id, r_name, rating, review, video_id ) VALUES ( 1, 'Srini', 4, 'Good book for R students', 1);
INSERT INTO si_reviewers ( reviewer_id, r_name, rating, review, video_id ) VALUES ( 2, 'David', 5, 'Great book for R beginners', 1);
INSERT INTO si_reviewers ( reviewer_id, r_name, rating, review, video_id ) VALUES ( 3, 'Kim', 3, 'Refer this video if you have install issuew for R', 2);
INSERT INTO si_reviewers ( reviewer_id, r_name, rating, review, video_id ) VALUES ( 4, 'Travis', 4, 'Love this video', NULL);
INSERT INTO si_reviewers ( reviewer_id, r_name, rating, review, video_id ) VALUES ( 5, 'Jennifer', 4, 'Helped me with R install', 2);
INSERT INTO si_reviewers ( reviewer_id, r_name, rating, review, video_id ) VALUES ( 6, 'Borat', 1, 'Dont know why I spent 30 mins on this video', NULL);

SELECT * FROM si_reviewers;

-- 3. Report on Video Reviews. Write a JOIN statement that shows information from both tables.

--- using INNER JOIN
SELECT a.video_id, a.title, a.length, b.reviewer_id,  b.r_name, b.rating, b.review
	FROM si_videos a INNER JOIN si_reviewers b
	ON a.video_id = b.video_id;

--- using LEFT JOIN
SELECT a.video_id, a.title, a.length, b.reviewer_id, b.r_name, b.rating, b.review
	FROM si_videos a LEFT JOIN si_reviewers b
	ON a.video_id = b.video_id;

--- using RIGHT JOIN
SELECT a.video_id, a.title, a.length, b.reviewer_id, b.r_name, b.rating, b.review
	FROM si_videos a RIGHT JOIN si_reviewers b
	ON a.video_id = b.video_id;	

--- using OUTER JOIN
SELECT a.video_id, a.title, a.length, b.reviewer_id, b.r_name, b.rating, b.review
	FROM si_videos a FULL OUTER JOIN si_reviewers b
	ON a.video_id = b.video_id;


  