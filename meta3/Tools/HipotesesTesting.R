
RandTest <- function(B, A) {
  t = mean(A) - mean(B)
  C = c(A,B)
  pvalue = 0
  for (i in 1:5000){
    D = sample(C)
    tD = mean(D[1:30]) - mean(D[31:60])
    if (tD >= t){
      pvalue = pvalue + 1
    }
  }
  print(pvalue/5000)
  
}


RandomizationTest <- function(dataframe){
  D = dataframe
  
  aov.out  = aov(Time ~ Code * Exams * Prob, data=D)
  FC = summary(aov.out)[[1]]$F[1]
  FE = summary(aov.out)[[1]]$F[2]
  FP = summary(aov.out)[[1]]$F[3]
  FCE = summary(aov.out)[[1]]$F[4]
  FCP = summary(aov.out)[[1]]$F[5]
  FEP = summary(aov.out)[[1]]$F[6]
  FCEP = summary(aov.out)[[1]]$F[7]
  pvalueC = 0
  pvalueE = 0
  pvalueP = 0
  pvalueCE = 0
  pvalueCP = 0
  pvalueEP = 0
  pvalueCEP = 0
  
  for (i in 1:5000){
    D$Time = sample(D$Time)
    aov.out = aov(Time ~ Code * Exams * Prob, data=D)
    pFC = summary(aov.out)[[1]]$F[1]
    pFE = summary(aov.out)[[1]]$F[2]
    pFP = summary(aov.out)[[1]]$F[3]
    pFCE = summary(aov.out)[[1]]$F[4]
    pFCP = summary(aov.out)[[1]]$F[5]
    pFEP = summary(aov.out)[[1]]$F[6]
    pFCEP = summary(aov.out)[[1]]$F[7]
    
    if(pFC >= FC)
      pvalueC = pvalueC +1
    if(pFE >= FE)
      pvalueE = pvalueE +1
    if(pFP >= FP)
      pvalueP = pvalueP +1
    if(pFCE >= FCE)
      pvalueCE = pvalueCE +1
    if(pFCP >= FCP)
      pvalueCP = pvalueCP +1
    if(pFEP >= FEP)
      pvalueEP = pvalueEP +1
    if(pFCEP >= FCEP)
      pvalueCEP = pvalueCEP +1
  }
  
  print(pvalueC/5000)
  print(pvalueE/5000)
  print(pvalueP/5000)
  print(pvalueCE/5000)
  print(pvalueCP/5000)
  print(pvalueEP/5000)
  print(pvalueCEP/5000)
  
}

PostHoc <- function(E, P, dataframe, Factor1, Factor2){
  D = dataframe
  for(i in E){
    for(j in P){
      print(paste("code1:", i, ":", j, "-code2:", i, ":", j, sep=""))
      
      x = D[D$Code == Factor1 & D$Exams == i & D$Prob == j,]$Time
      y = D[D$Code == Factor2 & D$Exams == i & D$Prob == j,]$Time
      
      RandTest(x, y)
    }
  }
}





D1 = Data1
D1$Exams = as.character(D1$Exams)
D1$Prob = as.character(D1$Prob)

D2 = Data2
D2$Exams = as.character(D2$Exams)
D2$Prob = as.character(D2$Prob)

# 3-way ANOVA

aov.out = aov(Time ~ Code * Exams * Prob, data = D1)
summary(aov.out)

aov.out = aov(Time ~ Code * Exams * Prob, data = D2)
summary(aov.out)

# ver pressupostos
aov.out = aov(Time ~ Code * Exams * Prob, data = D1)
plot(aov.out)

aov.out = aov(Time ~ Code * Exams * Prob, data = D2)
plot(aov.out)


# Randomization test
RandomizationTest(D1)

RandomizationTest(D2)

# Post-hoc
E <- c("30", "35", "40")
P <- c("20", "30", "40")

PostHoc(E, P, D1, "code1", "code2")


E <- c("10", "20", "30")
P <- c("5", "15", "25")

PostHoc(E, P, D2, "code2", "code1")
