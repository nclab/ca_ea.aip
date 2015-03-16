function varargout = ES(varargin)
% ES MATLAB code for ES.fig
%      ES, by itself, creates a new ES or raises the existing
%      singleton*.
%
%      H = ES returns the handle to a new ES or the handle to
%      the existing singleton*.
%
%      ES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ES.M with the given input arguments.
%
%      ES('Property','Value',...) creates a new ES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ES_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ES_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ES

% Last Modified by GUIDE v2.5 24-Nov-2014 16:51:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ES_OpeningFcn, ...
                   'gui_OutputFcn',  @ES_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ES is made visible.
function ES_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ES (see VARARGIN)

% Choose default command line output for ES
handles.output = hObject;
handles.Img = 0;
handles.ParentImg = 0;
handles.OffspringImg = 0;
handles.Parent = cell(1, 8);
handles.Parent{1} = zeros(1, 3); % Birth
handles.Parent{2} = zeros(1, 3); % Level
handles.Parent{3} = zeros(1, 3); % number of Pattern Pos
handles.Parent{4} = cell(1, 3); % PosH
handles.Parent{5} = cell(1, 3); % PosW
handles.Parent{6} = zeros(1, 3); % Cell Generation
handles.Parent{7} = cell(1, 3); % Pattern
handles.Offspring = cell(1, 8);
handles.Offspring{1} = zeros(1, 3); % Birth
handles.Offspring{2} = zeros(1, 3); % Level
handles.Offspring{3} = zeros(1, 3); % number of Pattern Pos
handles.Offspring{4} = cell(1, 3); % PosH
handles.Offspring{5} = cell(1, 3); % PosW
handles.Offspring{6} = zeros(1, 3); % Cell Generation
handles.Offspring{7} = cell(1, 3); % Pattern
handles.Boundary = cell(1, 7); % Birth, Level, # of CellBlocks, MinCAG, MaxCAG, Image Size
handles.GenerationCount = 0;
if exist('iES', 'dir') ~= 7
    mkdir('iES');
end
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ES wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ES_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function BirthVal_Callback(hObject, eventdata, handles)
% hObject    handle to BirthVal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of BirthVal as text
%        str2double(get(hObject,'String')) returns contents of BirthVal as a double


% --- Executes during object creation, after setting all properties.
function BirthVal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BirthVal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LevelVal_Callback(hObject, eventdata, handles)
% hObject    handle to LevelVal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LevelVal as text
%        str2double(get(hObject,'String')) returns contents of LevelVal as a double


% --- Executes during object creation, after setting all properties.
function LevelVal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LevelVal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CellBlocksVal_Callback(hObject, eventdata, handles)
% hObject    handle to CellBlocksVal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CellBlocksVal as text
%        str2double(get(hObject,'String')) returns contents of CellBlocksVal as a double


% --- Executes during object creation, after setting all properties.
function CellBlocksVal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CellBlocksVal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MinCAGVal_Callback(hObject, eventdata, handles)
% hObject    handle to MinCAGVal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MinCAGVal as text
%        str2double(get(hObject,'String')) returns contents of MinCAGVal as a double


% --- Executes during object creation, after setting all properties.
function MinCAGVal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MinCAGVal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MaxCAGVal_Callback(hObject, eventdata, handles)
% hObject    handle to MaxCAGVal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MaxCAGVal as text
%        str2double(get(hObject,'String')) returns contents of MaxCAGVal as a double


% --- Executes during object creation, after setting all properties.
function MaxCAGVal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MaxCAGVal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ImgRead.
function ImgRead_Callback(hObject, eventdata, handles)
% hObject    handle to ImgRead (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% [filename, user_canceled] = imgetfile;
% if user_canceled
%     return;
% end
filename = 'lenna.png';
Img = imread(filename);
handles.Img = Img;
axes(handles.Original);
image(double(handles.Img)/255);
guidata(hObject, handles);


% --- Executes on button press in Sellambda.
function Sellambda_Callback(hObject, eventdata, handles)
% hObject    handle to Sellambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imwrite(handles.ParentImg, ['iEA/G', num2str(handles.GenerationCount), '.jpg']);
[handles.Offspring, cc] = Mutation(handles.Parent, handles.Boundary);
guidata(hObject, handles);
offspring = handles.ParentImg;
[offspring(:, :, cc), ta, tb, tc, td, te] = GUILogicRule(handles.Img, cc, handles.Offspring{1}(cc), handles.Offspring{2}(cc), handles.Offspring{3}(cc), handles.Offspring{6}(cc), 1, handles.Offspring{4}{cc}, handles.Offspring{5}{cc}, handles.Offspring{7}{cc});
axes(handles.mu);
image(offspring);
handles.GenerationCount = handles.GenerationCount +1;
handles.OffspringImg = offspring;
guidata(hObject, handles);
set(handles.Generation, 'string', strcat('Generation: ', num2str(handles.GenerationCount)));


% --- Executes on button press in Selmu.
function Selmu_Callback(hObject, eventdata, handles)
% hObject    handle to Selmu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imwrite(handles.OffspringImg, ['iEA/G', num2str(handles.GenerationCount), '.jpg']);
[handles.Parent, cc] = Mutation(handles.Offspring, handles.Boundary);
guidata(hObject, handles);
Parent = handles.OffspringImg;
[Parent(:, :, cc), ta, tb, tc, td, te] = GUILogicRule(handles.Img, cc, handles.Parent{1}(cc), handles.Parent{2}(cc), handles.Parent{3}(cc), handles.Parent{6}(cc), 1, handles.Parent{4}{cc}, handles.Parent{5}{cc}, handles.Parent{7}{cc});
axes(handles.lambda);
image(Parent);
handles.GenerationCount = handles.GenerationCount +1;
handles.ParentImg = Parent;
guidata(hObject, handles);
set(handles.Generation, 'string', strcat('Generation: ', num2str(handles.GenerationCount)));


% --- Executes on button press in Start.
function Start_Callback(hObject, eventdata, handles)
% hObject    handle to Start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.GenerationCount = 1;
Parent = zeros(size(handles.Img));
Sz = size(handles.Img);
Birth = str2double(get(handles.BirthVal, 'string'));
Level = str2double(get(handles.LevelVal, 'string'));
NumCellBlocks = str2double(get(handles.CellBlocksVal, 'string'));
MinCAG = str2double(get(handles.MinCAGVal, 'string'));
MaxCAG = str2double(get(handles.MaxCAGVal, 'string'));
for cc=1:3
    CellGen = randi([MinCAG, MaxCAG]);
    PosH = randi([1, Sz(1)], 1, NumCellBlocks);
    PosW = randi([1, Sz(2)], 1, NumCellBlocks);
    [Parent(:, :, cc), handles.Parent{6}(cc), handles.Parent{1}(cc), handles.Parent{2}(cc), handles.Parent{3}(cc), handles.Parent{7}{cc}] = GUILogicRule(handles.Img, cc, Birth, Level, NumCellBlocks, CellGen, 0, PosH, PosW, 0);
    handles.Parent{4}{cc} = PosH;
    handles.Parent{5}{cc} = PosW;
    guidata(hObject, handles);
end
handles.Boundary{1} = Birth;
handles.Boundary{2} = Level;
handles.Boundary{3} = NumCellBlocks;
handles.Boundary{4} = MinCAG;
handles.Boundary{5} = MaxCAG;
handles.Boundary{6} = Sz(1);
handles.Boundary{7} = Sz(2);
guidata(hObject, handles);
handles.Offspring = Mutation(handles.Parent, handles.Boundary);
guidata(hObject, handles);
offspring = zeros(Sz);
for cc=1:3
     [offspring(:, :, cc), ta, tb, tc, td, te] = GUILogicRule(handles.Img, cc, handles.Offspring{1}(cc), handles.Offspring{2}(cc), handles.Offspring{3}(cc), handles.Offspring{6}(cc), 1, handles.Offspring{4}{cc}, handles.Offspring{5}{cc}, handles.Offspring{7}{cc});
end
handles.ParentImg = Parent;
handles.OffspringImg = offspring;
guidata(hObject, handles);
axes(handles.lambda);
image(Parent);
axes(handles.mu);
image(offspring);
set(handles.Generation, 'string', strcat('Generation: ', num2str(handles.GenerationCount)));
