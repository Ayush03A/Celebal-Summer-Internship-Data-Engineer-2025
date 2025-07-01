SELECT
    h.hacker_id,
    h.name,
    ts.total_score
FROM
    Hackers h
JOIN
    (
        SELECT
            hacker_id,
            SUM(max_score) AS total_score
        FROM
            (
                SELECT
                    hacker_id,
                    challenge_id,
                    MAX(score) AS max_score
                FROM
                    Submissions
                GROUP BY
                    hacker_id,
                    challenge_id
            ) AS MaxScores
        GROUP BY
            hacker_id
    ) AS ts
ON
    h.hacker_id = ts.hacker_id
WHERE
    ts.total_score > 0
ORDER BY
    ts.total_score DESC,
    h.hacker_id ASC;