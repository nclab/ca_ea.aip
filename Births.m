function [ op ] = Births( CellD, h, w, Birth, level)
%BIRTHS Summary of this function goes here
%   Detailed explanation goes here
Sz = size(CellD);
Height = Sz(1);
Width = Sz(2);
lowerH = max(h-level, 1);
upperH = min(Height, h+level);
lowerW = max(w-level, 1);
upperW = min(Width, w+level);
if CellD(h, w) == 1
    op = 0;
    return;
end
if sum(sum(CellD(lowerH:upperH, lowerW:upperW)))-CellD(h, w) == Birth
    op = 1;
else
    op = 0;
end
end

