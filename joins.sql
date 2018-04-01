--1
SELECT *
FROM users;
--2
SELECT *
FROM posts 
WHERE user_id = 100;
--3
SELECT posts.*, users.first_name, users.last_name
FROM posts
INNER JOIN users ON posts.user_id = users.user_id
WHERE posts.user_id = 200;
--4
SELECT posts.*, users.username
FROM posts
INNER JOIN users ON posts.user_id = users.user_id
WHERE users.first_name = 'Norene' AND users.last_name = 'Schmitt';
--5
SELECT users.username
FROM users
INNER JOIN posts ON users.user_id = posts.user_id
WHERE posts.created_at > timestamp '2015-01-01';
--6
SELECT posts.title, posts.content, users.username
FROM posts
INNER JOIN users
USING (user_id);
WHERE users.created_at < timestamp '2015-01-01';
--7
SELECT posts.title as "Post Title", comments.*
FROM comments
INNER JOIN posts USING (post_id);
--8
SELECT posts.title as "post_title", posts.url as "post_url", comments.body as "comment_body"
FROM comments
INNER JOIN posts USING (post_id)
WHERE posts.created_at < timestamp '2015-01-01';
--9
SELECT posts.title as "post_title", posts.url as "post_url", comments.body as "comment_body"
FROM comments
INNER JOIN posts USING (post_id)
WHERE posts.created_at > timestamp '2015-01-01';
--10
SELECT posts.title as "post_title", posts.url as "post_url", comments.body as "comment_body"
FROM comments
INNER JOIN posts USING (post_id)
WHERE comments.body LIKE '%USB%';
--11
SELECT posts.title as "post_title", users.first_name, users.last_name, comments.body as "comment_body"
FROM comments
INNER JOIN users USING (user_id)
INNER JOIN posts USING (post_id)
WHERE comments.body LIKE '%matrix%';
--12
SELECT users.first_name, users.last_name, comments.body as "comment_body"
FROM comments
INNER JOIN users USING (user_id)
INNER JOIN posts USING (post_id)
WHERE comments.body LIKE '%SSL%' AND posts.content LIKE '%dolorum%';
--13
SELECT users.first_name as "post_author_first_name", users.last_name as "post_author_last_name", posts.title as "post_title", users.username as "comment_author_username", comments.body as "comment_body"
FROM comments
JOIN users USING (user_id)
JOIN posts USING (post_id)
WHERE (comments.body LIKE '%SSL%' OR comments.body LIKE '%firewall%') AND posts.content LIKE '%nemo%';