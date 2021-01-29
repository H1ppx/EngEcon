% Copyright (c) 2021, William Chu

classdef EngEconUtils
    
    methods(Static)

        % Optimal Demand when Demand is a Function of Price
        function [sellingPrice, maxProfitDemand, maxProfit, profitRange] = ProfitAnalysis(a_coefficient, b_coefficient, variableCost, fixedCost)
            maxProfitDemand = (a_coefficient-variableCost)/(2*b_coefficient);
            sellingPrice = a_coefficient-b_coefficient*maxProfitDemand;
            maxProfit = -b_coefficient*maxProfitDemand^2+(a_coefficient-variableCost)*maxProfitDemand-fixedCost; 
            profitRange = sort(roots([(-b_coefficient) (a_coefficient-variableCost) (-fixedCost)]));
        
        end
        
        % Breakeven Point when Price is Independent of Demand
        function breakevenPoint = Breakeven(sellingPrice, variableCost, fixedCost)
            breakevenPoint = fixedCost/(sellingPrice-variableCost);
        end
        
    end
end