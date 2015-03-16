function [ Offspring, channel ] = Mutation( Parent, Boundary )
%MUTATION Summary of this function goes here
%   Detailed explanation goes here
Offspring = Parent;
mutation_Pos = randi([1, 12]);
switch mutation_Pos
    case {1, 2, 3} % birth
        Offspring{1}(mutation_Pos) = randi([1, Boundary{1}]);
        channel = mutation_Pos;
    case {4, 5, 6} % level
        Offspring{2}(mutation_Pos-3) = randi([1, Boundary{2}]);
        Offspring{7}{mutation_Pos-3} = randi([0, 1],2*Offspring{2}(mutation_Pos-3)+1, 2*Offspring{2}(mutation_Pos-3)+1);
        channel = mutation_Pos-3;
    case {7, 8, 9} % number of cell blocks
        Offspring{3}(mutation_Pos-6) = randi([1, Boundary{3}]);
        Offspring{4}{mutation_Pos-6} = randi([1, Boundary{6}], 1, Offspring{3}(mutation_Pos-6));    
        Offspring{5}{mutation_Pos-6} = randi([1, Boundary{7}], 1, Offspring{3}(mutation_Pos-6));   
        channel = mutation_Pos-6;
%     case {10, 11, 12} % PosH, PosW
%         Offspring{4}{mutation_Pos-9} = randi([1, Boundary{6}], 1, Offspring{3}(mutation_Pos-9));    
%         Offspring{5}{mutation_Pos-9} = randi([1, Boundary{7}], 1, Offspring{3}(mutation_Pos-9));   
%         channel = mutation_Pos-9;
    case {10, 11, 12} % cell automata generation
        Offspring{6}(mutation_Pos-9) = randi([Boundary{4}, Boundary{5}]);
        channel = mutation_Pos-9;
%     case {16, 17, 18} % pattern
%         Offspring{7}{mutation_Pos-15} = randi([0, 1],2*Offspring{2}(mutation_Pos-15)+1, 2*Offspring{2}(mutation_Pos-15)+1);
%         channel = mutation_Pos-15;
end

end

