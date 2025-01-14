--PROJECT 9 User Engagement Analysis

CREATE TABLE Posts (post_id INT PRIMARY KEY, post_content TEXT, post_date TIMESTAMP);

INSERT INTO Posts (post_id, post_content, post_date)
VALUES
(1, 'Lorem ipsum dolor sit amet', '2023-08-25 10:00:00'),
(2, 'Exploring the beauty of nature', '2023-08-26 15:30:00'),
(3, 'Unveiling the latest tech trends', '2023-08-27 12:00:00'),
(4, 'Journey into the world of literature', '2023-08-28 09:45:00'),
(5, 'Capturing the essence of city life', '2023-08-29 16:20:00');

CREATE TABLE UserReactionss (
    reaction_id INT PRIMARY KEY,
    user_id INT,
    post_id INT,
    reaction_type VARCHAR(50),
    reaction_date TIMESTAMP);

INSERT INTO UserReactionss (reaction_id, user_id, post_id, reaction_type, reaction_date)
VALUES
(1, 101, 1, 'like', '2023-08-25 10:15:00'),
(2, 102, 1, 'comment', '2023-08-25 11:30:00'),
(3, 103, 1, 'share', '2023-08-26 12:45:00'),
(4, 101, 2, 'like', '2023-08-26 15:45:00'),
(5, 102, 2, 'comment', '2023-08-27 09:20:00'),
(6, 104, 2, 'like', '2023-08-27 10:00:00'),
(7, 105, 3, 'comment', '2023-08-27 14:30:00'),
(8, 101, 3, 'like', '2023-08-28 08:15:00'),
(9, 103, 4, 'like', '2023-08-28 10:30:00'),
(10, 105, 4, 'share', '2023-08-29 11:15:00'),
(11, 104, 5, 'like', '2023-08-29 16:30:00'),
(12, 101, 5, 'comment', '2023-08-30 09:45:00');

SELECT * FROM Posts;
 
SELECT * FROM UserReactions;
  
SELECT 
    p.post_id,
    p.post_content,
    COUNT(CASE WHEN ur.reaction_type = 'like' THEN 1 END) AS num_likes,
    COUNT(CASE WHEN ur.reaction_type = 'comment' THEN 1 END) AS num_comments,
    COUNT(CASE WHEN ur.reaction_type = 'share' THEN 1 END) AS num_shares
FROM 
    Posts p
LEFT JOIN 
    UserReactions ur ON p.post_id = ur.post_id
WHERE 
    p.post_id = 2
GROUP BY 
    p.post_id, p.post_content;


SELECT 
    DATE(ur.reaction_date) AS reaction_day,
    COUNT(DISTINCT ur.user_id) AS distinct_users,
    COUNT(*) AS total_reactions,
    ROUND(COUNT(*)::NUMERIC / COUNT(DISTINCT ur.user_id), 4) AS avg_reactions_per_user
FROM 
    UserReactions ur
GROUP BY 
    DATE(ur.reaction_date)
ORDER BY 
    reaction_day;

SELECT 
    p.post_id,
    p.post_content,
    r.total_reactions
FROM 
    Posts p
JOIN (
    SELECT 
        post_id,
        COUNT(*) AS total_reactions
    FROM 
        UserReactions
    GROUP BY 
        post_id
) r ON p.post_id = r.post_id
ORDER BY 
    r.total_reactions DESC
LIMIT 3;
