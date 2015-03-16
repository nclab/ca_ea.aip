function [ opImgCell ] = CAPainting( Img, mu, lambda, Generation, Boundary )
%CAPAINTING Summary of this function goes here
%   Detailed explanation goes here
Img = double(Img);
Sz = size(Img);
Pop = cell(1, mu+lambda);
Result = cell(1, mu+lambda);
if exist('Save', 'dir') ~= 7
    mkdir('Save');
end
% initialize first population
for i=1:mu+lambda
    if i<= mu
        Pop{i} = cell(1, 7);
        Pop{i}{1} = randi([1, Boundary{1}], 1, 3); % Birth
        Pop{i}{2} = randi([1, Boundary{2}], 1, 3); % Level
        Pop{i}{3} = randi([1, Boundary{3}], 1, 3); % number of Pattern Pos
        Pop{i}{6} = randi([Boundary{4}, Boundary{5}], 1, 3); % Cell Generation
        Pop{i}{4} = cell(1, 3); % PosH
        Pop{i}{5} = cell(1, 3); % PosW
        Pop{i}{7} = cell(1, 3); % Pattern
        for j=1:3
            Pop{i}{4}{j} = randi([1, Boundary{6}], 1, Pop{i}{3}(j));  
            Pop{i}{5}{j} = randi([1, Boundary{7}], 1, Pop{i}{3}(j));
            Pop{i}{7}{j} = randi([0, 1],2*Pop{i}{2}(j)+1, 2*Pop{i}{2}(j)+1);
        end
        Result{i} = zeros(Sz);
        for cc=1:3
         [Result{i}(:, :, cc), ta, tb, tc, td, te] = GUILogicRule(Img, cc, Pop{i}{1}(cc), Pop{i}{2}(cc), Pop{i}{3}(cc), Pop{i}{6}(cc), 1, Pop{i}{4}{cc}, Pop{i}{5}{cc}, Pop{i}{7}{cc});
        end
    else
        Pop{i} = cell(1, 7);
        Result{i} = zeros(Sz);
    end
end
% end initialize    

Fit = Fitness(Result);


for g=1:Generation
    % tournament size = 2;
    SelCounter = 1;
    selectMutation = zeros(1, mu);
    for sel=1:mu
        selectArray = randi([1, mu], 1, 2);
        if Fit(selectArray(1)) > Fit(selectArray(2))
            selectMutation(SelCounter) = selectArray(1);
            SelCounter = SelCounter +1;
        else
            selectMutation(SelCounter) = selectArray(2);
            SelCounter = SelCounter +1;
        end
    end
    for mutate=1:lambda
        [Pop{mu+mutate}, cc] = Mutation(Pop{selectMutation(mutate)}, Boundary);
        Result{mu+mutate} = Result{selectMutation(mutate)};
        [Result{mu+mutate}(:, :, cc), ta, tb, tc, td, te] = GUILogicRule(Img, cc, Pop{mu+mutate}{1}(cc), Pop{mu+mutate}{2}(cc), Pop{mu+mutate}{3}(cc), Pop{mu+mutate}{6}(cc), 1, Pop{mu+mutate}{4}{cc}, Pop{mu+mutate}{5}{cc}, Pop{mu+mutate}{7}{cc});
    end    
    Fit = Fitness(Result);
    % survivor selection
    [Fit,sortIndex] = sort(Fit(:),'descend'); 
    Fit = [Fit(1:mu)', zeros(1, lambda)];
    selectParent = sortIndex(1:mu);   
    newPop = cell(1, mu+lambda);
    newRes = cell(1, mu+lambda);
    for wrt=1:mu+lambda
        if wrt <= mu
            imwrite(Result{wrt}, ['Save/G', num2str(g), 'Parent', num2str(wrt), '.jpg']);
        else
            imwrite(Result{wrt}, ['Save/G', num2str(g), 'Child', num2str(wrt-mu), '.jpg']);
        end
    end
    for i=1:mu+lambda
        if i<= mu
            newPop{i} = Pop{selectParent(i)};
            newRes{i} = Result{selectParent(i)};
        else
            newPop{i} = cell(1, 7);
            newRes{i} = zeros(Sz);
        end
    end
    Pop = newPop;
    Result = newRes;
end

opImgCell = Result;

end

