for /l %%x in (1901, 1, 1930) do (
   python gen.py 40 0.4 %%x input.txt
   call code1.exe %%x 1000 input.txt >> output1_n40_p40.txt
)