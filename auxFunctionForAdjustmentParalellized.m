function auxFunctionForAdjustmentParalellized()
%%Test a more selective set of params values over a traffic simulator that has more cars per iteration. 

clc;
separatorStr = '________________________________________';
inputStr = 'Input parameters: ';
parpool
for tam=[ 30 40 50 70 100]
    for p_selection=[0.2 0.3 0.4 ]
       
       
        parfor i=1:2
        disp(separatorStr)
        inputLine = [inputStr, 'size: ', num2str(tam), 'p_selection:', num2str(p_selection), 'iterations: ',num2str(tam*i)];
        disp(inputLine)
        
        tic
        [maxArray,meanArray] = genetic_algoritm(tam,p_selection,i*tam);
        toc
       
        outputLine =['Max fitness value:', num2str(max(maxArray)), ' Mean fitness value:', num2str(mean(meanArray))];
        disp(outputLine)
       
        end

    end
end


end