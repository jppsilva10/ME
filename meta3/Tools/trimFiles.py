import os

#Study Variables

print("Trimming Files...")

os.system("mkdir -p lowTestsV2/trimFiles")
for filename in os.listdir("./lowTestsV2"):
    if ".txt" in filename:
        print(filename)
        os.system(fr"sed '$!N;s/\n/\t/' lowTestsV2/{filename} > 'lowTestsV2/trimFiles/{filename}'")
        #print(fr"sed '$!N;s/\n/\t/' {filename} > 'trimFiles/{filename}'")
print("Done.")
