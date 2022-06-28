for /l %%x in (1301, 1, 1330) do (
   python gen.py 30 0.4 %%x input.txt
   call code1.exe %%x 1000 input.txt >> output1_n30_p40.txt
)