(*Execice 1 *)
let est_multiple = fun x y -> x mod y = 0 ;;

(*Exercice 2*)
let somme_f_i = fun a b -> a +. float_of_int b ;;

(*Execrice 3 Exercice de control continu*)
let f = fun (n,(x,y)) ->
	       if n < 0 then failwith "undified"
	       else let rec aux = fun i x y n ->
		      if i > n then 0
		      else (x-i)*(y+i) + aux (i+1) x y n in aux 0 x y n ;;
(*Exercice 3 bis*)
let f = fun p ->
  let rec somme = fun i x y n ->
		if i > n then 0 else (x-i)*(y+i) + somme (i+1) x y n
  in if fst p < 0 then failwith "indefini" else somme 0 (fst(snd p)) (snd(snd p)) (fst p) ;;

(*Exercice 4 Exercice de Controle*)
let neg_bf = fun f -> f true || f false ;;  
  (*exemple :*) neg_bf (fun x -> false);;

(*Exercie 5 Exercice de controle*)
let double_argument = fun f x -> f x x ;;
  
let seize_fois = fun  s ->
  double_argument (^) (double_argument (^) (double_argument (^) ( double_argument (^)  s))) ;;

(*Exercice 6 Exercice de control*)
   
let rec b_en_10 = fun entier  base -> if entier < 10  then entier else (b_en_10 (entier/10) base) * base + entier mod 10 ;;
