for /l %%x in (2501, 1, 2530) do (
   python gen.py 35 0.3 %%x input.txt
   call code2.exe %%x 1000 input.txt >> output2_n35_p30.txt
)