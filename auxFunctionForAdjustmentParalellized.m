function auxFunctionForAdjustmentParalellized()
%%Test a more selective set of params values over a traffic simulator that has more cars per iteration. 

clc;
separatorStr = '________________________________________';
inputStr = 'Input parameters: ';
p_set=[0.2 0.3 0.4 0.5 0.6]

for tam=[ 30 40 50 70 100]
    for  i=1:5
       
        p_selection = p_set(i);
        
        disp(separatorStr)
        inputLine = [inputStr, 'size: ', num2str(tam), 'p_selection:', num2str(p_selection)];
        disp(inputLine)
        
        tic
        [maxArray,meanArray] = genetic_algoritm(tam,p_selection,tam);
        toc
       
        outputLine =['Max fitness value:', num2str(max(maxArray)), ' Mean fitness value:', num2str(mean(meanArray))];
        disp(outputLine)
       
        

    end
end


end