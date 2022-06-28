for /l %%x in (1201, 1, 1230) do (
   python gen.py 30 0.3 %%x input.txt
   call code1.exe %%x 1000 input.txt >> output1_n30_p30.txt
)