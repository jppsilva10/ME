for /l %%x in (1501, 1, 1530) do (
   python gen.py 35 0.3 %%x input.txt
   call code1.exe %%x 1000 input.txt >> output1_n35_p30.txt
)