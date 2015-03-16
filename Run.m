

% clear

clear;

Img = imread('lenna.png');
Sz = size(Img);
Boundary = cell(1, 7);
Boundary{1} = 10;% Birth;
Boundary{2} = 5; % Level;
Boundary{3} = 500; % NumCellBlocks;
Boundary{4} = 20; % MinCAG;
Boundary{5} = 30; % MaxCAG;
Boundary{6} = Sz(1);
Boundary{7} = Sz(2);

% CAPainting(Img, mu, lambda, generation, boundary);
opCell = CAPainting(Img, 20, 10, 10, Boundary);
