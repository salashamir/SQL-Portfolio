-- Project completed for Khan Academy's Intro to SQL Course. In this project I created a table for exercise/workout items in an exercise log. Main point was to introduce usage of CASE statement.

CREATE TABLE exercise_logs
    (id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT,
    minutes INTEGER, 
    calories INTEGER,
    heart_rate INTEGER);

INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES 
    ("biking", 30, 100, 110),
    ("biking", 10, 30, 105),
    ("dancing", 15, 200, 120),
    ("dancing", 15, 165, 120),
    ("tree climbing", 30, 70, 90),
    ("tree climbing", 25, 72, 80),
    ("rowing", 30, 70, 90),
    ("hiking", 60, 80, 85);

-- Select all columns for all exercise logs 
SELECT * FROM exercise_logs;

-- Get a count for the exercise logs where the heart rate is above the safe maximum as defined by 220 - age
SELECT COUNT(*) FROM exercise_logs WHERE heart_rate > 220 - 30;

-- Count how many exercise logs are within 50 - 90 % of the max heart rate
SELECT COUNT(*) FROM exercise_logs WHERE
    heart_rate >= ROUND(0.50 * (220-30)) 
    AND  heart_rate <= ROUND(0.90 * (220-30));
    
-- use conditional CASE statement to add a column indicating whether an exercise log's heart rate is above the max, above the target, below the target, above target, within target.
SELECT type, heart_rate,
    CASE 
        WHEN heart_rate > 220-30 THEN "above max"
        WHEN heart_rate > ROUND(0.90 * (220-30)) THEN "above target"
        WHEN heart_rate > ROUND(0.50 * (220-30)) THEN "within target"
        ELSE "below target"
    END as "hr_zone"
FROM exercise_logs;

--  Count how many exercise logs' heart rates fall within the deignated hr_zones established in the column by the CASE statement
SELECT COUNT(*),
    CASE 
        WHEN heart_rate > 220-30 THEN "above max"
        WHEN heart_rate > ROUND(0.90 * (220-30)) THEN "above target"
        WHEN heart_rate > ROUND(0.50 * (220-30)) THEN "within target"
        ELSE "below target"
    END as "hr_zone"
FROM exercise_logs
GROUP BY hr_zone;