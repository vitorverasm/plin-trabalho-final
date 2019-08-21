% Trabalho final - Programacao linear
% Equipe: Carlos Anderson e Vitor Veras

c = [8; 8; 9; 10; 1; 7; 2; 3; 8; 2; 8; 3; 5; 3; 3; 10; 4; 5; 7; 3; 9; 6; 4; 7; 3; 8; 4; 5; 1; 2; 3; 3; 5; 4; 9; 10; 8; 10; 4; 1]
% max -> min
% c = -1*c


A = [
    [1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
    [0 0 0 0 0 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
    [0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
    [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]; 
    [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
    [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0];
    [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 0 0 0 0 0];
    [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1];
    [1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0];
    [0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0];
    [0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0];
    [0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0];
    [0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1]]

b = [4; 3; 2; 3; 2; 2; 1; 3; 4; 4; 4; 4; 4]

% GLPK params
lb = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
ub = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
ctype = "SSSSSSSSSSSSS";
vartype = "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII";
% MAX
sense = -1;
param.msglev = 1;

[xopt, fopt, status] = glpk (c, A, b, lb, ub, ctype, vartype, sense, param);
xfinal = reshape(xopt, 5, 8)';

fprintf(1,'\n           S  T  Q  Q  S\n')
fprintf(1,'\nPaloma     %s', num2str(xfinal(1,:)))
fprintf(1,'\nLeonardo   %s', num2str(xfinal(2,:)))
fprintf(1,'\nAmanda     %s', num2str(xfinal(3,:)))
fprintf(1,'\nJoão Paulo %s', num2str(xfinal(4,:)))
fprintf(1,'\nRégis      %s', num2str(xfinal(5,:)))
fprintf(1,'\nGustavo    %s', num2str(xfinal(6,:)))
fprintf(1,'\nJéssica    %s', num2str(xfinal(7,:)))
fprintf(1,'\nRenan      %s\n', num2str(xfinal(8,:)))

fprintf(1,'\nCusto: %s\n', num2str(fopt))

