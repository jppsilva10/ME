for /l %%x in (1701, 1, 1730) do (
   python gen.py 40 0.2 %%x input.txt
   call code1.exe %%x 1000 input.txt >> output1_n40_p20.txt
)