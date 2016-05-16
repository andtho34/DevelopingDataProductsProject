generatePrediction <- function(cement, water, fineaggregate, coarseaggregate){
        library(AppliedPredictiveModeling)
        data(concrete)
        mod <- lm(CompressiveStrength ~ Cement+Water+FineAggregate+CoarseAggregate, data=concrete)
        pred <- predict(mod, newdata=data.frame(Cement=cement, Water=water, FineAggregate=fineaggregate, CoarseAggregate=coarseaggregate))
        print(pred)
}