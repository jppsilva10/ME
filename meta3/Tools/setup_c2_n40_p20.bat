for /l %%x in (2701, 1, 2730) do (
   python gen.py 40 0.2 %%x input.txt
   call code2.exe %%x 1000 input.txt >> output2_n40_p20.txt
)