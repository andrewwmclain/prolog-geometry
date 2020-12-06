maximum(X,Y,Z) :- X >= Y, X >= Z.

vertical(point2d(X1, Y1), point2d(X2, Y2)) :- X1=X2, Y1\=Y2.

horizontal(point2d(X1, Y1), point2d(X2, Y2)) :- Y1=Y2, X1\=X2.

line(point2d(X1, Y1), point2d(X2, Y2), point2d(X3, Y3)) :- 
                                                        ((Y3 - Y2)*(X2 - X1) =:= (Y2 - Y1)*(X3 - X2)).

triangle(point2d(X1, Y1), point2d(X2, Y2), point2d(X3, Y3)) :- 
                                                               not(line(
                                                                   point2d(X1, Y1), 
                                                                   point2d(X2, Y2), 
                                                                   point2d(X3, Y3)
                                                                   )).
isosceles(point2d(X1, Y1), point2d(X2, Y2), point2d(X3, Y3)) :-
                                                                (abs((sqrt((X1-X2)**2 + (Y1-Y2)**2)) - 
                                                                 (sqrt((X1-X3)**2 + (Y1-Y3)**2))) < 0.001;
                                                                 abs((sqrt((X1-X2)**2 + (Y1-Y2)**2)) -
                                                                 (sqrt((X2-X3)**2 + (Y2-Y3)**2))) < 0.001;
                                                                 abs((sqrt((X1-X3)**2 + (Y1-Y3)**2)) -
                                                                 (sqrt((X2-X3)**2 + (Y2-Y3)**2))) < 0.001
                                                                ).

equilateral(point2d(X1, Y1), point2d(X2, Y2), point2d(X3, Y3)) :- 
                                                                (abs((sqrt((X1-X2)**2 + (Y1-Y2)**2)) -
                                                                 (sqrt((X1-X3)**2 + (Y1-Y3)**2))) < 0.001,
                                                                 abs((sqrt((X1-X2)**2 + (Y1-Y2)**2)) -
                                                                 (sqrt((X2-X3)**2 + (Y2-Y3)**2))) < 0.001,
                                                                 abs((sqrt((X1-X3)**2 + (Y1-Y3)**2)) -
                                                                 (sqrt((X2-X3)**2 + (Y2-Y3)**2))) < 0.001
                                                                ).

right(point2d(X1, Y1), point2d(X2, Y2), point2d(X3, Y3)) :- 
                                                                (abs(((X1-X2)**2 + (Y1-Y2)**2) - 
                                                                 (((X1-X3)**2 + (Y1-Y3)**2) +
                                                                 ((X2-X3)**2 + (Y2-Y3)**2))) < 0.001;

                                                                 abs(((X1-X3)**2 + (Y1-Y3)**2) -
                                                                 (((X2-X3)**2 + (Y2-Y3)**2) +
                                                                 ((X1-X2)**2 + (Y1-Y2)**2))) < 0.001;

                                                                 abs(((X2-X3)**2 + (Y2-Y3)**2) -
                                                                 (((X1-X3)**2 + (Y1-Y3)**2) +
                                                                 ((X1-X2)**2 + (Y1-Y2)**2))) < 0.001
                                                                ).

scalene(point2d(X1, Y1), point2d(X2, Y2), point2d(X3, Y3)) :- 
                                                                not((sqrt((X1-X2)**2 + (Y1-Y2)**2)) =:= 
                                                                 (sqrt((X1-X3)**2 + (Y1-Y3)**2));
                                                                 (sqrt((X1-X2)**2 + (Y1-Y2)**2)) =:= 
                                                                 (sqrt((X2-X3)**2 + (Y2-Y3)**2));
                                                                 (sqrt((X1-X3)**2 + (Y1-Y3)**2)) =:=
                                                                 (sqrt((X2-X3)**2 + (Y2-Y3)**2))
                                                                ).

acute(point2d(X1, Y1), point2d(X2, Y2), point2d(X3, Y3)) :- 
                                                                (maximum(
                                                                    sqrt((X1-X3)**2 + (Y1-Y3)**2),
                                                                    sqrt((X2-X3)**2 + (Y2-Y3)**2),
                                                                    sqrt((X1-X2)**2 + (Y1-Y2)**2)
                                                                  ) 
                                                                  ->
                                                                  ((X1-X3)**2 + (Y1-Y3)**2) <                                                                                                                                 
                                                                  (((X2-X3)**2 + (Y2-Y3)**2) +
                                                                  ((X1-X2)**2 + (Y1-Y2)**2))
                                                                ;
                                                                maximum(
                                                                    sqrt((X2-X3)**2 + (Y2-Y3)**2),
                                                                    sqrt((X1-X3)**2 + (Y1-Y3)**2),
                                                                    sqrt((X1-X2)**2 + (Y1-Y2)**2)
                                                                  ) 
                                                                  ->
                                                                  ((X2-X3)**2 + (Y2-Y3)**2) <                                                                                                                                 
                                                                  (((X1-X3)**2 + (Y1-Y3)**2) +
                                                                  ((X1-X2)**2 + (Y1-Y2)**2))
                                                                ;
                                                                  ((X1-X2)**2 + (Y1-Y2)**2) <                                                                                                                                 
                                                                  (((X2-X3)**2 + (Y2-Y3)**2) +
                                                                  ((X1-X3)**2 + (Y1-Y3)**2))
                                                                ).

obtuse(point2d(X1, Y1), point2d(X2, Y2), point2d(X3, Y3)) :- 
                                                                (maximum(
                                                                    sqrt((X1-X3)**2 + (Y1-Y3)**2),
                                                                    sqrt((X2-X3)**2 + (Y2-Y3)**2),
                                                                    sqrt((X1-X2)**2 + (Y1-Y2)**2)
                                                                 ) 
                                                                 ->
                                                                 ((X1-X3)**2 + (Y1-Y3)**2) >                                                                                                                                 
                                                                 (((X2-X3)**2 + (Y2-Y3)**2) +
                                                                  ((X1-X2)**2 + (Y1-Y2)**2))
                                                                ;
                                                                maximum(
                                                                    sqrt((X2-X3)**2 + (Y2-Y3)**2),
                                                                    sqrt((X1-X3)**2 + (Y1-Y3)**2),
                                                                    sqrt((X1-X2)**2 + (Y1-Y2)**2)
                                                                 ) 
                                                                 ->
                                                                 ((X2-X3)**2 + (Y2-Y3)**2) >                                                                                                                                  
                                                                 (((X1-X3)**2 + (Y1-Y3)**2) +
                                                                  ((X1-X2)**2 + (Y1-Y2)**2))
                                                                ;
                                                                 ((X1-X2)**2 + (Y1-Y2)**2) >                                                                                                                                  
                                                                 (((X2-X3)**2 + (Y2-Y3)**2) +
                                                                  ((X1-X3)**2 + (Y1-Y3)**2))
                                                                ).