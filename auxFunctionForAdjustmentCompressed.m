function auxFunctionForAdjustmentCompressed()
%%Test a more selective set of params values over a traffic simulator that has more cars per iteration. 

clc;
separatorStr = '________________________________________';
inputStr = 'Input parameters: ';

for tam=[ 30 40 50 ]
    for p_selection=[0.2 0.3 0.4 0.9]
        disp(separatorStr)
        inputLine = [inputStr, 'size and iterations: ', num2str(tam), 'p_selection:', num2str(p_selection)];
        disp(inputLine)
        
        tic
        [maxArray,meanArray] = genetic_algoritm(tam,p_selection,tam);
        toc
        
        outputLine =['Max fitness value:', num2str(max(maxArray)), ' Mean fitness value:', num2str(mean(meanArray))];
        disp(outputLine)
       
    end
end

%%BEST PARAM VALUES (DIFF MAX-MEAN < 0.1)
%%size: 40 p_selection 0.2
%%size: 50 p_selection 0.2


end