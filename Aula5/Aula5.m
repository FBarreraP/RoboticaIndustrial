close all;
clear all;
clc;

oldobj = instrfind;     %elimina resquicios presentes na porta serial
if not(isempty(oldobj)) 
    fclose(oldobj);     
    delete(oldobj);
end

if ~exist('s','var')
    s = serial('COM2','BaudRate',9600,'DataBits',8,'Parity','None','StopBits',1);
end
if strcmp(get(s,'status'),'closed')
    fopen(s);
end

tic
% Apaga os dados iniciais
t_ini = toc; t = 0; 
while (t < 10)
    fprintf(s,'%s','O');
    pause(1);
    fprintf(s,'%s','F');
    pause(1);
    t = toc - t_ini;
end


while (1)
    r = fscanf(s);
    disp('ciclo');
    if(r == 'A')
       disp('break');
       break; 
    end
end

disp('chao');

% Fecha a comunicacao serial
fclose(s);