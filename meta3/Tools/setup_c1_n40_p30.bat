for /l %%x in (1801, 1, 1830) do (
   python gen.py 40 0.3 %%x input.txt
   call code1.exe %%x 1000 input.txt >> output1_n40_p30.txt
)