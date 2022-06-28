for /l %%x in (2601, 1, 2630) do (
   python gen.py 35 0.4 %%x input.txt
   call code2.exe %%x 1000 input.txt >> output2_n35_p40.txt
)