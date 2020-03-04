-- Q1 : on cherche les peres qui ont deux enfants union les meres qui ont deux enfants

select * from personne where numpers in
(select numperspere from perede group by numperspere having count(*)>=2
union
select numpersmere from merede group by numpersmere having count(*)>=2
);

-- Autre solution avec jointure

select * from personne join
(select numperspere from perede group by numperspere having count(*)>=2
union
select numpersmere from merede group by numpersmere having count(*)>=2)
on numpers=numperspere ;

-- Q2

select * from personne where numpers in
(
select MDE.numpersMere from merede MDE join perede PDE
           on MDE.numpersenfant=PDE.numperspere
union
select MDE.numpersMere from merede MDE join merede MDE2
          on MDE.numpersenfant=MDE2.numpersmere
);

-- Q3

select * from personne where numpers in (

select numperspere from perede where numpersenfant=
  (select numpers from personne where nompers='Durand' and prenompers='Paul')

);

-- Autre solution avec jointure

select * from personne where numpers in (

select numperspere from
  (select numpers from personne where nompers='Durand' and prenompers='Paul') join perede
    on numpers=numpersenfant
);

-- Q4

select * from personne where not(nompers='Dupont' and prenompers='Jeanne') and numpers in (

select numpersenfant from merede where numpersmere=
  (select numpersmere from merede where numpersenfant=
    (select numpers from personne where nompers='Dupont' and prenompers='Jeanne')
   )
);




-- Q5 : on crée une vue pour compter les enfants de chaque mere

create or replace view nbenfantmere(numpersmere,nbenfant) as
select numpersmere, count(*) from mereDe
group by numpersmere;

select * from personne where numpers in (
select numpersmere from nbenfantmere where nbenfant=(select max(nbenfant) from nbenfantmere)
);

-- Q6

SELECT nomPers "Nom", prenomPers "Prénom" FROM Personne
WHERE numPers In
  ((Select numPers
   From   Personne
   Where sexePers = 'M'
   And numPers NOT IN
     (Select numPersPere
      From PereDe))
   UNION
  (Select numPers
   From Personne
   Where sexePers = 'F'
   And numPers NOT IN
     (Select numPersMere
      From MereDe)));

-- Q7

CREATE or replace  VIEW Couple (numPersPere, numPersMere)
AS SELECT DISTINCT numPersPere, numPersMere
   From PereDe natural join MereDe;
SELECT nomPers "Nom", prenomPers "Prénom" FROM Personne
WHERE numPers IN
  (Select numPersPere
   From Couple
   Group By numPersPere
   Having Count(*)= 1
   UNION
   Select numPersMere
   From Couple
   Group By numPersMere
   Having Count(*)= 1);

-- Q8 : (on connait pas les deux parents)
SELECT nomPers "Nom", prenomPers "Prénom" FROM Personne
WHERE numPers NOT IN
  (Select numPersEnfant
   From PereDe
   UNION
   Select numPersEnfant
   From MereDe);

-- Q9 : soit Q8 en faisant intersect, au lieu de union ou bien directement cette solution  :
SELECT nomPers "Nom", prenomPers "Prénom" FROM Personne
WHERE numPers NOT IN
  (Select numPersEnfant
   FROM PereDe natural join MereDe m
);

-- Q10 : (sa mère n’a qu’un seul enfant ou son père n’a qu’un seul enfant)

SELECT nomPers "Nom", prenomPers "Prénom" FROM Personne
WHERE numPers IN
  (Select numPersEnfant
   From PereDe
   Where numPersPere IN
        (Select numPersPere
         From PereDe
         Group By numPersPere
         Having count(*) = 1)
   UNION
   Select numPersEnfant
   From MereDe
   Where numPersMere IN
        (Select numPersMere
         From MereDe
         Group By numPersMere
         Having count(*) = 1));

-- Q11 (bon courage!)


CREATE or replace  VIEW GrandPereP (numPers)  AS
  SELECT numPersPere
   From PereDe
   Where numPersEnfant IN
        (Select numPersPere
         From PereDe
         Where numPersEnfant =
              (Select numPers
               From Personne
               Where prenomPers = 'Luc'
               And   nomPers = 'Durand'));

CREATE or replace VIEW GrandMereP (numPers)  AS
   SELECT numPersMere
   From MereDe
   Where numPersEnfant IN
        (Select numPersPere
         From PereDe
         Where numPersEnfant =
              (Select numPers
               From Personne
               Where prenomPers = 'Luc'
               And   nomPers = 'Durand'));
CREATE or replace VIEW GrandPereM (numPers)  AS
   SELECT numPersPere
   From PereDe
   Where numPersEnfant IN
        (Select numPersMere
         From MereDe
         Where numPersEnfant =
              (Select numPers
               From Personne
               Where prenomPers = 'Luc'
               And   nomPers = 'Durand'));
CREATE or replace VIEW GrandMereM (numPers)  AS
   SELECT numPersMere
   From MereDe
   Where numPersEnfant IN
        (Select numPersMere
         From MereDe
         Where numPersEnfant =
              (Select numPers
               From Personne
               Where prenomPers = 'Luc'
               And   nomPers = 'Durand'));
               

 CREATE or replace  VIEW Parent (numPers) AS
           SELECT numPersPere From PereDe Where numPersEnfant =
                   (Select numPers From Personne
                   Where prenomPers = 'Luc' And nomPers = 'Durand')
           UNION
           SELECT numPersMere From MereDe Where numPersEnfant =
                   (Select numPers From Personne
                    Where prenomPers = 'Luc' And nomPers = 'Durand');
           CREATE or replace VIEW OncleTante (numPers) AS
           ((SELECT m.numPersEnfant From MereDe m join grandmerep g
           on m.numPersMere = g.numPers
           UNION
           SELECT p.numPersEnfant From PereDe p join grandperep g
           on p.numPersPere = g.numPers
           UNION
           SELECT m.numPersEnfant From MereDe m join grandmerem g
           on m.numPersMere = g.numPers
           UNION
           SELECT p.numPersEnfant From PereDe p join grandperem g
           on p.numPersPere = g.numPers
           ) MINUS (Select numPers from Parent));
           
SELECT nomPers, prenomPers, numPersEnfant FROM OncleTante join MereDe m on OncleTante.numPers=m.numPersMere
           join  Personne on Personne.numPers=m.numPersEnfant
           UNION
           SELECT nomPers, prenomPers, numPersEnfant
           FROM OncleTante join PereDe p on OncleTante.numPers=p.numPersPere
           join Personne on Personne.numPers=p.numPersEnfant;

 


