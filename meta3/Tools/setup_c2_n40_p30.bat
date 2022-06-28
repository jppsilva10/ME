for /l %%x in (2801, 1, 2830) do (
   python gen.py 40 0.3 %%x input.txt
   call code2.exe %%x 1000 input.txt >> output2_n40_p30.txt
)