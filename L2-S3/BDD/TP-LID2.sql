-- R1
SELECT nomPers, PrenomPers
FROM Personne
WHERE
  numPers IN 
  (
    (
    SELECT numPersPere 
    FROM PereDe
    GROUP BY numPersPere
    HAVING COUNT(numPersEnfant)>=2
    )
    UNION
    (
    SELECT numPersMere 
    FROM MereDe
    GROUP BY numPersMere
    HAVING COUNT(numPersEnfant)>=2
    )
  )
  
-- R2
CREATE VIEW (numPersPere) Pere AS 
SELECT numPersPere 
FROM PereDe
GROUP BY numPersPere
HAVING COUNT(numPersEnfant)<1;

