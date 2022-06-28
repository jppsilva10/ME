for /l %%x in (2901, 1, 2930) do (
   python gen.py 40 0.4 %%x input.txt
   call code2.exe %%x 1000 input.txt >> output2_n40_p40.txt
)