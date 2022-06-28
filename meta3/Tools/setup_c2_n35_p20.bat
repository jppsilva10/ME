for /l %%x in (2401, 1, 2430) do (
   python gen.py 35 0.2 %%x input.txt
   call code2.exe %%x 1000 input.txt >> output2_n35_p20.txt
)