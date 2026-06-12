CREATE TABLE job_applied(
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR (255),
    status VARCHAR (50)
);
SELECT * FROM job_applied;
INSERT INTO job_applied 
            (job_id, 
             application_sent_date, 
             custom_resume, 
             resume_file_name,
             cover_letter_sent,
             cover_letter_file_name,
             status)
VALUES     (1, '2026-06-01', true, 'resume_01.pdf', true, 'cover_letter_01.pdf', 'submitted'),
           (2, '2026-06-02', true, 'resume_02.pdf', false, NULL, 'interview scheduled'),
           (3, '2026-06-03', true, 'resume_03.pdf', true, 'cover_letter_03.pdf', 'ghosted'),
           (4, '2026-06-04', true, 'resume_04.pdf', false, NULL, 'submitted'),
           (5, '2026-06-05', true, 'resume_05.pdf', true, 'cover_letter_05.pdf', 'rejected');

SELECT * FROM job_applied ;

ALTER TABLE job_applied
ADD contact VARCHAR(50);
           
UPDATE job_applied
SET contact = 'Elrich'
WHERE job_id = 1;
UPDATE job_applied
SET contact = 'elumali'
WHERE job_id = 2;
UPDATE job_applied
SET contact = 'Ezhili'
WHERE job_id = 3;
UPDATE job_applied
SET contact = 'Elavarasi'
WHERE job_id = 4;
UPDATE job_applied
SET contact = 'Elsa'
WHERE job_id = 5;

ALTER TABLE job_applied
RENAME COLUMN contact TO contact_name;

ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT;

ALTER TABLE job_applied
DROP COLUMN contact_name;

DROP TABLE job_applied;

