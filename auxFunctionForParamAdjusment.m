function auxFunctionForParamAdjusment()

%%Shows size of population, p_selection and performance time for each
%%considered value. 
clc;
separatorStr = '________________________________________';
inputStr = 'Input parameters: ';

for tam=[ 30 40 50 70 100 ]
    for p_selection=[0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9]
        disp(separatorStr)
        inputLine = [inputStr, 'size and iterations: ', num2str(tam), 'p_selection:', num2str(p_selection)];
        disp(inputLine)
        timeArray=[];
        maxMatrix=[];
        meanMatrix=[];
        for i=1:10
            tic
            [maxArray,meanArray] = genetic_algoritm(tam,p_selection,tam);
            timeArray = [timeArray; toc];
            maxMatrix =[maxMatrix; max(maxArray)];
            meanMatrix =[meanMatrix; mean(meanArray)];
        end
        outputLine =['Max fitness value:', num2str(max(maxMatrix)), ' Mean fitness value:', num2str(mean(meanMatrix))];
        disp(outputLine)
        performanceLine=['Mean Performance Time: ', num2str(mean(timeArray))];
        disp(performanceLine)
    end
end

%% FIRST BEST PERFORMANCE PARAMS: (mean fitness >0,2 & mean performance time < 60s)
%% tam:30 p_selection:[0.2 0.3 0.4]
%% tam:40 p_selection:[0.3 0.9]
%% tam:50 p_selection:[0.4]


end