for /l %%x in (1601, 1, 1630) do (
   python gen.py 35 0.4 %%x input.txt
   call code1.exe %%x 1000 input.txt >> output1_n35_p40.txt
)