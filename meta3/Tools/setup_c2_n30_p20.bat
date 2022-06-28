for /l %%x in (2101, 1, 2130) do (
   python gen.py 30 0.2 %%x input.txt
   call code2.exe %%x 1000 input.txt >> output2_n30_p20.txt
)