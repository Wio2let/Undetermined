% FILEPATH: /F:/seamless/Undetermined/CA.m
% BEGIN: ed8c6549bwf9
clc, clear all;
% END: ed8c6549bwf9
% 元胞自动机的大小
rows = 50;
cols = 50;

% 初始化元胞自动机状态
cellularAutomaton = randi([0, 1], rows, cols);

% 迭代更新元胞自动机状态
numIterations = 100;
for iteration = 1:numIterations
    % 显示当前迭代的元胞自动机状态
    imagesc(cellularAutomaton);
    colormap(gray);
    title(sprintf('Iteration: %d', iteration));
    pause(0.1);
    
    % 更新元胞自动机状态
    newCellularAutomaton = zeros(rows, cols);
    for i = 1:rows
        for j = 1:cols
            % 获取元胞周围的邻居状态
            neighbors = getNeighbors(cellularAutomaton, i, j);
            
            % 根据随机规则更新元胞状态
            newCellularAutomaton(i, j) = updateCellState(cellularAutomaton(i, j), neighbors);
        end
    end
    
    % 更新元胞自动机状态
    cellularAutomaton = newCellularAutomaton;
end

% 获取元胞周围的邻居状态
function neighbors = getNeighbors(cellularAutomaton, row, col)
    [rows, cols] = size(cellularAutomaton);
    
    % 定义邻居的相对位置
    offsets = [-1, -1; -1, 0; -1, 1; 0, -1; 0, 1; 1, -1; 1, 0; 1, 1];
    
    % 初始化邻居状态
    neighbors = zeros(1, 8);
    
    % 计算邻居的状态
    for k = 1:8
        newRow = row + offsets(k, 1);
        newCol = col + offsets(k, 2);
        
        % 边界处理
        if newRow >= 1 && newRow <= rows && newCol >= 1 && newCol <= cols
            neighbors(k) = cellularAutomaton(newRow, newCol);
        end
    end
end

% 根据随机规则更新元胞状态
function newState = updateCellState(currentState, neighbors)
    % 定义随机规则
    rule = randi([0, 1], 1, 9);
    
    % 计算新的元胞状态
    newState = rule(5); % 默认状态为中心元胞的状态
    
    % 根据邻居状态更新元胞状态
    if currentState == 1
        newState = rule(sum(neighbors) + 1);
    end
end
