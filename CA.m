% FILEPATH: /F:/seamless/Undetermined/CA.m
% BEGIN: ed8c6549bwf9
clc, clear all;
% END: ed8c6549bwf9
% Ԫ���Զ����Ĵ�С
rows = 50;
cols = 50;

% ��ʼ��Ԫ���Զ���״̬
cellularAutomaton = randi([0, 1], rows, cols);

% ��������Ԫ���Զ���״̬
numIterations = 100;
for iteration = 1:numIterations
    % ��ʾ��ǰ������Ԫ���Զ���״̬
    imagesc(cellularAutomaton);
    colormap(gray);
    title(sprintf('Iteration: %d', iteration));
    pause(0.1);
    
    % ����Ԫ���Զ���״̬
    newCellularAutomaton = zeros(rows, cols);
    for i = 1:rows
        for j = 1:cols
            % ��ȡԪ����Χ���ھ�״̬
            neighbors = getNeighbors(cellularAutomaton, i, j);
            
            % ��������������Ԫ��״̬
            newCellularAutomaton(i, j) = updateCellState(cellularAutomaton(i, j), neighbors);
        end
    end
    
    % ����Ԫ���Զ���״̬
    cellularAutomaton = newCellularAutomaton;
end

% ��ȡԪ����Χ���ھ�״̬
function neighbors = getNeighbors(cellularAutomaton, row, col)
    [rows, cols] = size(cellularAutomaton);
    
    % �����ھӵ����λ��
    offsets = [-1, -1; -1, 0; -1, 1; 0, -1; 0, 1; 1, -1; 1, 0; 1, 1];
    
    % ��ʼ���ھ�״̬
    neighbors = zeros(1, 8);
    
    % �����ھӵ�״̬
    for k = 1:8
        newRow = row + offsets(k, 1);
        newCol = col + offsets(k, 2);
        
        % �߽紦��
        if newRow >= 1 && newRow <= rows && newCol >= 1 && newCol <= cols
            neighbors(k) = cellularAutomaton(newRow, newCol);
        end
    end
end

% ��������������Ԫ��״̬
function newState = updateCellState(currentState, neighbors)
    % �����������
    rule = randi([0, 1], 1, 9);
    
    % �����µ�Ԫ��״̬
    newState = rule(5); % Ĭ��״̬Ϊ����Ԫ����״̬
    
    % �����ھ�״̬����Ԫ��״̬
    if currentState == 1
        newState = rule(sum(neighbors) + 1);
    end
end
