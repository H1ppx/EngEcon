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
        
        % Price of item taken from historical data with a specified base year and updated withan index.
        function [estimatedCost] = RatioTechnique(costInReferenceYear, indexAtReferenceYear, indexAtEstimatedYear)
            estimatedCost = costInReferenceYear * (indexAtReferenceYear/indexAtEstimatedYear);
        end
        
        % Sum the product of several quantities or components and add these to any components estimated directly
        function [estimatedCost] = FactorTechnique(costofSelectedComponent, unitCost, amountOfUnits)
            estimatedCost = costofSelectedComponent+(unitCost*amountOfUnits);
        end
        
        % Power Sizing Technique estimating cost
        function [estimatedCostA] = PowerSizingTechniqueCost(sizeA, sizeB, costB, costCapacityFactor)
            estimatedCostA = costB*(sizeA/sizeB)^costCapacityFactor;
        end
        
        % Power Sizing Technique estimating capacity factor
        function [costCapacityFactor] = PowerSizingTechniqueCostCapacityFactor(sizeA, sizeB, costA, costB)
            costCapacityFactor = log10(costA/costB)/log10(sizeA/sizeB);
        end
        
        function [futureSum] = FGivenP(presentSum, interestRate, periods)
            futureSum = presentSum*(1+interestRate)^periods;
        end
        
        function [presentSum] = PGivenF(futureSum, interestRate, periods)
            presentSum = futureSum*(1/(1+interestRate))^periods;
        end
       
        function [interestRate] = IGivenPFN(presentSum, futureSum, periods)
            interestRate = nthroot(futureSum/presentSum,periods)-1;
        end
        
        function [periods] = NGivenPFI(presentSum, futureSum, interestRate)
            periods = log10(futureSum/presentSum)/log10(1+interestRate);
        end
        
        function [futureSum] = FGivenA(a, interestRate, periods)
            futureSum = a*(((1+interestRate)^periods-1)/interestRate);
        end
        
        function [presentSum] = PGivenA(a, interestRate, periods)
            presentSum = a*(((1+interestRate)^periods-1)/(interestRate*(1+interestRate)^periods));
        end
        
        function [a] = AGivenF(futureSum, interestRate, periods)
            a = futureSum*(interestRate/(((1+interestRate)^periods)-1));
        end
        
        function [a] = AGivenP(presentSum, interestRate, periods)
            a = presentSum*((interestRate*((1+interestRate)^periods))/(((1+interestRate)^periods)-1));
        end
        
    end
end