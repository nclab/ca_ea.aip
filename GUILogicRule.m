function [ op_img, max_cell_generation, Birth, Level, nPos, Pattern ] = GUILogicRule(Img, cc, MaxBirth, MaxLevel, MaxPos, CellGen, fixed, PosH, PosW, Pattern)
%BRAINLOGIC Cellular Automata function
%------------------------------------------------------------
% Author: Hsuan-Wen Tseng
% Date: 2014/10/4
% Introduction: cellular automata photo rendering with Logic rule
%-------------------------------------------------------------


% parameter initialization-----------------------------------
% maximum cell generation
max_cell_generation = CellGen;
if fixed ~= 1
    Birth = randi([1, MaxBirth]);
    Level = randi([1, MaxLevel]);
    nPos = randi([1, MaxPos]);
else
    Birth = MaxBirth;
    Level = MaxLevel;
    nPos = MaxPos;
end
% end--------------------------------------------------------


% preprocessing----------------------------------------------
% data type transfer
Img = double(Img);
% get image size 
Sz = size(Img);
% initailize Canvas
Canvas = zeros(Sz);
% get image height
Height = Sz(1);
% get image width
Width = Sz(2);
% initialize cell domain
CellD = zeros(Height, Width);
% Pattern
if Pattern == 0
    Pattern = randi([0, 1],2*Level+1, 2*Level+1);
end
% end--------------------------------------------------------

% main program------------------------------------------------

for i=1:nPos  
     lowerH = max(1, PosH(i)-Level);
     upperH = min(Height, PosH(i)+Level);
     lowerW = max(1, PosW(i)-Level);
     upperW = min(Width, PosW(i)+Level);
     CellD(lowerH:upperH, lowerW:upperW) = Pattern(1:(upperH-lowerH)+1, 1:(upperW-lowerW)+1);
end

for i=1:max_cell_generation
    temp_CD = zeros(Height, Width);
    [h, w] = find(CellD==0);
    for ind=1:length(h)
            lowerH = max(1, h(ind)-Level);
            upperH = min(Height, h(ind)+Level);
            lowerW = max(1, w(ind)-Level);
            upperW = min(Width, w(ind)+Level);
            temp_CD(h(ind), w(ind)) = Births(CellD, h(ind), w(ind), Birth, Level);
            if temp_CD(h(ind), w(ind)) == 1
                    % seperated RGB
                    %Canvas(lowerH:upperH, lowerW:upperW, cc) = min(255,  Canvas(lowerH:upperH, lowerW:upperW, cc) + 0.02 * getColor(h(ind), w(ind), Level, Img, cc)); 
                    Canvas(lowerH:upperH, lowerW:upperW, cc) = min(min(255, Img(h(ind), w(ind), cc)*1.25),  Canvas(lowerH:upperH, lowerW:upperW, cc) + 0.04 * getColor(h(ind), w(ind), Level, Img, cc)); 
            end
    end
    CellD = temp_CD;
end

op_img = Canvas(:, :, cc)/255;

end

