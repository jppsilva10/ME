###
##   Executing Code1 and Code2 with:
##   Exams: 10  20 30
##   Prob:  10% 15% 20%
##
###
import os
import random
import time

MAX_TIME = 750 # In seconds

print("Executing Codes Started...")

for i in range(30):
    print(f"Iteration {i}")
    for ex in range(15,36,5):
        print(f"Testing {ex} Exams")
        for prob in range(15,36,5):

            print(f"\tWith {prob}% Probability")

            #Randomization of Seed Gen1
            random.seed(time.time())
            seedGen = str(random.random()).split('.')[1]

            #Creation of Generation 1
            os.system(f'python3 code/gen.py {ex} {prob/100} {seedGen} lowTestsV2/gens/gen{ex}_{prob}.txt')

            #Randomization of Seed Code1
            random.seed(time.time())
            seedCode = str(random.random()).split('.')[1]

            #Execution of Code1
            os.system(f'code/code1 {seedCode} {MAX_TIME} lowTestsV2/gens/gen{ex}_{prob}.txt >> lowTestsV2/code1_{ex}_{prob}.txt')
            os.system(f'echo "{seedGen} {seedCode}" >> lowTestsV2/code1_{ex}_{prob}.txt')

            #Randomization of Seed Gen2
            random.seed(time.time())
            seedGen = str(random.random()).split('.')[1]

            #Creation of Generation 2
            os.system(f'python3 code/gen.py {ex} {prob/100} {seedGen} lowTestsV2/gens/gen{ex}_{prob}.txt')

            #Randomization of Seed Code2
            random.seed(time.time())
            seedCode = str(random.random()).split('.')[1]

            #Execution of Code2
            os.system(f'code/code2 {seedCode} {MAX_TIME} lowTestsV2/gens/gen{ex}_{prob}.txt >> lowTestsV2/code2_{ex}_{prob}.txt')
            os.system(f'echo "{seedGen} {seedCode}" >> lowTestsV2/code2_{ex}_{prob}.txt')
