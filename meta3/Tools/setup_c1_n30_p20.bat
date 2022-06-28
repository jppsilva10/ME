for /l %%x in (1101, 1, 1130) do (
   python gen.py 30 0.2 %%x input.txt
   call code1.exe %%x 1000 input.txt >> output1_n30_p20.txt
)