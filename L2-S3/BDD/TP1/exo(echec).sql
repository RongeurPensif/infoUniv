-- 1 
	SELECT nomCli, prenomCli 
	FROM Client 
	ORDER BY nomCli, prenomCli   ; 

-- 2      
	SELECT codeAct, nomAct, valeurCourante 
	FROM  Action ;
                                                                                              
-- 3    
	Select *
  From Action
  Where valeurcourante = 
    (Select Max(valeurCourante)
    From Action)
  Or valeurcourante = 
    (Select Min(valeurCourante) 
    From Action);

CREATE VIEW actionPL AS 
	SELECT codeAct
	FROM	
	NATURAL JOIN
  (SELECT numCli
	FROM Client
	WHERE prenomCli='Pierre' and nomCli='Leloup');
  
--4    
SELECT *
FROM
(actionPL)
NATURAL JOIN
Action ;
