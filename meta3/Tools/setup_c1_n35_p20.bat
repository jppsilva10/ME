for /l %%x in (1401, 1, 1430) do (
   python gen.py 35 0.2 %%x input.txt
   call code1.exe %%x 1000 input.txt >> output1_n35_p20.txt
)